/* AMX Mod X script.
*
*   Ultimate Gore Enhancement (amx_gore_ultimate.sma)
*   Copyright (C) 2003-2004  mike_cao / fizzarum / jtp10181
*
*   This program is free software; you can redistribute it and/or
*   modify it under the terms of the GNU General Public License
*   as published by the Free Software Foundation; either version 2
*   of the License, or (at your option) any later version.
*
*   This program is distributed in the hope that it will be useful,
*   but WITHOUT ANY WARRANTY; without even the implied warranty of
*   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*   GNU General Public License for more details.
*
*   You should have received a copy of the GNU General Public License
*   along with this program; if not, write to the Free Software
*   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
*
*   In addition, as a special exception, the author gives permission to
*   link the code of this program with the Half-Life Game Engine ("HL
*   Engine") and Modified Game Libraries ("MODs") developed by Valve,
*   L.L.C ("Valve"). You must obey the GNU General Public License in all
*   respects for all of the code used other than the HL Engine and MODs
*   from Valve. If you modify this file, you may extend this exception
*   to your version of the file, but you are not obligated to do so. If
*   you do not wish to do so, delete this exception statement from your
*   version.
*
****************************************************************************
*
*   Version 1.3.3 - 09/25/2004
*
*   by jtp10181 <jtp@jtpage.net>
*   Homepage: http://www.jtpage.net
*
*   Original code by:
*     by mike_cao <mike@mikecao.com> (plugin_gore)
*     fizzarum <tntmr2gg2@icqmail.com> (plugin_gore2)
*
****************************************************************************
*
*   This plugin adds gore effects. It is configured
*   with the cvar "amx_gore" using these flags:
*
*   a - Headshot blood
*   b - Extra blood effects
*   c - Bleeding on low health
*   d - Gib explosion (HE and damage over 200)
*   e - Extra Gory Mode
*
*   Default is: amx_gore "abcd"
*
*   New CVAR: amx_gore_exphp (default 200)
*         The amount of health that must be lost upon death
*         for the player to "explode"
*
*   Add the cvars to your amxx.cfg to change it and have it load every map
*
*   *NOTE*: the decal indexes are pulled form the servers decals.wad  If you
*	do not have the orginal decals.wad (for your mod) on the server the
*	decals may not appear as blood, but arrows, numbers, text, etc.
*
*   v1.3.3 - JTP10181 - 09/25/04
*	- Made it really easy to change the weapons that cause explosion
*	- Minor code tweaks
*
*   v1.3.2 - JTP10181 - 09/24/04
*	- Fixed code to work on AMXModX 0.20
*	- Added new CVAR to adjust the HP loss that triggers a GIB explosion
*	- Used task for body hiding so items wont end up underground
*
*   v1.3.1 - JTP10181 - 06/02/04
*	- Fixed runtime error if victim is null on a damage or death event
*		Was happening in conjunction with superhero mod
*		Thanks to drummeridiot25 for testing it for me
*
*   v1.3 - JTP
*	- Automatic mod detection, no more recompiling for CZERO.
*	- Decal indexes verified for CZ, they work perfectly.
*	- Started working on DoD support
*
*   v1.2 - JTP
*	- Combined various gore plugins into one that has the best features
*		out of all of them.
*	- Plan to maintain this plugin if any issues/requests arrise.
*	- Added extra gory mode:
*		Classic headshot death with the sprays shooting up (from orginal plugin_gore)
*		More blood spraying on a gib explosion (from orginal plugin_gore)
*		Extra blood decals on damage and deaths
*	- Fixed divide by zero error in fx_blood and fx_gib_explode
*	- Minor tweaks here and there to some of the numbers
*	- Put in fix for CZERO decals from "euro" and "out" from AMX forums
*	- Fixed runtime error when the attacker was not able to be determinted.
*		get_user_origin was getting passed a "0" player index.
*
*
*   v1.03 - ( by fizzarum ) :
*	- Each hit now causes a blood stream depending on the positions of the
*		agressor and the victim.
*	- Reduce the previous headshot fx to a less extravagant thing
*	- The gib explosion now happens after a damage higher than 110 EVEN IF
*		the victim's head was hit
*	- A knife kill does not cause a gib explosion
*	- Minor changes on the bleeding effect, the position of the gibs
*
*   Thanks:
*	- mike_cao for the orginal plugin
*	- fizzarum on plugin_gore2.sma (for AMX)
*	- euro and out (AMX forums) for posting decal numbers for CZero
*	- SidLuke (AMX forums) for his version for DoD,
*		I grabbed some of that code for my DoD support
*
**************************************************************************/

#include <amxmodx>
#include <fun>

#define MAX_NAME_LENGTH 32
#define MAX_PLAYERS 32

#define GORE_HEADSHOT       (1<<0) // "a"
#define GORE_BLOOD          (1<<1) // "b"
#define GORE_BLEEDING       (1<<2) // "c"
#define GORE_GIB            (1<<3) // "d"
#define GORE_EXTRA          (1<<4) // "e"

#define TE_BLOODSPRITE        115
#define TE_BLOODSTREAM        101
#define TE_MODEL              106
#define TE_WORLDDECAL         116

/************************************************************
* MAIN
************************************************************/

new gHealthIndex[MAX_PLAYERS+1]

new mdl_gib_flesh
new mdl_gib_head
new mdl_gib_legbone
new mdl_gib_lung
new mdl_gib_meat
new mdl_gib_spine

new spr_blood_drop
new spr_blood_spray
new blood_small_num
new blood_large_num
new blood_small[8]
new blood_large[2]
new mod_name[32]

//Offsets to place blood is more realistic hit location
new Offset[8][3] = {{0,0,15},{0,0,30},{0,0,20},{0,0,12},{2,2,17},{2,2,17},{2,2,5},{2,2,5}}

// #####################################################################
// ##     Change which weapons cause GIB explosions on death HERE     ##
// #####################################################################

public gib_wpncheck(iWeapon) {

	switch (iWeapon) {
		case CSW_P228			: return false
		case CSW_SCOUT			: return false
		case CSW_HEGRENADE		: return true
		case CSW_XM1014		: return false
		case CSW_MAC10			: return false
		case CSW_AUG			: return false
		case CSW_SMOKEGRENADE	: return true
		case CSW_ELITE			: return false
		case CSW_FIVESEVEN		: return false
		case CSW_UMP45			: return false
		case CSW_SG550			: return false
		case CSW_GALI			: return false
		case CSW_FAMAS			: return false
		case CSW_USP			: return false
		case CSW_GLOCK18		: return false
		case CSW_AWP			: return false
		case CSW_MP5NAVY		: return false
		case CSW_M249			: return false
		case CSW_M3			: return false
		case CSW_M4A1			: return false
		case CSW_TMP			: return false
		case CSW_G3SG1			: return false
		case CSW_FLASHBANG		: return true
		case CSW_DEAGLE		: return false
		case CSW_SG552			: return false
		case CSW_AK47			: return false
		case CSW_P90			: return false
	}
	return false
}

// #####################################################################
// ##                     DO NOT EDIT BELOW HERE                      ##
// #####################################################################

public event_damage(iVictim)
{
	if (iVictim <= 0 || iVictim > MAX_PLAYERS) return

	new iFlags = get_gore_flags()
	new iWeapon, iHitPlace, iAgressor

	iAgressor = get_user_attacker(iVictim,iWeapon,iHitPlace)
	gHealthIndex[iVictim] = get_user_health(iVictim)

	//Check to make sure its a player
	if (iAgressor <= 0 || iAgressor > MAX_PLAYERS) {
		iAgressor = iVictim
		iWeapon = 0
		iHitPlace = 0
	}

	//Crash check
	if (iHitPlace < 0 || iHitPlace > 7) iHitPlace = 0

	if (iFlags&GORE_BLOOD) {
		new iOrigin[3]
		new iOrigin2[3]
		get_user_origin(iVictim,iOrigin)
		get_user_origin(iAgressor,iOrigin2)
		fx_blood(iOrigin,iOrigin2,iHitPlace)
		fx_blood_small(iOrigin,10)
		if (iFlags&GORE_EXTRA) {
			fx_blood(iOrigin,iOrigin2,iHitPlace)
			fx_blood(iOrigin,iOrigin2,iHitPlace)
			fx_blood(iOrigin,iOrigin2,iHitPlace)
			fx_blood_small(iOrigin,4)
		}
	}
}

public event_death()
{
	new iFlags = get_gore_flags()
	new iOrigin[3],iOrigin2[3]
	new sWeapon[MAX_NAME_LENGTH]
	new iVictim = read_data(2)
	new iHeadshot = read_data(3)

	if (iVictim <= 0 || iVictim > MAX_PLAYERS) return

	read_data(4,sWeapon,MAX_NAME_LENGTH)

	if (iFlags&GORE_HEADSHOT && iHeadshot) {
		get_user_origin(iVictim,iOrigin)
		fx_headshot(iOrigin)
	}

	new iWeapon, iHitPlace
	new iAgressor = get_user_attacker(iVictim,iWeapon,iHitPlace)

	if (iFlags&GORE_GIB && (gib_wpncheck(iWeapon) || equal(sWeapon,"grenade") || gHealthIndex[iVictim] - get_user_health(iVictim) > get_cvar_num("amx_gore_exphp"))) {

		//Check to make sure its a player
		if (iAgressor <= 0 || iAgressor > MAX_PLAYERS) {
			iAgressor = iVictim
			iWeapon = 0
			iHitPlace = 0
		}

		get_user_origin(iAgressor,iOrigin2)
		get_user_origin(iVictim,iOrigin)

		// Effects
		fx_trans(iVictim,0)
		fx_gib_explode(iOrigin,iOrigin2)
		fx_blood_large(iOrigin,4)
		fx_blood_small(iOrigin,12)
		if (iFlags&GORE_EXTRA) {
			fx_gib_explode(iOrigin,iOrigin2)
			fx_blood_large(iOrigin,2)
			fx_blood_small(iOrigin,4)
		}
		set_task(0.1,"hide_body",iVictim)
	}
}

public hide_body(id)
{
	if (!is_user_connected(id) || is_user_alive(id) ) return

	fx_trans(id,0)
	new iOrigin[3]
	get_user_origin(id,iOrigin)
	iOrigin[2] -= 20
	set_user_origin(id,iOrigin)
}

public event_blood()
{
	new iFlags = get_gore_flags()
	if (iFlags&GORE_BLEEDING) {
		new iPlayer, iPlayers[MAX_PLAYERS], iNumPlayers, iOrigin[3]
		get_players(iPlayers,iNumPlayers,"a")
		for (new i = 0; i < iNumPlayers; i++) {
			iPlayer = iPlayers[i]
			if (gHealthIndex[iPlayer] < 20) {
				get_user_origin(iPlayer,iOrigin)
				fx_bleed(iOrigin)
				fx_blood_small(iOrigin,5)
			}
		}
	}
}

public event_respawn(id)
{
	if (is_user_alive(id)) {
		//Prevents People from going invisible randomly
		fx_trans(id,255)
		//Save clients current Health
		gHealthIndex[id] = get_user_health(id)
	}
}

public event_roundstart(id)
{
	set_task(0.1,"roundstart_delay")
}

public roundstart_delay()
{
	for ( new id = 1; id <= MAX_PLAYERS; id++ ) {
		if (is_user_alive(id)) {
			//Prevents People from going invisible randomly
			fx_trans(id,255)
			//Save clients current Health
			gHealthIndex[id] = get_user_health(id)
		}
	}
}

public get_gore_flags()
{
	new sFlags[24]
	get_cvar_string("amx_gore",sFlags,24)
	return read_flags(sFlags)
}

/************************************************************
* FX FUNCTIONS
************************************************************/

static fx_trans(id,amount)
{
	set_user_rendering(id,kRenderFxNone,0,0,0,kRenderTransAlpha,amount)
}

public fx_blood(origin[3], origin2[3],HitPlace)
{
	new rDistance = get_distance(origin,origin2) ? get_distance(origin,origin2) : 1
	new rX = (origin[0]-origin2[0])*300/rDistance
	new rY = (origin[1]-origin2[1])*300/rDistance
	new rZ = (origin[2]-origin2[2])*300/rDistance
	message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
	write_byte(TE_BLOODSTREAM)
	write_coord(origin[0]+Offset[HitPlace][0])
	write_coord(origin[1]+Offset[HitPlace][1])
	write_coord(origin[2]+Offset[HitPlace][2])
	write_coord(rX) // x
	write_coord(rY) // y
	write_coord(rZ) // z
	write_byte(70) // color
	write_byte(random_num(100,200)) // speed
	message_end()
}

public fx_bleed(origin[3])
{
	// Blood spray
	message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
	write_byte(TE_BLOODSTREAM)
	write_coord(origin[0])
	write_coord(origin[1])
	write_coord(origin[2]+10)
	write_coord(random_num(-50,50)) // x
	write_coord(random_num(-50,50)) // y
	write_coord(-10) // z
	write_byte(70) // color
	write_byte(random_num(50,100)) // speed
	message_end()
}

static fx_blood_small(origin[3],num)
{
	// Write Small splash decal
	for (new j = 0; j < num; j++) {
		message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
		write_byte(TE_WORLDDECAL)
		write_coord(origin[0]+random_num(-100,100))
		write_coord(origin[1]+random_num(-100,100))
		write_coord(origin[2]-36)
		write_byte(blood_small[random_num(0,blood_small_num - 1)]) // index
		message_end()
	}
}

static fx_blood_large(origin[3],num)
{
	// Write Large splash decal
	for (new i = 0; i < num; i++) {
		message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
		write_byte(TE_WORLDDECAL)
		write_coord(origin[0]+random_num(-50,50))
		write_coord(origin[1]+random_num(-50,50))
		write_coord(origin[2]-36)
		write_byte(blood_large[random_num(0,blood_large_num - 1)]) // index
		message_end()
	}
}

static fx_gib_explode(origin[3],origin2[3])
{
	new flesh[3], x, y, z
	new iFlags = get_gore_flags()
	flesh[0] = mdl_gib_flesh
	flesh[1] = mdl_gib_meat
	flesh[2] = mdl_gib_legbone
	new rDistance = get_distance(origin,origin2) ? get_distance(origin,origin2) : 1
	new rX = (origin[0]-origin2[0])*150/rDistance
	new rY = (origin[1]-origin2[1])*150/rDistance
	new rZ = (origin[2]-origin2[2])*150/rDistance

	// Gib explosions
	// Head
	message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
	write_byte(TE_MODEL)
	write_coord(origin[0])
	write_coord(origin[1])
	write_coord(origin[2]+30)
	write_coord(rX+random_num(-50,50))
	write_coord(rY+random_num(-50,50))
	write_coord(rZ+random_num(-50,50))
	write_angle(random_num(0,360))
	write_short(mdl_gib_head)
	write_byte(0) // bounce
	write_byte(500) // life
	message_end()

	// Spine
	message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
	write_byte(TE_MODEL)
	write_coord(origin[0])
	write_coord(origin[1])
	write_coord(origin[2]+20)
	write_coord(rX+random_num(-50,50))
	write_coord(rY+random_num(-50,50))
	write_coord(rZ+random_num(-50,50))
	write_angle(random_num(0,360))
	write_short(mdl_gib_spine)
	write_byte(0) // bounce
	write_byte(500) // life
	message_end()

	// Lung
	for(new i = 0; i < random_num(1,2); i++) {
		message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
		write_byte(TE_MODEL)
		write_coord(origin[0])
		write_coord(origin[1])
		write_coord(origin[2]+10)
		write_coord(rX+random_num(-50,50))
		write_coord(rY+random_num(-50,50))
		write_coord(rZ+random_num(-50,50))
		write_angle(random_num(0,360))
		write_short(mdl_gib_lung)
		write_byte(0) // bounce
		write_byte(500) // life
		message_end()
	}

	// Parts, 5 times
	for(new i = 0; i < 5; i++) {
		message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
		write_byte(TE_MODEL)
		write_coord(origin[0])
		write_coord(origin[1])
		write_coord(origin[2])
		write_coord(rX+random_num(-50,50))
		write_coord(rY+random_num(-50,50))
		write_coord(rZ+random_num(-50,50))
		write_angle(random_num(0,360))
		write_short(flesh[random_num(0,2)])
		write_byte(0) // bounce
		write_byte(500) // life
		message_end()
	}

	// Blood
	if (iFlags&GORE_EXTRA) {
		for(new i = 0; i < 5; i++) {
			x = random_num(-50,50)
			y = random_num(-50,50)
			z = random_num(0,100)
			for(new j = 0; j < 5; j++) {
				message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
				write_byte(TE_BLOODSPRITE)
				write_coord(origin[0]+(x*j))
				write_coord(origin[1]+(y*j))
				write_coord(origin[2]+(z*j))
				write_short(spr_blood_spray)
				write_short(spr_blood_drop)
				write_byte(248) // color index
				write_byte(15) // size
				message_end()
			}
		}
	}

	message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
	write_byte(TE_BLOODSPRITE)
	write_coord(origin[0])
	write_coord(origin[1])
	write_coord(origin[2]+20)
	write_short(spr_blood_spray)
	write_short(spr_blood_drop)
	write_byte(248) // color index
	write_byte(10) // size
	message_end()
}

public fx_headshot(origin[3])
{
	new iFlags = get_gore_flags()
	if (iFlags&GORE_EXTRA) {
		// Blood spray, 10 times
		for (new i = 0; i < 10; i++) {
			message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
			write_byte(TE_BLOODSTREAM)
			write_coord(origin[0])
			write_coord(origin[1])
			write_coord(origin[2]+30)
			write_coord(random_num(-20,20)) // x
			write_coord(random_num(-20,20)) // y
			write_coord(random_num(50,300)) // z
			write_byte(70) // color
			write_byte(random_num(100,200)) // speed
			message_end()
		}
	}

	message_begin(MSG_BROADCAST,SVC_TEMPENTITY)
	write_byte(TE_BLOODSPRITE)
	write_coord(origin[0])
	write_coord(origin[1])
	write_coord(origin[2]+30)
	write_short(spr_blood_spray)
	write_short(spr_blood_drop)
	write_byte(248) // color index
	write_byte(10) // size
	message_end()
}

/************************************************************
* PLUGIN FUNCTIONS
************************************************************/

public plugin_precache()
{
	spr_blood_drop = precache_model("sprites/blood.spr")
	spr_blood_spray = precache_model("sprites/bloodspray.spr")
	mdl_gib_flesh = precache_model("models/Fleshgibs.mdl")
	mdl_gib_head = precache_model("models/GIB_Skull.mdl")
	mdl_gib_legbone = precache_model("models/GIB_Legbone.mdl")
	mdl_gib_lung = precache_model("models/GIB_Lung.mdl")
	mdl_gib_meat = precache_model("models/GIB_B_Gib.mdl")
	mdl_gib_spine = precache_model("models/GIB_B_Bone.mdl")
}

public plugin_init()
{
	register_plugin("Ultimate Gore","1.3.3","JTP10181/mike_cao/fizzarum")
	register_event("DeathMsg","event_death","a")
	register_event("Damage","event_damage","b","2!0","3=0","4!0")
	register_event("ResetHUD","event_respawn","be","1=1")
	register_logevent("event_roundstart", 2, "1=Round_Start")
	register_cvar("amx_gore","abcd")
	register_cvar("amx_gore_exphp","200")
	set_task(1.0,"event_blood",0,"",0,"b")

	get_modname(mod_name,31)

	// Blood decals
	if (equali(mod_name,"cstrike")) {
		blood_small = {190,191,192,193,194,196,197,0}
		blood_large = {204,205}
		blood_large_num = 2
		blood_small_num = 7
	}
	else if (equali(mod_name,"czero")) {
		blood_large = {216,217}
		blood_small = {202,203,204,205,206,207,208,209}
		blood_large_num = 2
		blood_small_num = 8
	}
	else if (equali(mod_name,"dod")) {
		blood_large = {217,218}
		blood_small = {204,205,206,207,208,209,210,0}
		blood_large_num = 2
		blood_small_num = 7
	}
}