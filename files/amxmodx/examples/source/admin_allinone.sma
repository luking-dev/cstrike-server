/*
 * AMX Mod plugin
 *
 * Admin All-In-One Commands, v3.5
 *
 * (c) Copyright 2012 - AMX Mod Team
 * This file is provided as is (no warranties).
 *
 */

/*
 * Description:
 *   This plugin is a compilation of plugins which are often used, such as "Admin Money",
 *   "Admin Weapon", "Admin Maxspeed", "Admin Glow", "Admin Rocket", and more...
 *   This version has been written to work only on Counter-Strike or Condition Zero mods.
 *   Also, that means if another game mod is running it will be paused and locked, and the
 *   commands will not be available in game.
 *   This plugin is a special version written for AMX Mod only, and it contains more than 20 commands
 *   which are available in multiple languages and all the AMX Mod v2010.1 specific
 *   features are present on any plugin command (supreme admin, admins activity, and so much).
 *   We hope on you to add your language to this plugin, it will be a nice thing for the users!
 *
 *
 * Commands:
 *   BONUS:
 *     amx_money <name|AuthID|IP|"#"UserID|"@"<team|"all">> <money> - gives/removes money
 *     amx_weapon <name|AuthID|IP|"#"UserID|"@"<team|"all">> <weapon name> [ammo] - gives a weapon
 *     amx_heal <name|AuthID|IP|"#"UserID|"@"<team|"all">> <life> - gives health
 *     amx_armor <name|AuthID|IP|"#"UserID|"@"<team|"all">> <armor> - gives armor
 *     amx_maxspeed <name|AuthID|IP|"#"UserID|"@"<team|"all">> [speed|"stop"] - changes/removes speed
 *     amx_gravity <name|AuthID|IP|"#"UserID|"@"<team|"all">> <gravity|"normal"> - changes gravity
 *     amx_teleport <name|AuthID|IP|"#"UserID> [x] [y] [z] - teleports
 *     amx_userorigin <name|AuthID|IP|"#"UserID> - displays position
 *     amx_stack <name|AuthID|IP|"#"UserID> [1=vertical|2=horizontal|3=both] - stacks the other players
 *     amx_glow <name|AuthID|IP|"#"UserID|"@"<team|"all">> <color|"invisible"|"normal"> [alpha] - makes glow/unglow
 *     amx_godmode <name|AuthID|IP|"#"UserID|"@"<team|"all">> <0|1> - removes/gives godmode
 *     amx_noclip <name|AuthID|IP|"#"UserID|"@"<team|"all">> <0|1> - removes/gives noclip
 *     amx_revive <name|AuthID|IP|"#"UserID|"@"<team|"all">> - makes revive
 *
 *   PUNISHMENT:
 *     amx_disarm <name|AuthID|IP|"#"UserID|"@"<team|"all">> - disarms
 *     amx_bury <name|AuthID|IP|"#"UserID|"@"<team|"all">> <0|1> - unburies/buries
 *     amx_slay2 <name|AuthID|IP|"#"UserID|"@"<team|"all">> [1=lightning|2=blood|3=explode] [1=silent] - slays
 *     amx_fire <name|AuthID|IP|"#"UserID|"@"<team|"all">> - ignites
 *     amx_rocket <name|AuthID|IP|"#"UserID|"@"<team|"all">> - transforms to rocket
 *     amx_blank <name|AuthID|IP|"#"UserID|"@"<team|"all">> <time|"infinite"|"remove"> - gives/removes blanks
 *     amx_flash <name|AuthID|IP|"#"UserID|"@"<team|"all">> [RGB color] - flash
 *     amx_nobuy <name|AuthID|IP|"#"UserID|"@"<team|"all">> <0|1> - unblock/block the buymenu
 *     amx_poison <name|AuthID|IP|"#"UserID|"@"<team|"all">> [damage/second|"stop"] [seconds] - poisons
 *
 *   SPECIAL:
 *     amx_clexec <name|AuthID|IP|"#"UserID|"@"<team|"all">> <command line> - executes a client command
 *
 *   Note: The default required admin flags for commands are (in the order of the previous list):
 *     amx_money to amx_glow     -> ADMIN_LEVEL_A
 *     amx_godmode to amx_revive -> ADMIN_LEVEL_B
 *     amx_disarm to amx_poison  -> ADMIN_SLAY
 *     amx_clexec                -> ADMIN_RCON
 *
 *
 * CVars:
 *   amx_maxspeed_store <0|1> - Disable/Enable the "maxspeed storing".
 *     Default value: "0".
 *     Note: If enabled, you will keep your maxspeed value if it has been previously given to you.
 *
 *   amx_nobuy_inform <delay> - Set the information message delay (in seconds) displayed to a restricted client.
 *     Default value: "0".
 *     Note: Set to 0 to disable it.
 *
 *
 * Requirements:
 *   AMX Mod v2010.1 or higher to compile or correctly run this plugin on your server.
 *
 *
 * Setup:
 *   Extract the content of this .zip archive on your computer, then upload the "addons" folder
 *   in your moddir (folder of your game). The non-existent files will be automatically added.
 *   Add the plugin name in your plugins.ini file (or in another plugins file).
 *
 *
 * Configuration:
 *   In first, you can write the CVars "amx_maxspeed_store" and "amx_nobuy_inform" in your amx.cfg file (amx/config folder) then set them to a specific value of your preferences.
 *   You can enable if you want, the AMX logs registered in the AMX log folder.
 *   To do that, just uncomment the #define USE_LOGS below, save the file, then recompile it and replace the new .amx file in your plugins folder.
 *   For information, this plugin can work with the colored admin activity feature, to enable this thing,
 *   make sure your #define COLORED_ACTIVITY has been uncommented (amx/examples/include/amxconst.inc)
 *   then recompile the plugin and replace the new .amx file on your server.
 *   To finish, you can also modify the admin flag required for any command you want (see below) or
 *   use the "amx_changecmdaccess" command (put it with the parameters in your amx.cfg for example).
 *
 *
 * Credits:
 *   The original authors of these plugins:
 *   f117bomb, SniperBeamer, RAV, tcquest78, EKS, Mike Cao, Freecode, OLO, AssKicR, Scarzzurs.
 *
 *
 * Changelog:
 *   1.0     o Initial build (14 plugins in one).
 *   2.0     o Second version (available on AMX Mod X).
 *   3.0 CS  o AMX Mod version for CS or CZ completly rewritten and optimized (contains twenty cmds).
 *             - Added new features for some commands.
 *             - Fixed bugs.
 *             - Added supreme admin support.
 *             - Added colored admin activity support.
 *             - Added #define "USE_LOGS" to enable/disable AMX logging.
 *             - Added "*" argument to each command (to make the action to all players).
 *             - Added plugin auto lock (if the game mod running is not CS or CZ).
 *             - Improved and cleaning up for all codes.
 *             - Added CVar "admin_allinone_version" to track the plugin.
 *             - Added multilingual support.
 *   3.1 CS  o Added a "gagged_players.ini" file to add AuthIDs permanently gagged (with specific flags).
 *   3.2 CS  o Added commands "amx_addgag" and "amx_removegag" & WON support.
 *   3.3 CS  o Updated command "amx_weapon" and added CVar "amx_gag_inform" to show an information message
 *             to admins when a permanently gagged player is connected on the server.
 *   3.4     o Updated command "amx_money" in order to automatically set the maximum money to the maximum allowed ($16000 by default, or, the value of the CVar "mp_maxmoney" [ReGameDLL_CS]), and removed restriction message.
 *           o Updated command "amx_weapon" in order to support the shield (CS v1.6 & CZ), and added usage of my "ReAPI" module when possible.
 *           o Updated "Admin Heal" plugin code in order to remove the 255 HP restriction and fix +255 HP limit HUD bug
 *             and added #define "HEALTH_MAX_NOGODMODE_ACCESS" allowing you to set the maximum health a client can have when an admin not having "amx_godmode" command access attempts to give him health.
 *           o Updated "Admin Armor" plugin code in order to remove the 100 AP restriction and fix the +999 AP limit HUD bug.
 *           o Removed all the gag and ungag code (commands "amx_gag", "amx_ungag", "amx_addgag", "amx_removegag" + CVar "amx_gag_inform" + related code).
 *             Note: This is because I have released an update of the "Admin Gag" plugin, much more powerful, and so, I have removed the code of the previous weak version (2.4) implemented in this plugin.
 *           o Updated "Admin Fire" plugin code in order to automatically "unfire" a player who is fully underwater (for realism!) and added FF support on other player contact (so your teammates will not be fired when FF disabled).
 *           o Target all the clients requires now you use the parameter "@all" instead of "*" (this was more "simpler" before, but I changed this in order to stereotype the global target format).
 *           o Added multimod support (the plugin is no longer limited to CS, but some commands like "amx_money", "amx_weapon", "amx_maxspeed", "amx_revive" are still limited to it [I will update the code later]).
 *           o Automating of the Retro CS and CS v1.5 support (removed #define "NO_STEAM").
 *           o Changed the usage format order of the commands and added quotes around some arguments you must type exactly.
 *           o Renamed and added some sentences.
 *           o Added command "amx_blank" (from "Admin Blanks" v1.2 plugin).
 *           o Added command "amx_clexec" (from "Admin Clexec" v1.1 plugin).
 *           o Added command "amx_flash" (from "Admin Flash" v1.1 plugin).
 *           o Added command "amx_nobuy" (from "Admin NoBuy" v1.2 CS plugin) and CVar "amx_nobuy_inform".
 *           o Added command "amx_poison" (from "Admin Poison" v1.2 plugin) and added "stop" argument to the parameter #2 in order to stop the poisonning process.
 *   3.5     o Updated internal "ReAPI check" for the latest module ReAPI v1.8.0.
 *
 */

/******************************************************************************/
// If you change one of the following settings, do not forget to recompile
// the plugin and to install the new .amx file on your server.
// You can find the list of admin flags in the amx/examples/include/amxconst.inc file.

// Commands: Bonus.
#define FLAG_AMX_MONEY        ADMIN_LEVEL_A
#define FLAG_AMX_WEAPON       ADMIN_LEVEL_A
#define FLAG_AMX_HEAL         ADMIN_LEVEL_A
#define FLAG_AMX_ARMOR        ADMIN_LEVEL_A
#define FLAG_AMX_MAXSPEED     ADMIN_LEVEL_A
#define FLAG_AMX_GRAVITY      ADMIN_LEVEL_A
#define FLAG_AMX_TELEPORT     ADMIN_LEVEL_A
#define FLAG_AMX_USERORIGIN   ADMIN_LEVEL_A
#define FLAG_AMX_STACK        ADMIN_LEVEL_A
#define FLAG_AMX_GLOW         ADMIN_LEVEL_A
#define FLAG_AMX_GODMODE      ADMIN_LEVEL_B
#define FLAG_AMX_NOCLIP       ADMIN_LEVEL_B
#define FLAG_AMX_REVIVE       ADMIN_LEVEL_B
// Commands: Punishment.
#define FLAG_AMX_DISARM       ADMIN_SLAY
#define FLAG_AMX_BURY         ADMIN_SLAY
#define FLAG_AMX_SLAY2        ADMIN_SLAY
#define FLAG_AMX_FIRE         ADMIN_SLAY
#define FLAG_AMX_ROCKET       ADMIN_SLAY
#define FLAG_AMX_BLANKS       ADMIN_SLAY
#define FLAG_AMX_FLASH        ADMIN_SLAY
#define FLAG_AMX_NOBUY        ADMIN_SLAY
#define FLAG_AMX_POISON       ADMIN_SLAY
// Commands: Special.
#define FLAG_AMX_CLEXEC       ADMIN_RCON

// Uncomment the following line to enable the AMX logs for this plugin.
//#define USE_LOGS

// For "amx_heal" command.
// Set the maximum health a client can have until an admin not having "amx_godmode" command access be restricted to use the command.
// Note: This setting was added in order to prevent admin not having "amx_godmode" command access, to give very high health value which might almost act in-game as godmode.
#define HEALTH_MAX_NOGODMODE_ACCESS 10000

// For "amx_maxspeed" command.
// Set the maxspeed max default value used if there is no a second parameter in the command.
// This first value is also used to set/restore default speed values to players.
// Note: It is not advised to change it.
// You can also set the highest maxspeed value possible.
#define MAXSPEED_MAX_DEFAULT 400
#define MAXSPEED_MAX_HIGH    2000

// For amx_revive command.
// Interval delay between command and respawn task done to the specified player(s).
#define TASKID_INTERVAL_RevivePlayer 0.2

/******************************************************************************/

#include <translator>
#include <amxmod>
#include <amxmisc>
//#include <cstrike>
#include <fun>
#include <vexdum>
#tryinclude <reapi>

// Various defines.
#if !defined MAX_CLIENTS
	#define MAX_CLIENTS 32
#endif

// Defines from "cstrike.inc".
#define OFFSET_SHIELD       510
#define SCOREATTRIB_BOMB    2
#define HAS_SHIELD          (1<<24)

// Flash settings
// Don't modify if you know nothing about that.
#define FLASH_FADETIME (1<<0)|(1<<2)|(1<<3)|(1<<9)|(1<<10)|(1<<11)|(1<<12)|(1<<13)|(1<<15)
#define FLASH_DELAY    (1<<4)|(1<<5)|(1<<9)|(1<<11)|(1<<13)
#define FLASH_FLAGS    0
#define FLASH_ALPHA    255

// Quick macros.
#if !defined IsEntityClient
	#define IsEntityClient(%1) (%1 >= 1 && %1 <= g_iMaxClients)
#endif
#define IsGameModCS        (g_iLocalGameModTypeID >= LGMT_RetroCS && g_iLocalGameModTypeID <= LGMT_CSv16OrCZ_ReGameDLL_CS)
#define IsGameModCS16OrCZ  (g_iLocalGameModTypeID >= LGMT_CSv16OrCZ_Standard && g_iLocalGameModTypeID <= LGMT_CSv16OrCZ_ReGameDLL_CS)
#define CS_GetUserTeam(%1) ((g_iMO_CBasePlayer_m_iTeam >= 0) ? get_offset_int(%1, g_iMO_CBasePlayer_m_iTeam) : -1)

// Tasks IDs.
#define TASKID_SetUserSpeedCVars 60310
#define TASKID_RevivePlayer      61311
#define TASKID_IgniteEffects     62312
#define TASKID_IgnitePlayer      63313
#define TASKID_RocketLiftOff     64314
#define TASKID_RocketEffects     65315
#define TASKID_UnBlankPlayer     66316
#define TASKID_PoisonPlayer      67317

enum eTargetInfos {
	szName[32],
	szAuthID[32],
	szIPAddress[32],
}

enum { // Note: Means "Local Game Mod Type".
	LGMT_None,

	LGMT_RetroCS,
	LGMT_CSv15,
	LGMT_CSv16OrCZ_Standard,
	LGMT_CSv16OrCZ_ReGameDLL_CS,

	LGMT_DoD,
	LGMT_TFC,

	LGMT_Other,
	LGMT_NoTeam,
}
new g_iLocalGameModTypeID = LGMT_None
new bool:g_bIsExtraMap
new bool:g_bCanUseReAPI

new g_szAdminInfo[eTargetInfos]
new g_szPlayerInfo[eTargetInfos]
new g_iMaxClients
new bool:g_bFreezeTime
new bool:g_bIsBot[MAX_CLIENTS + 1]
new g_bHasSpeed[MAX_CLIENTS + 1], Float:g_flSpeedValue[MAX_CLIENTS + 1]
new g_iStoredOrigin[MAX_CLIENTS + 1][3]
new g_iColorNum
new g_bIsIgnited
new g_iRocketManPos[MAX_CLIENTS + 1]
new g_bHasBlanks
new g_bHasBuyingBlocked
new g_iBuyingBlockedNum
new g_bHasPoison

new g_iMsgTypeID_StatusIcon, g_iMsgTypeID_ScoreAttrib, g_iMsgTypeID_Damage, g_iMsgTypeID_Health, g_iMsgTypeID_Battery, g_iMsgTypeID_ScreenFade
new g_pMsgHandle_Health, g_pMsgHandle_Battery, g_pMsgHandle_StatusIcon

new g_iSPR_Blood, g_iSPR_BloodSpray, g_iSPR_BlueFlare2
new g_iSPR_Flame, g_iSPR_Flash
new g_iSPR_Light, g_iSPR_Smoke, g_iSPR_White

new g_pCVar_AMXMaxSpeedStore, g_pCVar_AMXNoBuyInform
new g_pCVar_AMXShowClCmds
new g_pCVar_MPFreezeTime, g_pCVar_MPRoundTime, g_pCVar_MPMaxMoney, g_pCVar_MPFriendlyFire, g_pCVar_MPFreeForAll

new g_iMO_CBasePlayer_m_iKevlar     = -1
new g_iMO_CBasePlayer_m_iTeam       = -1
new g_iMO_CBasePlayer_m_bHasPrimary = -1
new g_iMO_CBasePlayer_m_bHasC4      = -1
new g_iMO_CBasePlayer_m_flState     = -1
new g_iMO_CBasePlayer_m_rgAmmo      = -1
new g_iMO_CBPW_m_iPrimaryAmmoType   = -1

new g_szDefaultMeleeWeapon[32]

// Same as admincmd.sma
IsProtectedCmd(const szCommand[]) {
  // Format: {command length (number of chars), "command name"}
  // You can modify or add the commands as you want.
  static const muCommandsList[][] = {
    {9, "developer"},
    {6, "unbind"},
    {6, "volume"},
    {10, "brightness"},
    {11, "sensitivity"},
    {9, "crosshair"},
    {5, "gamma"},
    {4, "hide"},
    {4, "draw"},
    {3, "cl_"},
    {4, "con_"},
    {4, "fps_"},
    {3, "gl_"},
    {4, "hud_"},
    {2, "m_"},
    {2, "r_"},
    {2, "s_"},
    {6, "voice_"},
    {4, "rate"},
    {2, "cd"},
    {1, ";"},
    //{4, "bind"},
    //{5, "alias"},
    {4, "exec"},
    {8, "writecfg"},
    {5, "retry"},
    {9, "reconnect"},
    {10, "disconnect"},
    {4, "quit"},
    {4, "exit"},
    {1, "+"},
    {1, "-"}
  }

  for(new i = 0; i < sizeof(muCommandsList); i++) {
    if(equali(szCommand, muCommandsList[i][1], muCommandsList[i][0]))
      return true
  }
  return false
}

public disable_natives_check() {
  if(is_running("retrocs")) {
    g_iLocalGameModTypeID = LGMT_RetroCS
    copy(g_szDefaultMeleeWeapon, charsmax(g_szDefaultMeleeWeapon), "weapon_knife")
  }
  else if(is_running("cstrike")) {
    g_iLocalGameModTypeID = (!get_cvar_pointer("humans_join_team")) ? LGMT_CSv15 : LGMT_CSv16OrCZ_Standard
    copy(g_szDefaultMeleeWeapon, charsmax(g_szDefaultMeleeWeapon), "weapon_knife")
  }
  else if(is_running("czero")) {
    g_iLocalGameModTypeID = LGMT_CSv16OrCZ_Standard
    copy(g_szDefaultMeleeWeapon, charsmax(g_szDefaultMeleeWeapon), "weapon_knife")
  }
  else if(is_running("dod")) {
    g_iLocalGameModTypeID = LGMT_DoD
    //copy(g_szDefaultMeleeWeapon, charsmax(g_szDefaultMeleeWeapon), "weapon_amerknife")
  }
  else if(is_running("tfc")) {
    g_iLocalGameModTypeID = LGMT_TFC
    copy(g_szDefaultMeleeWeapon, charsmax(g_szDefaultMeleeWeapon), "weapon_crowbar")
  }
  else if(is_running("valve") || is_running("gearbox") || is_running("dmc") || is_running("SvenCoop")) {
    g_iLocalGameModTypeID = LGMT_NoTeam
    copy(g_szDefaultMeleeWeapon, charsmax(g_szDefaultMeleeWeapon), "weapon_crowbar")
  }
  else {
    g_iLocalGameModTypeID = LGMT_Other
    copy(g_szDefaultMeleeWeapon, charsmax(g_szDefaultMeleeWeapon), "weapon_crowbar")
  }

  load_module("fun")
  load_module("VexdUM")

  // Try loading the "ReAPI" module.
  #if defined _reapi_included
  if(load_module("reapi") || is_module_running("reapi")) {
    g_bCanUseReAPI = true
  }
  #endif
}

public plugin_precache() {
  #if defined _reapi_included
  if(g_bCanUseReAPI == true) {
    new ReAPI_HBRRT:iReAPICheck = ReAPI_BF_HasBinaryRunning(ReAPI_BT_ReGameDLL_CS, true, 5, 21, true, true)

    if(iReAPICheck > ReAPI_HBRRT_NoReBinary) {
      g_iLocalGameModTypeID = LGMT_CSv16OrCZ_ReGameDLL_CS
    }

    g_bCanUseReAPI = (iReAPICheck < ReAPI_HBRRT_Success) ? false : true
  }
  #endif

  g_iSPR_Blood      = precache_model("sprites/blood.spr")
  g_iSPR_BloodSpray = precache_model("sprites/bloodspray.spr")
  g_iSPR_BlueFlare2 = precache_model("sprites/blueflare2.spr")
  g_iSPR_Flame      = file_exists("sprites/flame.spr") ? precache_model("sprites/flame.spr") : -1 // Additional sprite.
  g_iSPR_Flash      = precache_model("sprites/muzzleflash.spr")
  g_iSPR_Light      = precache_model("sprites/lgtning.spr")
  g_iSPR_Smoke      = precache_model("sprites/black_smoke1.spr")
  g_iSPR_White      = precache_model("sprites/white.spr")

  precache_sound("ambience/thunder_clap.wav")
  precache_sound("ambience/flameburst1.wav")
  precache_sound("scientist/scream07.wav")
  precache_sound("scientist/scream21.wav")
  precache_sound("weapons/headshot2.wav")
  precache_sound("weapons/rocket1.wav")
  precache_sound("weapons/rocketfire1.wav")

  //if(IsGameModCS) {
  precache_sound("weapons/flashbang-1.wav")
  //}
}

public plugin_init() {
  new const szVersionCVar[2][] = {"3.5", "3.5 (AMX Mod)"}

  load_translations("admin_allinone")
  register_plugin(_T("Admin All-In-One Commands"), szVersionCVar[0], "AMX Mod Team")

  // Global registrations.
  g_iMsgTypeID_StatusIcon  = get_user_msgid("StatusIcon")
  g_iMsgTypeID_ScoreAttrib = get_user_msgid("ScoreAttrib")
  g_iMsgTypeID_Damage      = get_user_msgid("Damage")
  g_iMsgTypeID_Health      = get_user_msgid("Health")
  g_iMsgTypeID_Battery     = get_user_msgid("Battery")
  g_iMsgTypeID_ScreenFade  = get_user_msgid("ScreenFade")
  g_iMaxClients            = get_maxplayers()

  if(IsGameModCS) {
    g_iMO_CBasePlayer_m_iKevlar     = ((g_iLocalGameModTypeID == LGMT_RetroCS) ? 420 : 448) / 4
    g_iMO_CBasePlayer_m_iTeam       = ((g_iLocalGameModTypeID == LGMT_RetroCS) ? 428 : 456) / 4
    g_iMO_CBasePlayer_m_bHasPrimary = ((g_iLocalGameModTypeID == LGMT_RetroCS) ? 436 : 464) / 4
    g_iMO_CBasePlayer_m_bHasC4      = (g_iLocalGameModTypeID == LGMT_RetroCS) ? 188 : 193
    g_iMO_CBasePlayer_m_flState     = ((g_iLocalGameModTypeID == LGMT_RetroCS) ? 912 : ((g_iLocalGameModTypeID == LGMT_CSv15) ? 956 : 940)) / 4
    g_iMO_CBasePlayer_m_rgAmmo      = ((g_iLocalGameModTypeID == LGMT_RetroCS) ? 1480 : ((g_iLocalGameModTypeID == LGMT_CSv15) ? 1520 : 1504)) / 4
    g_iMO_CBPW_m_iPrimaryAmmoType   = ((g_iLocalGameModTypeID == LGMT_RetroCS) ? 184 : 196) / 4

    register_event("CurWeapon", "Event_CurWeapon", "be", "1=1")
    register_event("RoundTime", "Event_RoundTime", "be")
    register_event("Health", "Event_Health", "bd", "1<1")
    register_event("TextMsg", "Event_TextMsg", "a", "2&#Game_C", "2&#Game_w")

    if(g_iLocalGameModTypeID <= LGMT_CSv15) {
      register_event("RoundTime", "Event_HLTV", "bc")
    }
    else {
      register_event("HLTV", "Event_HLTV", "a", "1=0", "2=0")
    }
  }

  register_event("ResetHUD", "Event_ResetHUD", "be")

  new szMapName[32]
  g_bIsExtraMap = (get_mapname(szMapName, charsmax(szMapName)) && equali(szMapName, "hunted")) ? true : false

  set_task(7.0, "Task_SetServerCVars", 273189)
  CheckValidity()

  // Commands: Bonus.
  if(IsGameModCS) {
    register_concmd("amx_money", "cmdMoney", FLAG_AMX_MONEY, _T("<name|AuthID|IP|^"#^"UserID|^"@^"<team|^"all^">> <money> - gives/removes money"))
    register_concmd("amx_weapon", "cmdWeapon", FLAG_AMX_WEAPON, _T("<name|AuthID|IP|^"#^"UserID|^"@^"<team|^"all^">> <weapon name> [ammo] - gives a weapon"))
  }
  if(g_iLocalGameModTypeID != LGMT_DoD) {
    register_concmd("amx_heal", "cmdHeal", FLAG_AMX_HEAL, _T("<name|AuthID|IP|^"#^"UserID|^"@^"<team|^"all^">> <life> - gives health"))
  }
  register_concmd("amx_armor", "cmdArmor", FLAG_AMX_ARMOR, _T("<name|AuthID|IP|^"#^"UserID|^"@^"<team|^"all^">> <armor> - gives armor"))
  if(IsGameModCS) {
    register_concmd("amx_maxspeed", "cmdMaxspeed", FLAG_AMX_MAXSPEED, _T("<name|AuthID|IP|^"#^"UserID|^"@^"<team|^"all^">> [speed|^"stop^"] - changes/removes speed"))
  }
  register_concmd("amx_gravity", "cmdGravity", FLAG_AMX_GRAVITY, _T("<name|AuthID|IP|^"#^"UserID|^"@^"<team|^"all^">> <gravity|^"normal^"> - changes gravity"))
  register_concmd("amx_teleport", "cmdTeleport", FLAG_AMX_TELEPORT, _T("<name|AuthID|IP|^"#^"UserID> [x] [y] [z] - teleports"))
  register_concmd("amx_userorigin", "cmdUserOrigin", FLAG_AMX_USERORIGIN, _T("<name|AuthID|IP|^"#^"UserID> - displays position"))
  register_concmd("amx_stack", "cmdStack", FLAG_AMX_STACK, _T("<name|AuthID|IP|^"#^"UserID> [1=vertical|2=horizontal|3=both] - stacks the other players"))
  register_concmd("amx_glow", "cmdGlow", FLAG_AMX_GLOW, _T("<name|AuthID|IP|^"#^"UserID|^"@^"<team|^"all^">> <color|^"invisible^"|^"normal^"> [alpha] - makes glow/unglow"))
  register_concmd("amx_godmode", "cmdGodmode", FLAG_AMX_GODMODE, _T("<name|AuthID|IP|^"#^"UserID|^"@^"<team|^"all^">> <0|1> - removes/gives godmode"))
  register_concmd("amx_noclip", "cmdNoclip", FLAG_AMX_NOCLIP, _T("<name|AuthID|IP|^"#^"UserID|^"@^"<team|^"all^">> <0|1> - removes/gives noclip"))
  if(IsGameModCS) {
    register_concmd("amx_revive", "cmdRevive", FLAG_AMX_REVIVE, _T("<name|AuthID|IP|^"#^"UserID|^"@^"<team|^"all^">> - makes revive"))
  }

  // Commands: Punishment.
  register_concmd("amx_disarm", "cmdDisarm", FLAG_AMX_DISARM, _T("<name|AuthID|IP|^"#^"UserID|^"@^"<team|^"all^">> - disarms"))
  register_concmd("amx_bury", "cmdBury", FLAG_AMX_BURY, _T("<name|AuthID|IP|^"#^"UserID|^"@^"<team|^"all^">> <0|1> - unburies/buries"))
  register_concmd("amx_slay2", "cmdSlay2", FLAG_AMX_SLAY2, _T("<name|AuthID|IP|^"#^"UserID|^"@^"<team|^"all^">> [1=lightning|2=blood|3=explode] [1=silent] - slays"))
  register_concmd("amx_fire", "cmdFire", FLAG_AMX_FIRE, _T("<name|AuthID|IP|^"#^"UserID|^"@^"<team|^"all^">> - ignites"))
  register_concmd("amx_rocket", "cmdRocket", FLAG_AMX_ROCKET, _T("<name|AuthID|IP|^"#^"UserID|^"@^"<team|^"all^">> - transforms to rocket"))
  register_concmd("amx_blank", "cmdBlank", FLAG_AMX_BLANKS, _T("<name|AuthID|IP|^"#^"UserID|^"@^"<team|^"all^">> <time|^"infinite^"|^"remove^"> - gives/removes blanks"))
  if(g_iMsgTypeID_ScreenFade) {
    register_concmd("amx_flash", "cmdFlash", FLAG_AMX_FLASH, _T("<name|AuthID|IP|^"#^"UserID|^"@^"<team|^"all^">> [RGB color] - flash"))
  }
  if(IsGameModCS) {
    register_concmd("amx_nobuy", "cmdNoBuy", FLAG_AMX_NOBUY, _T("<name|AuthID|IP|^"#^"UserID|^"@^"<team|^"all^">> <0|1> - unblock/block the buymenu"))
  }
  register_concmd("amx_poison", "cmdPoison", FLAG_AMX_POISON, _T("<name|AuthID|IP|^"#^"UserID|^"@^"<team|^"all^">> [damage/second|^"stop^"] [seconds] - poisons"))

  // Commands: Special.
  register_concmd("amx_clexec", "cmdClExec", FLAG_AMX_CLEXEC, _T("<name|AuthID|IP|^"#^"UserID|^"@^"<team|^"all^">> <command line> - executes a client command"))

  // CVars.
  new pCVarPointer = register_cvar("admin_allinone_version", szVersionCVar[1], FCVAR_SERVER)
  set_cvarptr_string(pCVarPointer, szVersionCVar[1])

  g_pCVar_AMXMaxSpeedStore = register_cvar("amx_maxspeed_store", "0")
  g_pCVar_AMXNoBuyInform   = register_cvar("amx_nobuy_inform", "0")
}

public plugin_cfg() {
  g_pCVar_MPFreezeTime   = get_cvar_pointer("mp_freezetime")
  g_pCVar_MPRoundTime    = get_cvar_pointer("mp_roundtime")
  g_pCVar_MPMaxMoney     = get_cvar_pointer("mp_maxmoney")
  g_pCVar_MPFriendlyFire = get_cvar_pointer("mp_friendlyfire")
  g_pCVar_MPFreeForAll   = get_cvar_pointer("mp_freeforall")

  g_pCVar_AMXShowClCmds = get_cvar_pointer("amx_show_clcmds")
}

public Task_SetServerCVars() {
  if(get_cvar_num("sv_maxspeed") < MAXSPEED_MAX_HIGH) {
    set_cvar_num("sv_maxspeed", MAXSPEED_MAX_HIGH)
  }
  if(get_cvar_num("sv_maxvelocity") < MAXSPEED_MAX_HIGH) {
    set_cvar_num("sv_maxvelocity", MAXSPEED_MAX_HIGH)
  }
}

/*******************************************************************************
 * Admin Money
 ******************************************************************************/
public cmdMoney(id, iLevel, iCommandId) {
  if(!cmd_access(id, iLevel, iCommandId, 3))
    return PLUGIN_HANDLED_MAIN

  new szTarget[32], szMoney[8], iPlayer
  read_argv(1, szTarget, charsmax(szTarget))
  read_argv(2, szMoney, charsmax(szMoney))

  new iMoney             = str_to_num(szMoney)
  new bool:bRemoveStatus = (szMoney[0] == '-') ? true : false

  new iCurrentMoney
  new iMaxMoney = g_pCVar_MPMaxMoney ? get_cvarptr_num(g_pCVar_MPMaxMoney) : 16000

  /*if(!bRemoveStatus && !(0 < iMoney <= iMaxMoney)) {
    console_print(id, _T("The money parameter must be between 1 and %d!"), iMaxMoney)
    return PLUGIN_HANDLED_MAIN
  }*/

  new bool:bHasSupreme = access(id, ADMIN_SUPREME) ? true : false

  GetAdminInfos(id)

  if(equali(szTarget, "@all")) {
    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "ch")
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        iCurrentMoney = max(get_user_money(iPlayer), 0)

        if(bRemoveStatus == false && iCurrentMoney >= iMaxMoney) {
          iBlockedPlayersNum++
          continue
        }

        set_user_money(iPlayer, clamp(iCurrentMoney + iMoney, 0, iMaxMoney))
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      if(!bRemoveStatus) console_print(id, _T("Money given to all players ($%d)."), iMoney)
      else console_print(id, _T("Money removed from all players ($%d)."), iMoney)

      #if !defined COLORED_ACTIVITY
      if(!bRemoveStatus) show_activity(id, g_szAdminInfo[szName], _T("give money to all players."))
      else show_activity(id, g_szAdminInfo[szName], _T("remove money from all players."))
      #else
      if(!bRemoveStatus) show_activity_color(id, g_szAdminInfo[szName], _T("give money to all players."))
      else show_activity_color(id, g_szAdminInfo[szName], _T("remove money from all players."))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        if(!bRemoveStatus) log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" give money to all players ($%d).",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], iMoney)
        else log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" remove money from all players ($%d).",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], iMoney)
      }
      else {
        if(!bRemoveStatus) log_amx("Admin All-In-One Commands: <%s> give money to all players ($%d).", g_szAdminInfo[szName], iMoney)
        else log_amx("Admin All-In-One Commands: <%s> remove money from all players ($%d).", g_szAdminInfo[szName], iMoney)
      }
      #endif
    }
    else {
      console_print(id, _T("No real player on the server."))
    }
  }
  else if(szTarget[0] == '@') {
    if(!CanUseTeamAsTarget(id))
      return PLUGIN_HANDLED_MAIN

    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "cegh", szTarget[1])
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        iCurrentMoney = max(get_user_money(iPlayer), 0)

        if(bRemoveStatus == false && iCurrentMoney >= iMaxMoney) {
          iBlockedPlayersNum++
          continue
        }

        set_user_money(iPlayer, clamp(iCurrentMoney + iMoney, 0, iMaxMoney))
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      new szTeamName[32]
      GetTeamName(szTarget, szTeamName, charsmax(szTeamName))

      if(!bRemoveStatus) console_print(id, _T("Money given to the %s ($%d)."), _T(szTeamName), iMoney)
      else console_print(id, _T("Money removed from the %s ($%d)."), _T(szTeamName), iMoney)

      #if !defined COLORED_ACTIVITY
      if(!bRemoveStatus) show_activity(id, g_szAdminInfo[szName], _T("give money to the %s."), _T(szTeamName))
      else show_activity(id, g_szAdminInfo[szName], _T("remove money from the %s."), _T(szTeamName))
      #else
      if(!bRemoveStatus) show_activity_color(id, g_szAdminInfo[szName], _T("give money to the %s."), _T(szTeamName))
      else show_activity_color(id, g_szAdminInfo[szName], _T("remove money from the %s."), _T(szTeamName))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        if(!bRemoveStatus) log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" give money to the %s ($%d).",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szTeamName, iMoney)
        else log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" remove money from the %s ($%d).",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szTeamName, iMoney)
      }
      else {
        if(!bRemoveStatus) log_amx("Admin All-In-One Commands: <%s> give money to the %s ($%d).", g_szAdminInfo[szName], szTeamName, iMoney)
        else log_amx("Admin All-In-One Commands: <%s> remove money from the %s ($%d).", g_szAdminInfo[szName], szTeamName, iMoney)
      }
      #endif
    }
    else {
      console_print(id, _T("No real player in this team."))
    }
  }
  else {
    iPlayer = CmdTargetExtra(id, szTarget, 11)
    if(!iPlayer)
      return PLUGIN_HANDLED_MAIN

    GetPlayerInfos(iPlayer)

    iCurrentMoney = max(get_user_money(iPlayer), 0)

    if(bRemoveStatus == false && iCurrentMoney >= iMaxMoney) {
      console_print(id, _T("Player ^"%s^" has already the maximum money allowed by the game ($%d)."), g_szPlayerInfo[szName], iMaxMoney)
      return PLUGIN_HANDLED_MAIN
    }

    set_user_money(iPlayer, clamp(iCurrentMoney + iMoney, 0, iMaxMoney))

    if(!bRemoveStatus) console_print(id, _T("Money given to %s ($%d)."), g_szPlayerInfo[szName], iMoney)
    else console_print(id, _T("Money removed from %s ($%d)."), g_szPlayerInfo[szName], iMoney)

    #if !defined COLORED_ACTIVITY
    if(!bRemoveStatus) show_activity(id, g_szAdminInfo[szName], _T("give money to %s."), g_szPlayerInfo[szName])
    else show_activity(id, g_szAdminInfo[szName], _T("remove money from %s."), g_szPlayerInfo[szName])
    #else
    if(!bRemoveStatus) show_activity_color(id, g_szAdminInfo[szName], _T("give money to %s."), g_szPlayerInfo[szName])
    else show_activity_color(id, g_szAdminInfo[szName], _T("remove money from %s."), g_szPlayerInfo[szName])
    #endif

    #if defined USE_LOGS
    if(id > 0) {
      if(!bRemoveStatus) log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" give money to ^"<%s><%d><%s><%s>^" ($%d).",
      g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress],
      g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress], iMoney)
      else log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" remove money from ^"<%s><%d><%s><%s>^" ($%d).",
      g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress],
      g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress], iMoney)
    }
    else {
      if(!bRemoveStatus) log_amx("Admin All-In-One Commands: <%s> give money to ^"<%s><%d><%s><%s>^" ($%d).",
      g_szAdminInfo[szName], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress], iMoney)
      else log_amx("Admin All-In-One Commands: <%s> remove money from ^"<%s><%d><%s><%s>^" ($%d).",
      g_szAdminInfo[szName], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress], iMoney)
    }
    #endif
  }
  return PLUGIN_HANDLED_MAIN
}

/*******************************************************************************
 * Admin Weapon
 ******************************************************************************/
public cmdWeapon(id, iLevel, iCommandId) {
  if(!cmd_access(id, iLevel, iCommandId, 3))
    return PLUGIN_HANDLED_MAIN

  new szTarget[32], szWeaponName[20] = "weapon_", iWeaponId, iPlayer
  read_argv(1, szTarget, charsmax(szTarget))
  read_argv(2, szWeaponName[7], charsmax(szWeaponName) - 7)

  if(IsGameModCS16OrCZ && equal(szWeaponName[7], "shield")) {
    iWeaponId = 2
  }
  else if((iWeaponId = get_weaponid(szWeaponName)) == 0) {
    console_print(id, _T("Invalid weapon name, try another."))
    return PLUGIN_HANDLED_MAIN
  }

  new szAmmo[48]
  new iAmmoValue = (iWeaponId == 2) ? 0 : (read_argv(3, szAmmo, charsmax(szAmmo)) ? max(0, str_to_num(szAmmo)) : -1)
  if(iWeaponId != 2 && iAmmoValue == 0 && ((1<<iWeaponId) & (1<<CSW_HEGRENADE|1<<CSW_FLASHBANG|1<<CSW_SMOKEGRENADE|1<<CSW_C4))) {
    iAmmoValue = 1
  }

  switch(iAmmoValue) {
    case -1: copy(szAmmo, charsmax(szAmmo), _T("with max default ammunition", id))
    case 0: copy(szAmmo, charsmax(szAmmo), _T("with no ammunition", id))
    default: formatex(szAmmo, charsmax(szAmmo), _T("with %d ammunition", id), iAmmoValue)
  }

  new bool:bHasSupreme = access(id, ADMIN_SUPREME) ? true : false

  GetAdminInfos(id)

  if(equali(szTarget, "@all")) {
    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "ah")
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        if(!CsGiveUserWeapon(iPlayer, iWeaponId, iAmmoValue)) {
          iBlockedPlayersNum++
          continue
        }
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      console_print(id, _T("The weapon ^"%s^" has been given to all players (%s)."), szWeaponName[7], szAmmo)

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("give weapon ^"%s^" to all players."), szWeaponName[7])
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("give weapon ^"%s^" to all players."), szWeaponName[7])
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" give weapon ^"%s^" to all players (%s).",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szWeaponName[7], szAmmo)
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> give weapon ^"%s^" to all players (%s).", g_szAdminInfo[szName], szWeaponName[7], szAmmo)
      }
      #endif
    }
    else {
      console_print(id, _T("No alive player on the server."))
    }
  }
  else if(szTarget[0] == '@') {
    if(!CanUseTeamAsTarget(id))
      return PLUGIN_HANDLED_MAIN

    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "aegh", szTarget[1])
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        if(!CsGiveUserWeapon(iPlayer, iWeaponId, iAmmoValue)) {
          iBlockedPlayersNum++
          continue
        }
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      new szTeamName[32]
      GetTeamName(szTarget, szTeamName, charsmax(szTeamName))

      console_print(id, _T("The weapon ^"%s^" has been given to the %s (%s)."), szWeaponName[7], _T(szTeamName), szAmmo)

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("give weapon ^"%s^" to the %s."), szWeaponName[7], _T(szTeamName))
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("give weapon ^"%s^" to the %s."), szWeaponName[7], _T(szTeamName))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" give weapon ^"%s^" to the %s (%s).",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szWeaponName[7], szTeamName, szAmmo)
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> give weapon ^"%s^" to the %s (%s).", g_szAdminInfo[szName], szWeaponName[7], szTeamName, szAmmo)
      }
      #endif
    }
    else {
      console_print(id, _T("No alive player in this team."))
    }
  }
  else {
    iPlayer = CmdTargetExtra(id, szTarget, 7)
    if(!iPlayer)
      return PLUGIN_HANDLED_MAIN

    GetPlayerInfos(iPlayer)

    if(!CsGiveUserWeapon(iPlayer, iWeaponId, iAmmoValue)) {
      console_print(id, _T("Unable to give weapon ^"%s^" to player ^"%s^"."), szWeaponName[7], g_szPlayerInfo[szName])
      return PLUGIN_HANDLED_MAIN
    }

    console_print(id, _T("Player ^"%s^" got weapon ^"%s^" (%s)."), g_szPlayerInfo[szName], szWeaponName[7], szAmmo)

    #if !defined COLORED_ACTIVITY
    show_activity(id, g_szAdminInfo[szName], _T("give weapon ^"%s^" to %s."), szWeaponName[7], g_szPlayerInfo[szName])
    #else
    show_activity_color(id, g_szAdminInfo[szName], _T("give weapon ^"%s^" to %s."), szWeaponName[7], g_szPlayerInfo[szName])
    #endif

    #if defined USE_LOGS
    if(id > 0) {
      log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" give weapon ^"%s^" to ^"<%s><%d><%s><%s>^" (%s).",
      g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szWeaponName[7],
      g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress], szAmmo)
    }
    else {
      log_amx("Admin All-In-One Commands: <%s> give weapon ^"%s^" to ^"<%s><%d><%s><%s>^" (%s).",
      g_szAdminInfo[szName], szWeaponName[7], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress], szAmmo)
    }
    #endif
  }
  return PLUGIN_HANDLED_MAIN
}

stock get_user_weapon_entity(iPlayerID, szClassName[]) {
  new iEntityID = -1;
  while((iEntityID = find_entity(iEntityID, szClassName)) > 0) { // class name
    if(entity_get_edict(iEntityID, EV_ENT_owner) == iPlayerID) {
      return iEntityID;
    }
  }
  return 0;
}

CsGiveUserWeapon(id, const iWeaponId, const iAmmoValue) {
  static const muWeaponsInfosList[][] = {
    {CSW_P228, 52, "p228"},
    {CSW_SCOUT, 90, "scout"},
    {CSW_HEGRENADE, 1, "hegrenade"},
    {CSW_XM1014, 32, "xm1014"},
    {CSW_C4, 1, "c4"},
    {CSW_MAC10, 100, "mac10"},
    {CSW_AUG, 90, "aug"},
    {CSW_SMOKEGRENADE, 1, "smokegrenade"},
    {CSW_ELITE, 120, "elite"},
    {CSW_FIVESEVEN, 100, "fiveseven"},
    {CSW_UMP45, 100, "ump45"},
    {CSW_SG550, 90, "sg550"},
    {CSW_GALIL, 90, "galil"},
    {CSW_FAMAS, 90, "famas"},
    {CSW_USP, 100, "usp"},
    {CSW_GLOCK18, 120, "glock18"},
    {CSW_AWP, 30, "awp"},
    {CSW_MP5NAVY, 120, "mp5navy"},
    {CSW_M249, 200, "m249"},
    {CSW_M3, 32, "m3"},
    {CSW_M4A1, 90, "m4a1"},
    {CSW_TMP, 120, "tmp"},
    {CSW_G3SG1, 90, "g3sg1"},
    {CSW_FLASHBANG, 2, "flashbang"},
    {CSW_DEAGLE, 35, "deagle"},
    {CSW_SG552, 90, "sg552"},
    {CSW_AK47, 90, "ak47"},
    {CSW_KNIFE, 1, "knife"},
    {CSW_P90, 100, "p90"}
  }

  new iItemEntityID = -1

  // #1: Method for legit CS.
  if(g_bCanUseReAPI == false) {
    const FLAGS_PRIMARY = 1509749160

    // Give a shield.
    if(iWeaponId == 2) {
      if((get_offset_int(id, OFFSET_SHIELD) & HAS_SHIELD))
        return 0

      new iWeaponsTypesIDs[32], iWeaponsNum

      if(get_user_weapons(id, iWeaponsTypesIDs, iWeaponsNum)) {
        new szWeaponName[32]

        for(new a = 0; a < iWeaponsNum; a++) {
          if((1<<iWeaponsTypesIDs[a]) & (FLAGS_PRIMARY | (1<<CSW_ELITE))
          && get_weaponname(iWeaponsTypesIDs[a], szWeaponName, charsmax(szWeaponName)) > 0) {
            engclient_cmd(id, "drop", szWeaponName)
          }
        }
      }

      if(give_item(id, "weapon_shield") <= 0)
        return 0

      return 2
    }

    // Drop the shield when you have it and when you give a primary weapon, but refuse elites (as the game does).
    // Should I do that? Hum, I guess yes, because the shield is still available but invisible for the client who holds primary or elites, so not much realistic.
    if(IsGameModCS16OrCZ && ((1<<iWeaponId) & (FLAGS_PRIMARY | (1<<CSW_ELITE)))
    && (get_offset_int(id, OFFSET_SHIELD) & HAS_SHIELD)) {
      if(iWeaponId == CSW_ELITE)
        return 0

      engclient_cmd(id, "drop", "weapon_shield")
    }

    // Give the regular inventory item.
    new iNum = (iWeaponId > 2) ? 2 : 1
    //if(!has_user_weapon(id, muWeaponsInfosList[iWeaponId - iNum][0])) {
    new szWeaponPrefix[20] = "weapon_"
    copy(szWeaponPrefix[7], charsmax(szWeaponPrefix) - 7, muWeaponsInfosList[iWeaponId - iNum][2])

    iItemEntityID = get_user_weapon_entity(id, szWeaponPrefix)

    if(iItemEntityID <= 0) {
      iItemEntityID = give_item(id, szWeaponPrefix)

      if(iItemEntityID <= 0)
        return 0
    }
  }
  // #2: Method for ReGameDLL_CS with ReAPI.
  #if defined _reapi_included
  else {
    new szWeaponName[32]
    if(iWeaponId == 2) {
      if((get_offset_int(id, OFFSET_SHIELD) & HAS_SHIELD))
        return 0

      copy(szWeaponName, charsmax(szWeaponName), "weapon_shield")
    }
    else {
      if(!get_weaponname(iWeaponId, szWeaponName, charsmax(szWeaponName)))
        return 0

      if(((1<<iWeaponId) & (FLAGS_PRIMARY | (1<<CSW_ELITE)))
      && (get_offset_int(id, OFFSET_SHIELD) & HAS_SHIELD)) {
        new bool:bHasRemoved
        if(!ReAPI_FC_CallFunctionByTypeName(ReAPI_CFGT_RGCS_CCSPlayer, "RemoveShield", 0, id, bHasRemoved) || bHasRemoved == false)
          return 0
      }
    }

    if(!ReAPI_FC_CallFunctionByTypeName(ReAPI_CFGT_RGCS_CCSPlayer, "GetItemByName", (1<<2), id, szWeaponName, iItemEntityID))
      return 0

    if(iItemEntityID <= g_iMaxClients && !ReAPI_FC_CallFunctionByTypeName(ReAPI_CFGT_RGCS_CCSPlayer, "GiveNamedItemEx", (1<<2), id, szWeaponName, iItemEntityID))
      return 0
  }
  #endif

  // Give backpack ammunitions.
  if(iItemEntityID > g_iMaxClients && iWeaponId != CSW_KNIFE) {
    new iNum           = (iWeaponId > 2) ? 2 : 1
    new iCurrentBPAmmo = max(CS_GetUserBPAmmo(id, iItemEntityID), 0)

    CS_SetUserBPAmmo(id, iItemEntityID, (iAmmoValue == -1) ? muWeaponsInfosList[iWeaponId - iNum][1] : (iAmmoValue + iCurrentBPAmmo))

    if(iWeaponId == CSW_C4 && g_bCanUseReAPI == false) {
      SetUserMsgC4(id)
      SendScoreAttrib(id)
    }
    return 2
  }

  return 1
}

SetUserMsgC4(id) {
  if(g_iMO_CBasePlayer_m_bHasC4 >= 0 && g_iMsgTypeID_StatusIcon) {
    entity_set_int(id, EV_INT_body, 1)
    set_offset_int(id, g_iMO_CBasePlayer_m_bHasC4, (1<<8))

    message_begin(MSG_ONE_UNRELIABLE, g_iMsgTypeID_StatusIcon, {0, 0, 0}, id)
    write_byte(1)
    write_string("c4")
    write_byte(0)
    write_byte(160)
    write_byte(0)
    message_end()
  }
}

SendScoreAttrib(id) {
 if(g_iMsgTypeID_ScoreAttrib) {
    message_begin(MSG_BROADCAST, g_iMsgTypeID_ScoreAttrib)
    write_byte(id)
    write_byte(SCOREATTRIB_BOMB)
    message_end()
  }
}

/*******************************************************************************
 * Admin Heal
 ******************************************************************************/
public cmdHeal(id, iLevel, iCommandId) {
  if(!cmd_access(id, iLevel, iCommandId, 3))
    return PLUGIN_HANDLED_MAIN

  new szTarget[32], szHealth[12], iPlayer
  read_argv(1, szTarget, charsmax(szTarget))
  read_argv(2, szHealth, charsmax(szHealth))

  new iLife = min(str_to_num(szHealth), 2147483647)

  /*if(iLife < 1) {
    console_print(id, _T("You cannot give negative health!"))
    return PLUGIN_HANDLED_MAIN
  }*/

  if(iLife == 0) {
    console_print(id, _T("You must specify a non-zero value!"))
    return PLUGIN_HANDLED_MAIN
  }

  new szAccessFlags[32]
  new bool:bHasMaxHealthAccess = (id == 0 || access(id, get_cmdaccess("amx_godmode", szAccessFlags, charsmax(szAccessFlags)) ? read_flags(szAccessFlags) : FLAG_AMX_GODMODE)) ? true : false

  new iTargetHealth, iTotalLife, iTempLife

  new bool:bHasSupreme = access(id, ADMIN_SUPREME) ? true : false

  GetAdminInfos(id)

  if(equali(szTarget, "@all")) {
    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "ah")
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        iTargetHealth = get_user_health(iPlayer)
        iTempLife     = iLife

        if(bHasMaxHealthAccess == false && iLife > 0) {
          if(iTargetHealth >= HEALTH_MAX_NOGODMODE_ACCESS) {
            iBlockedPlayersNum++
            continue
          }

          if((iTargetHealth + iLife) > HEALTH_MAX_NOGODMODE_ACCESS) {
            iTempLife = HEALTH_MAX_NOGODMODE_ACCESS - iTargetHealth
          }
        }

        iTotalLife = max(iTargetHealth + iTempLife, 1)
        set_user_health(iPlayer, iTotalLife)

        if(iTotalLife > 255 && g_pMsgHandle_Health == 0) {
          g_pMsgHandle_Health = register_message(g_iMsgTypeID_Health, "Message_Health")
        }
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      console_print(id, _T("All players have received %d health points."), iLife)

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("give %d health points to all players."), iLife)
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("give %d health points to all players."), iLife)
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" give %d health points to all players.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], iLife)
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> give %d health points to all players.", g_szAdminInfo[szName], iLife)
      }
      #endif
    }
    else {
      console_print(id, _T("No alive player on the server."))
    }
  }
  else if(szTarget[0] == '@') {
    if(!CanUseTeamAsTarget(id))
      return PLUGIN_HANDLED_MAIN

    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "aegh", szTarget[1])
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        iTargetHealth = get_user_health(iPlayer)
        iTempLife     = iLife

        if(bHasMaxHealthAccess == false && iLife > 0) {
          if(iTargetHealth >= HEALTH_MAX_NOGODMODE_ACCESS) {
            iBlockedPlayersNum++
            continue
          }

          if((iTargetHealth + iLife) > HEALTH_MAX_NOGODMODE_ACCESS) {
            iTempLife = HEALTH_MAX_NOGODMODE_ACCESS - iTargetHealth
          }
        }

        iTotalLife = max(iTargetHealth + iTempLife, 1)
        set_user_health(iPlayer, iTotalLife)

        if(iTotalLife > 255 && g_pMsgHandle_Health == 0) {
          g_pMsgHandle_Health = register_message(g_iMsgTypeID_Health, "Message_Health")
        }
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      new szTeamName[32]
      GetTeamName(szTarget, szTeamName, charsmax(szTeamName))

      console_print(id, _T("The %s have received %d health points."), _T(szTeamName), iLife)

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("give %d health points to the %s."), iLife, _T(szTeamName))
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("give %d health points to the %s."), iLife, _T(szTeamName))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" give %d health points to the %s.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], iLife, szTeamName)
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> give %d health points to the %s.", g_szAdminInfo[szName], iLife, szTeamName)
      }
      #endif
    }
    else {
      console_print(id, _T("No alive player in this team."))
    }
  }
  else {
    iPlayer = CmdTargetExtra(id, szTarget, 7)
    if(!iPlayer)
      return PLUGIN_HANDLED_MAIN

    GetPlayerInfos(iPlayer)

    iTargetHealth = get_user_health(iPlayer)

    if(bHasMaxHealthAccess == false && iLife > 0) {
      if(iTargetHealth >= HEALTH_MAX_NOGODMODE_ACCESS) {
        console_print(id, _T("You can not give more health to the player ^"%s^", his health is already equal or higher than the limit of %d."), g_szPlayerInfo[szName], HEALTH_MAX_NOGODMODE_ACCESS)
        return PLUGIN_HANDLED_MAIN
      }

      if((iTargetHealth + iLife) > HEALTH_MAX_NOGODMODE_ACCESS) {
        iLife = HEALTH_MAX_NOGODMODE_ACCESS - iTargetHealth
      }
    }

    iTotalLife = max(iTargetHealth + iLife, 1)
    set_user_health(iPlayer, iTotalLife)

    if(iTotalLife > 255 && g_pMsgHandle_Health == 0) {
      g_pMsgHandle_Health = register_message(g_iMsgTypeID_Health, "Message_Health")
    }

    console_print(id, _T("Player ^"%s^" has received %d health points."), g_szPlayerInfo[szName], iLife)

    #if !defined COLORED_ACTIVITY
    show_activity(id, g_szAdminInfo[szName], _T("give %d health points to %s."), iLife, g_szPlayerInfo[szName])
    #else
    show_activity_color(id, g_szAdminInfo[szName], _T("give %d health points to %s."), iLife, g_szPlayerInfo[szName])
    #endif

    #if defined USE_LOGS
    if(id > 0) {
      log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" give %d health points to ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], iLife,
      g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    else {
      log_amx("Admin All-In-One Commands: <%s> give %d health points to ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], iLife, g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    #endif
  }
  return PLUGIN_HANDLED_MAIN
}

public Message_Health(const iMsgID, const iMsgDest, iPlayerID) {
	if(get_msg_arg_int(1) > 255) {
		set_msg_arg_int(1, 255)
	}
}

/*******************************************************************************
 * Admin Armor
 ******************************************************************************/
public cmdArmor(id, iLevel, iCommandId) {
  if(!cmd_access(id, iLevel, iCommandId, 3))
    return PLUGIN_HANDLED_MAIN

  new szTarget[32], szArmor[12], iPlayer
  read_argv(1, szTarget, charsmax(szTarget))
  read_argv(2, szArmor, charsmax(szArmor))

  new iArmor = min(str_to_num(szArmor), 2147483647)
  new iTotalArmor

  if(iArmor == 0) {
    console_print(id, _T("You must specify a non-zero value!"))
    return PLUGIN_HANDLED_MAIN
  }

  new bool:bHasSupreme = access(id, ADMIN_SUPREME) ? true : false

  GetAdminInfos(id)

  if(equali(szTarget, "@all")) {
    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "ah")
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        iTotalArmor = max(get_user_armor(iPlayer) + iArmor, 1)
        set_user_armor(iPlayer, iTotalArmor)
        if(g_iMO_CBasePlayer_m_iKevlar >= 0) {
          set_offset_int(iPlayer, g_iMO_CBasePlayer_m_iKevlar, 2)
        }

        if(iTotalArmor > 999 && g_pMsgHandle_Battery == 0) {
          g_pMsgHandle_Battery = register_message(g_iMsgTypeID_Battery, "Message_Battery")
        }
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      console_print(id, _T("All players have received %d armor points."), iArmor)

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("give %d armor points to all players."), iArmor)
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("give %d armor points to all players."), iArmor)
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" give %d armor points to all players.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], iArmor)
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> give %d armor points to all players.", g_szAdminInfo[szName], iArmor)
      }
      #endif
    }
    else {
      console_print(id, _T("No alive player on the server."))
    }
  }
  else if(szTarget[0] == '@') {
    if(!CanUseTeamAsTarget(id))
      return PLUGIN_HANDLED_MAIN

    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "aegh", szTarget[1])
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        iTotalArmor = max(get_user_armor(iPlayer) + iArmor, 1)
        set_user_armor(iPlayer, iTotalArmor)
        if(g_iMO_CBasePlayer_m_iKevlar >= 0) {
          set_offset_int(iPlayer, g_iMO_CBasePlayer_m_iKevlar, 2)
        }

        if(iTotalArmor > 999 && g_pMsgHandle_Battery == 0) {
          g_pMsgHandle_Battery = register_message(g_iMsgTypeID_Battery, "Message_Battery")
        }
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      new szTeamName[32]
      GetTeamName(szTarget, szTeamName, charsmax(szTeamName))

      console_print(id, _T("The %s have received %d armor points."), _T(szTeamName), iArmor)

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("give %d armor points to the %s."), iArmor, _T(szTeamName))
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("give %d armor points to the %s."), iArmor, _T(szTeamName))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" give %d armor points to the %s.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], iArmor, szTeamName)
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> give %d armor points to the %s.", g_szAdminInfo[szName], iArmor, szTeamName)
      }
      #endif
    }
    else {
      console_print(id, _T("No alive player in this team."))
    }
  }
  else {
    iPlayer = CmdTargetExtra(id, szTarget, 7)
    if(!iPlayer)
      return PLUGIN_HANDLED_MAIN

    iTotalArmor = max(get_user_armor(iPlayer) + iArmor, 1)
    set_user_armor(iPlayer, iTotalArmor)
    if(g_iMO_CBasePlayer_m_iKevlar >= 0) {
      set_offset_int(iPlayer, g_iMO_CBasePlayer_m_iKevlar, 2)
    }

    if(iTotalArmor > 999 && g_pMsgHandle_Battery == 0) {
      g_pMsgHandle_Battery = register_message(g_iMsgTypeID_Battery, "Message_Battery")
    }

    GetPlayerInfos(iPlayer)

    console_print(id, _T("Player ^"%s^" has received %d armor points."), g_szPlayerInfo[szName], iArmor)

    #if !defined COLORED_ACTIVITY
    show_activity(id, g_szAdminInfo[szName], _T("give %d armor points to %s."), iArmor, g_szPlayerInfo[szName])
    #else
    show_activity_color(id, g_szAdminInfo[szName], _T("give %d armor points to %s."), iArmor, g_szPlayerInfo[szName])
    #endif

    #if defined USE_LOGS
    if(id > 0) {
      log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" give %d armor points to ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], iArmor,
      g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    else {
      log_amx("Admin All-In-One Commands: <%s> give %d armor points to ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], iArmor, g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    #endif
  }
  return PLUGIN_HANDLED_MAIN
}

public Message_Battery(const iMsgID, const iMsgDest, iPlayerID) {
	if(get_msg_arg_int(1) > 999) {
		set_msg_arg_int(1, 999)
	}
}

/*******************************************************************************
 * Admin Maxspeed
 ******************************************************************************/
#define SetUserSpeed(%1)    g_bHasSpeed[%1] = true
#define RemoveUserSpeed(%1) g_bHasSpeed[%1] = false
#define HasUserSpeed(%1)    g_bHasSpeed[%1]

public cmdMaxspeed(id, iLevel, iCommandId) {
  if(!cmd_access(id, iLevel, iCommandId, 2))
    return PLUGIN_HANDLED_MAIN

  new szTarget[32], szSpeed[6], iPlayer
  read_argv(1, szTarget, charsmax(szTarget))

  new iSpeed = read_argv(2, szSpeed, charsmax(szSpeed)) ? (equali(szSpeed, "stop") ? 0 : str_to_num(szSpeed)) : MAXSPEED_MAX_DEFAULT

  if((iSpeed != 0) && !(1 <= iSpeed <= MAXSPEED_MAX_HIGH)) {
    console_print(id, _T("The valid speed range must be between 1 and %d!"), MAXSPEED_MAX_HIGH)
    return PLUGIN_HANDLED_MAIN
  }

  new bool:bHasSupreme = access(id, ADMIN_SUPREME) ? true : false

  GetAdminInfos(id)

  if(equali(szTarget, "@all")) {
    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "h")
    if(iPlayersNum > 0) {
      new szMaxSpeedCommand[64]
      if(iSpeed) {
        new iValue = (iSpeed > MAXSPEED_MAX_DEFAULT) ? iSpeed : MAXSPEED_MAX_DEFAULT
        formatex(szMaxSpeedCommand, charsmax(szMaxSpeedCommand), ";cl_forwardspeed %d;cl_backspeed %d;cl_sidespeed %d", iValue, iValue, iValue)
      }

      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if(!HasUserSpeed(iPlayer) && iSpeed == 0) {
          iBlockedPlayersNum++
          continue
        }

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        if(iSpeed) {
          if(!g_bIsBot[iPlayer]) {
            client_cmd(iPlayer, szMaxSpeedCommand)
          }

          g_flSpeedValue[iPlayer] = float(iSpeed)
          set_user_maxspeed(iPlayer, g_flSpeedValue[iPlayer])
          SetUserSpeed(iPlayer)
        }
        else {
          CS_ResetUserMaxSpeed(iPlayer)
        }
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      if(iSpeed) console_print(id, _T("Speed modified for all players (speed: %d)."), iSpeed)
      else console_print(id, _T("New speed removed from all players."), iSpeed)

      #if !defined COLORED_ACTIVITY
      if(iSpeed) show_activity(id, g_szAdminInfo[szName], _T("change speed of all players."))
      else show_activity(id, g_szAdminInfo[szName], _T("remove the new speed from all players."))
      #else
      if(iSpeed) show_activity_color(id, g_szAdminInfo[szName], _T("change speed of all players."))
      else show_activity_color(id, g_szAdminInfo[szName], _T("remove the new speed from all players."))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        if(iSpeed) log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" change speed of all players (speed: %d).",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], iSpeed)
        else log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" remove the new speed from all players.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress])
      }
      else {
        if(iSpeed) log_amx("Admin All-In-One Commands: <%s> change speed of all players (speed: %d).", g_szAdminInfo[szName], iSpeed)
        else log_amx("Admin All-In-One Commands: <%s> remove the new speed from all players.", g_szAdminInfo[szName])
      }
      #endif
    }
    else {
      console_print(id, _T("No player on the server."))
    }
  }
  else if(szTarget[0] == '@') {
    if(!CanUseTeamAsTarget(id))
      return PLUGIN_HANDLED_MAIN

    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "egh", szTarget[1])
    if(iPlayersNum > 0) {
      new szMaxSpeedCommand[64]
      if(iSpeed) {
        new iValue = (iSpeed > MAXSPEED_MAX_DEFAULT) ? iSpeed : MAXSPEED_MAX_DEFAULT
        formatex(szMaxSpeedCommand, charsmax(szMaxSpeedCommand), ";cl_forwardspeed %d;cl_backspeed %d;cl_sidespeed %d", iValue, iValue, iValue)
      }

      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if(!HasUserSpeed(iPlayer) && iSpeed == 0) {
          iBlockedPlayersNum++
          continue
        }

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        if(iSpeed) {
          if(!g_bIsBot[iPlayer]) {
            client_cmd(iPlayer, szMaxSpeedCommand)
          }

          g_flSpeedValue[iPlayer] = float(iSpeed)
          set_user_maxspeed(iPlayer, g_flSpeedValue[iPlayer])
          SetUserSpeed(iPlayer)
        }
        else {
          CS_ResetUserMaxSpeed(iPlayer)
        }
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      new szTeamName[32]
      GetTeamName(szTarget, szTeamName, charsmax(szTeamName))

      if(iSpeed) console_print(id, _T("Speed modified for the %s (speed: %d)."), _T(szTeamName), iSpeed)
      else console_print(id, _T("New speed removed from the %s."), _T(szTeamName))

      #if !defined COLORED_ACTIVITY
      if(iSpeed) show_activity(id, g_szAdminInfo[szName], _T("change speed of the %s."), _T(szTeamName))
      else show_activity(id, g_szAdminInfo[szName], _T("remove the new speed from the %s."), _T(szTeamName))
      #else
      if(iSpeed) show_activity_color(id, g_szAdminInfo[szName], _T("change speed of the %s."), _T(szTeamName))
      else show_activity_color(id, g_szAdminInfo[szName], _T("remove the new speed from the %s."), _T(szTeamName))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        if(iSpeed) log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" change speed of the %s (speed: %d).",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szTeamName, iSpeed)
        else log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" remove the new speed from the %s.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szTeamName)
      }
      else {
        if(iSpeed) log_amx("Admin All-In-One Commands: <%s> change speed of the %s (speed: %d).", g_szAdminInfo[szName], szTeamName, iSpeed)
        else log_amx("Admin All-In-One Commands: <%s> remove the new speed from the %s.", g_szAdminInfo[szName], szTeamName)
      }
      #endif
    }
    else {
      console_print(id, _T("No player in this team."))
    }
  }
  else {
    iPlayer = CmdTargetExtra(id, szTarget, 3)
    if(!iPlayer)
      return PLUGIN_HANDLED_MAIN

    GetPlayerInfos(iPlayer)

    if(!HasUserSpeed(iPlayer) && iSpeed == 0) {
      console_print(id, _T("Player ^"%s^" has not already a new speed!"), g_szPlayerInfo[szName])
      return PLUGIN_HANDLED_MAIN
    }

    if(iSpeed) {
      if(!g_bIsBot[iPlayer]) {
        new iValue = (iSpeed > MAXSPEED_MAX_DEFAULT) ? iSpeed : MAXSPEED_MAX_DEFAULT
        client_cmd(iPlayer, ";cl_forwardspeed %d;cl_backspeed %d;cl_sidespeed %d", iValue, iValue, iValue)
      }

      g_flSpeedValue[iPlayer] = float(iSpeed)
      set_user_maxspeed(iPlayer, g_flSpeedValue[iPlayer])
      SetUserSpeed(iPlayer)
    }
    else {
      CS_ResetUserMaxSpeed(iPlayer)
    }

    if(iSpeed) console_print(id, _T("Speed changed for the player ^"%s^" (speed: %d)."), g_szPlayerInfo[szName], iSpeed)
    else console_print(id, _T("New speed removed from ^"%s^"."), g_szPlayerInfo[szName])

    #if !defined COLORED_ACTIVITY
    if(iSpeed) show_activity(id, g_szAdminInfo[szName], _T("change speed of %s."), g_szPlayerInfo[szName])
    else show_activity(id, g_szAdminInfo[szName], _T("remove the new speed from %s."), g_szPlayerInfo[szName])
    #else
    if(iSpeed) show_activity_color(id, g_szAdminInfo[szName], _T("change speed of %s."), g_szPlayerInfo[szName])
    else show_activity_color(id, g_szAdminInfo[szName], _T("remove the new speed from %s."), g_szPlayerInfo[szName])
    #endif

    #if defined USE_LOGS
    if(id > 0) {
      if(iSpeed) log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" change speed of ^"<%s><%d><%s><%s>^" (speed: %d).",
      g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress],
      g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress], iSpeed)
      else log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" remove the new speed from ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress],
      g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    else {
      if(iSpeed) log_amx("Admin All-In-One Commands: <%s> change speed of ^"<%s><%d><%s><%s>^" (speed: %d).",
      g_szAdminInfo[szName], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress], iSpeed)
      else log_amx("Admin All-In-One Commands: <%s> remove the new speed from ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    #endif
  }
  return PLUGIN_HANDLED_MAIN
}

CS_ResetUserMaxSpeed(id) {
  new iUnused, Float:flMaxSpeed
  switch(get_user_weapon(id, iUnused, iUnused)) {
    case CSW_SG550, CSW_G3SG1, CSW_AWP: flMaxSpeed = 210.0
    case CSW_M249, CSW_AK47: flMaxSpeed = 220.0
    case CSW_M3, CSW_M4A1: flMaxSpeed = 230.0
    case CSW_SG552: flMaxSpeed = 235.0
    case CSW_XM1014, CSW_AUG, CSW_GALIL, CSW_FAMAS: flMaxSpeed = 240.0
    case CSW_P90: flMaxSpeed = 245.0
    case CSW_SCOUT: flMaxSpeed = 260.0
    default: flMaxSpeed = 250.0
  }

  if(!g_bIsBot[id]) {
    client_cmd(id, ";cl_forwardspeed %d;cl_backspeed %d;cl_sidespeed %d", MAXSPEED_MAX_DEFAULT, MAXSPEED_MAX_DEFAULT, MAXSPEED_MAX_DEFAULT)
  }

  set_user_maxspeed(id, flMaxSpeed)
  RemoveUserSpeed(id)
}

public Event_CurWeapon(iClientID) {
  if(g_bFreezeTime == false && HasUserSpeed(iClientID)) {
    set_user_maxspeed(iClientID, g_flSpeedValue[iClientID])
  }
}

public Event_RoundTime(iClientID) {
  if(read_data(1) == floatround(get_cvarptr_float(g_pCVar_MPRoundTime) * 60.0)) {
    g_bFreezeTime = false

    if(HasUserSpeed(iClientID)) {
      set_user_maxspeed(iClientID, g_flSpeedValue[iClientID])
    }
  }
}

public Event_Health(iClientID) {
  if(get_cvarptr_num(g_pCVar_AMXMaxSpeedStore) <= 0 && IsEntityClient(iClientID) && HasUserSpeed(iClientID)) {
    CS_ResetUserMaxSpeed(iClientID)
  }
}

public Event_TextMsg() {
  for(new iClientID = 1; iClientID <= g_iMaxClients; iClientID++) {
    if(!HasUserSpeed(iClientID) || !is_user_connected(iClientID))
      continue

    CS_ResetUserMaxSpeed(iClientID)
  }
}

public Task_SetUserSpeedCVars(iClientID) {
  iClientID -= TASKID_SetUserSpeedCVars

  if(is_user_connected(iClientID)) {
    client_cmd(iClientID, ";cl_forwardspeed %d", MAXSPEED_MAX_DEFAULT)
    client_cmd(iClientID, ";cl_backspeed %d", MAXSPEED_MAX_DEFAULT)
    client_cmd(iClientID, ";cl_sidespeed %d", MAXSPEED_MAX_DEFAULT)
  }
}

/*******************************************************************************
 * Admin Gravity
 ******************************************************************************/
public cmdGravity(id, iLevel, iCommandId) {
  if(!cmd_access(id, iLevel, iCommandId, 3))
    return PLUGIN_HANDLED_MAIN

  new szTarget[32], szGravity[8], iPlayer
  read_argv(1, szTarget, charsmax(szTarget))
  read_argv(2, szGravity, charsmax(szGravity))

  new Float:flGravity = equali(szGravity, "normal") ? 1.0 : (floatstr(szGravity) / 800)
  if(flGravity != 1.0 && !is_str_num(szGravity)) {
    console_print(id, _T("The gravity parameter must be a number!"))
    return PLUGIN_HANDLED_MAIN
  }

  new bool:bHasSupreme = access(id, ADMIN_SUPREME) ? true : false

  GetAdminInfos(id)

  if(equali(szTarget, "@all")) {
    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "ah")
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        set_user_gravity(iPlayer, flGravity)
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      console_print(id, _T("The gravity of all players has been changed (gravity: %s)."), szGravity)

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("change gravity of all players."))
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("change gravity of all players."))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" change gravity of all players (gravity: %s).",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szGravity)
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> change gravity of all players (gravity: %s).", g_szAdminInfo[szName], szGravity)
      }
      #endif
    }
    else {
      console_print(id, _T("No alive player on the server."))
    }
  }
  else if(szTarget[0] == '@') {
    if(!CanUseTeamAsTarget(id))
      return PLUGIN_HANDLED_MAIN

    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "aegh", szTarget[1])
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        set_user_gravity(iPlayer, flGravity)
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      new szTeamName[32]
      GetTeamName(szTarget, szTeamName, charsmax(szTeamName))

      console_print(id, _T("The gravity of the %s has been changed (gravity: %s)."), _T(szTeamName), szGravity)

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("change gravity of the %s."), _T(szTeamName))
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("change gravity of the %s."), _T(szTeamName))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" change gravity of the %s (gravity: %s).",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szTeamName, szGravity)
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> change gravity of the %s (gravity: %s).", g_szAdminInfo[szName], szTeamName, szGravity)
      }
      #endif
    }
    else {
      console_print(id, _T("No alive player in this team."))
    }
  }
  else {
    iPlayer = CmdTargetExtra(id, szTarget, 7)
    if(!iPlayer)
      return PLUGIN_HANDLED_MAIN

    set_user_gravity(iPlayer, flGravity)

    GetPlayerInfos(iPlayer)

    console_print(id, _T("The gravity of %s has been changed (gravity: %s)."), g_szPlayerInfo[szName], szGravity)

    #if !defined COLORED_ACTIVITY
    show_activity(id, g_szAdminInfo[szName], _T("change gravity of %s."), g_szPlayerInfo[szName])
    #else
    show_activity_color(id, g_szAdminInfo[szName], _T("change gravity of %s."), g_szPlayerInfo[szName])
    #endif

    #if defined USE_LOGS
    if(id > 0) {
      log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" change gravity of ^"<%s><%d><%s><%s>^" (gravity: %s).",
      g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress],
      g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress], szGravity)
    }
    else {
      log_amx("Admin All-In-One Commands: <%s> change gravity of ^"<%s><%d><%s><%s>^" (gravity: %s).",
      g_szAdminInfo[szName], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress], szGravity)
    }
    #endif
  }
  return PLUGIN_HANDLED_MAIN
}

/*******************************************************************************
 * Admin Teleport
 ******************************************************************************/
public cmdTeleport(id, iLevel, iCommandId) {
  if(!cmd_access(id, iLevel, iCommandId, 2))
    return PLUGIN_HANDLED_MAIN

  new szTarget[32], iCoord[3][8], iOrigin[3]
  read_argv(1, szTarget, charsmax(szTarget))
  if(read_argc() > 2) {
    read_argv(2, iCoord[0], charsmax(iCoord[]))
    read_argv(3, iCoord[1], charsmax(iCoord[]))
    read_argv(4, iCoord[2], charsmax(iCoord[]))
    iOrigin[0] = str_to_num(iCoord[0])
    iOrigin[1] = str_to_num(iCoord[1])
    iOrigin[2] = str_to_num(iCoord[2])
  }
  else {
    iOrigin = g_iStoredOrigin[id]
  }

  new iPlayer = CmdTargetExtra(id, szTarget, 7)
  if(!iPlayer)
    return PLUGIN_HANDLED_MAIN

  set_user_origin(iPlayer, iOrigin)

  GetAdminInfos(id)
  GetPlayerInfos(iPlayer)

  console_print(id, _T("Player ^"%s^" teleported to coordinates: %d %d %d"), g_szPlayerInfo[szName], iOrigin[0], iOrigin[1], iOrigin[2])

  #if !defined COLORED_ACTIVITY
  show_activity(id, g_szAdminInfo[szName], _T("teleport %s."), g_szPlayerInfo[szName])
  #else
  show_activity_color(id, g_szAdminInfo[szName], _T("teleport %s."), g_szPlayerInfo[szName])
  #endif

  #if defined USE_LOGS
  if(id > 0) {
    log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" teleport ^"<%s><%d><%s><%s>^" to coordinates: %d %d %d",
    g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress],
    g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress], iOrigin[0], iOrigin[1], iOrigin[2])
  }
  else {
    log_amx("Admin All-In-One Commands: <%s> teleport ^"<%s><%d><%s><%s>^" to coordinates: %d %d %d",
    g_szAdminInfo[szName], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress], iOrigin[0], iOrigin[1], iOrigin[2])
  }
  #endif
  return PLUGIN_HANDLED_MAIN
}

public cmdUserOrigin(id, iLevel, iCommandId) {
  if(!cmd_access(id, iLevel, iCommandId, 2))
    return PLUGIN_HANDLED_MAIN

  new szTarget[32]
  read_argv(1, szTarget, charsmax(szTarget))
  new iPlayer = CmdTargetExtra(id, szTarget, 7)
  if(!iPlayer)
    return PLUGIN_HANDLED_MAIN

  new iOrigin[3]
  get_user_origin(iPlayer, iOrigin)
  iOrigin[2] += 2
  g_iStoredOrigin[id] = iOrigin

  GetPlayerInfos(iPlayer)

  console_print(id, _T("Position of %s is: %d %d %d"), g_szPlayerInfo[szName], iOrigin[0], iOrigin[1], iOrigin[2])

  #if defined USE_LOGS
  GetAdminInfos(id)

  if(id > 0) {
    log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" ask the position (origin) of ^"<%s><%d><%s><%s>^" (%d %d %d).",
    g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress],
    g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress], iOrigin[0], iOrigin[1], iOrigin[2])
  }
  else {
    log_amx("Admin All-In-One Commands: <%s> ask the position (origin) of ^"<%s><%d><%s><%s>^" (%d %d %d).",
    g_szAdminInfo[szName], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress], iOrigin[0], iOrigin[1], iOrigin[2])
  }
  #endif
  return PLUGIN_HANDLED_MAIN
}

/*******************************************************************************
 * Admin Stack
 ******************************************************************************/
public cmdStack(id, iLevel, iCommandId) {
  if(!cmd_access(id, iLevel, iCommandId, 2))
    return PLUGIN_HANDLED_MAIN

  new szTarget[32]
  read_argv(1, szTarget, charsmax(szTarget))
  new iPlayer = CmdTargetExtra(id, szTarget, 7)
  if(!iPlayer)
    return PLUGIN_HANDLED_MAIN

  new szType[2], iOrigin[3]
  new bool:bHasSupreme = access(id, ADMIN_SUPREME) ? true : false
  read_argv(2, szType, charsmax(szType))
  get_user_origin(iPlayer, iOrigin)
  new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum, iPlayer2
  get_players(iPlayers, iPlayersNum, "ah")

  new iOffsetY = 36, iOffsetZ = 96
  switch(str_to_num(szType)) {
    case 0, 1: iOffsetY = 0
    case 2: iOffsetZ = 0
  }

  for(new i = 0; i < iPlayersNum; i++) {
    iPlayer2 = iPlayers[i]

    if(iPlayer2 == iPlayer || iPlayer2 == id) {
      iBlockedPlayersNum++
      continue
    }

    if((bHasSupreme == false) && (get_user_flags(iPlayer2) & ADMIN_IMMUNITY)) {
      get_user_name(iPlayer2, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
      console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
      iBlockedPlayersNum++
      continue
    }

    iOrigin[1] += iOffsetY
    iOrigin[2] += iOffsetZ
    set_user_origin(iPlayer2, iOrigin) 
  }

  GetPlayerInfos(iPlayer)

  if(iBlockedPlayersNum == iPlayersNum) {
    console_print(id, _T("That action can not be performed on player ^"%s^"."), g_szPlayerInfo[szName])
    return PLUGIN_HANDLED_MAIN
  }

  GetAdminInfos(id)

  console_print(id, _T("Player ^"%s^" has all players stacked on him!"), g_szPlayerInfo[szName])

  #if !defined COLORED_ACTIVITY
  show_activity(id, g_szAdminInfo[szName], _T("stack all players on %s."), g_szPlayerInfo[szName])
  #else
  show_activity_color(id, g_szAdminInfo[szName], _T("stack all players on %s."), g_szPlayerInfo[szName])
  #endif

  #if defined USE_LOGS
  if(id > 0) {
    log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" stack all players on ^"<%s><%d><%s><%s>^".",
    g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress],
    g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
  }
  else {
    log_amx("Admin All-In-One Commands: <%s> stack all players on ^"<%s><%d><%s><%s>^".",
    g_szAdminInfo[szName], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
  }
  #endif
  return PLUGIN_HANDLED_MAIN
}

/*******************************************************************************
 * Admin Glow
 ******************************************************************************/
const MAX_COLORS = 10
new const g_szColorsNames[MAX_COLORS][] = {"white", "red", "green", "blue", "yellow", "magenta", "cyan", "orange", "amx", "amxmod"}
new const g_iColorsValues[MAX_COLORS][] = {
  {255, 255, 255}, // white
  {255, 0, 0}, // red
  {0, 255, 0}, // green
  {0, 0, 255}, // blue
  {255, 255, 0}, // yellow
  {255, 0, 255}, // magenta
  {0, 255, 255}, // cyan
  {255, 100, 0}, // orange
  {0, 100, 255}, // AMX Mod original info color!
  {0, 100, 255} // AMX Mod original info color!
}

bool:bIsColorValue(const szText[], id) {
  for(new a = 0; a < MAX_COLORS; a++) {
    if(equali(szText, _T(g_szColorsNames[a], id)) || equali(szText, g_szColorsNames[a])) {
      g_iColorNum = a
      return true
    }
  }
  return false
}

enum eColors {
  szRed[4],
  szGreen[4],
  szBlue[4]
}

public cmdGlow(id, iLevel, iCommandId) {
  if(!cmd_access(id, iLevel, iCommandId, 3))
    return PLUGIN_HANDLED_MAIN

  new szTarget[32], szColor[12], szAlpha[4], szColorFormat[32], iPlayer
  new iRed, iGreen, iBlue, iAlpha
  read_argv(1, szTarget, charsmax(szTarget))
  read_argv(2, szColor, charsmax(szColor))

  new iStatus = (szColor[0] == 'I' || szColor[0] == 'i') ? 2 : ((szColor[0] == 'N' || szColor[0] == 'n') ? 3 : 1)
  new bool:bHasSupreme = access(id, ADMIN_SUPREME) ? true : false

  GetAdminInfos(id)

  if(iStatus == 1) {
    if(szColor[0] == '!' && szColor[9]) {
      new szColors[eColors]
      copy(szColors[szRed], charsmax(szColors[szRed]), szColor[1])
      copy(szColors[szGreen], charsmax(szColors[szGreen]), szColor[4])
      copy(szColors[szBlue], charsmax(szColors[szBlue]), szColor[7])
      iRed   = str_to_num(szColors[szRed])
      iGreen = str_to_num(szColors[szGreen])
      iBlue  = str_to_num(szColors[szBlue])
    }
    else if(bIsColorValue(szColor, id)) {
      iRed    = g_iColorsValues[g_iColorNum][0]
      iGreen  = g_iColorsValues[g_iColorNum][1]
      iBlue   = g_iColorsValues[g_iColorNum][2]
      iStatus = 0
    }
    else {
      iRed   = random_num(0, 255)
      iGreen = random_num(0, 255)
      iBlue  = random_num(0, 255)
    }
  }

  iAlpha = (iStatus > 1) ? 0 : (read_argv(3, szAlpha, charsmax(szAlpha)) ? str_to_num(szAlpha) : 16)
  switch(iStatus) {
    case 0: copy(szColorFormat, charsmax(szColorFormat), _T(g_szColorsNames[g_iColorNum], id))
    case 1: formatex(szColorFormat, charsmax(szColorFormat), _T("RGB values: %d %d %d", id), iRed, iGreen, iBlue)
    case 2, 3: copy(szColorFormat, charsmax(szColorFormat), (iStatus == 2) ? _T("invisible", id) : _T("normal", id))
  }

  if(equali(szTarget, "@all")) {
    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "ah")
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        switch(iStatus) {
          case 0, 1: set_user_rendering(iPlayer, kRenderFxGlowShell, iRed, iGreen, iBlue, kRenderNormal, iAlpha)
          case 2: set_user_rendering(iPlayer, kRenderFxGlowShell, 0, 0, 0, kRenderTransAlpha, iAlpha)
          case 3: set_user_rendering(iPlayer, kRenderFxGlowShell, 0, 0, 0, kRenderNormal, iAlpha)
        }
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      if(iStatus < 3) console_print(id, _T("All players are now glowing (%s)."), szColorFormat)
      else console_print(id, _T("All players are not glowing anymore (%s)."), szColorFormat)

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("make all players %s."), (iStatus == 3) ? _T("unglow") : _T("glow"))
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("make all players %s."), (iStatus == 3) ? _T("unglow") : _T("glow"))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" make all players %s (%s).",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], (iStatus == 3) ? "unglow" : "glow",
        (iStatus == 2) ? "invisible" : ((iStatus == 3) ? "normal" : ((iStatus == 1) ? "RGB values: %d %d %d" : g_szColorsNames[g_iColorNum])))
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> make all players %s (%s).",
        g_szAdminInfo[szName], (iStatus == 3) ? "unglow" : "glow",
        (iStatus == 2) ? "invisible" : ((iStatus == 3) ? "normal" : ((iStatus == 1) ? "RGB values: %d %d %d" : g_szColorsNames[g_iColorNum])))
      }
      #endif
    }
    else {
      console_print(id, _T("No alive player on the server."))
    }
  }
  else if(szTarget[0] == '@') {
    if(!CanUseTeamAsTarget(id))
      return PLUGIN_HANDLED_MAIN

    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "aegh", szTarget[1])
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        switch(iStatus) {
          case 0, 1: set_user_rendering(iPlayer, kRenderFxGlowShell, iRed, iGreen, iBlue, kRenderNormal, iAlpha)
          case 2: set_user_rendering(iPlayer, kRenderFxGlowShell, 0, 0, 0, kRenderTransAlpha, iAlpha)
          case 3: set_user_rendering(iPlayer, kRenderFxGlowShell, 0, 0, 0, kRenderNormal, iAlpha)
        }
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      new szTeamName[32]
      GetTeamName(szTarget, szTeamName, charsmax(szTeamName))

      if(iStatus < 3) console_print(id, _T("The %s are now glowing (%s)."), _T(szTeamName), szColorFormat)
      else console_print(id, _T("The %s are not glowing anymore (%s)."), _T(szTeamName), szColorFormat)

      #if !defined COLORED_ACTIVITY
      if(iStatus < 3) show_activity(id, g_szAdminInfo[szName], _T("make the %s glow."), _T(szTeamName))
      else show_activity(id, g_szAdminInfo[szName], _T("make the %s unglow."), _T(szTeamName))
      #else
      if(iStatus < 3) show_activity_color(id, g_szAdminInfo[szName], _T("make the %s glow."), _T(szTeamName))
      else show_activity_color(id, g_szAdminInfo[szName], _T("make the %s unglow."), _T(szTeamName))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" make the %s %s (%s).",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szTeamName, (iStatus == 3) ? "unglow" : "glow",
        (iStatus == 2) ? "invisible" : ((iStatus == 3) ? "normal" : ((iStatus == 1) ? "RGB values: %d %d %d" : g_szColorsNames[g_iColorNum])))
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> make the %s %s (%s).",
        g_szAdminInfo[szName], szTeamName, (iStatus == 3) ? "unglow" : "glow",
        (iStatus == 2) ? "invisible" : ((iStatus == 3) ? "normal" : ((iStatus == 1) ? "RGB values: %d %d %d" : g_szColorsNames[g_iColorNum])))
      }
      #endif
    }
    else {
      console_print(id, _T("No alive player in this team."))
    }
  }
  else {
    iPlayer = CmdTargetExtra(id, szTarget, 7)
    if(!iPlayer)
      return PLUGIN_HANDLED_MAIN

    switch(iStatus) {
      case 0, 1: set_user_rendering(iPlayer, kRenderFxGlowShell, iRed, iGreen, iBlue, kRenderNormal, iAlpha)
      case 2: set_user_rendering(iPlayer, kRenderFxGlowShell, 0, 0, 0, kRenderTransAlpha, iAlpha)
      case 3: set_user_rendering(iPlayer, kRenderFxGlowShell, 0, 0, 0, kRenderNormal, iAlpha)
    }

    GetPlayerInfos(iPlayer)

    if(iStatus < 3) console_print(id, _T("Player ^"%s^" is now glowing (%s)."), g_szPlayerInfo[szName], szColorFormat)
    else console_print(id, _T("Player ^"%s^" is not glowing anymore (%s)."), g_szPlayerInfo[szName], szColorFormat)

    #if !defined COLORED_ACTIVITY
    if(iStatus < 3) show_activity(id, g_szAdminInfo[szName], _T("make %s glow."), g_szPlayerInfo[szName])
    else show_activity(id, g_szAdminInfo[szName], _T("make %s unglow."), g_szPlayerInfo[szName])
    #else
    if(iStatus < 3) show_activity_color(id, g_szAdminInfo[szName], _T("make %s glow."), g_szPlayerInfo[szName])
    else show_activity_color(id, g_szAdminInfo[szName], _T("make %s unglow."), g_szPlayerInfo[szName])
    #endif

    #if defined USE_LOGS
    if(id > 0) {
      log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" make ^"<%s><%d><%s><%s>^" %s (%s).",
      g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress],
      g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress], (iStatus == 3) ? "unglow" : "glow",
      (iStatus == 2) ? "invisible" : ((iStatus == 3) ? "normal" : ((iStatus == 1) ? "RGB values: %d %d %d" : g_szColorsNames[g_iColorNum])))
    }
    else {
      log_amx("Admin All-In-One Commands: <%s> make ^"<%s><%d><%s><%s>^" %s (%s).",
      g_szAdminInfo[szName], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress], (iStatus == 3) ? "unglow" : "glow",
      (iStatus == 2) ? "invisible" : ((iStatus == 3) ? "normal" : ((iStatus == 1) ? "RGB values: %d %d %d" : g_szColorsNames[g_iColorNum])))
    }
    #endif
  }
  return PLUGIN_HANDLED_MAIN
}

/*******************************************************************************
 * Admin Godmode
 ******************************************************************************/
public cmdGodmode(id, iLevel, iCommandId) {
  if(!cmd_access(id, iLevel, iCommandId, 3))
    return PLUGIN_HANDLED_MAIN

  new szTarget[32], szStatus[2], iPlayer
  read_argv(1, szTarget, charsmax(szTarget))
  read_argv(2, szStatus, charsmax(szStatus))

  new iGodStatus = str_to_num(szStatus) ? 1 : 0
  new bool:bHasSupreme = access(id, ADMIN_SUPREME) ? true : false

  GetAdminInfos(id)

  if(equali(szTarget, "@all")) {
    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "ah")
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        set_user_godmode(iPlayer, iGodStatus)
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      if(iGodStatus) console_print(id, _T("Godmode given to all players."))
      else console_print(id, _T("Godmode removed from all players."))

      #if !defined COLORED_ACTIVITY
      if(iGodStatus) show_activity(id, g_szAdminInfo[szName], _T("give godmode to all players."))
      else show_activity(id, g_szAdminInfo[szName], _T("remove godmode from all players."))
      #else
      if(iGodStatus) show_activity_color(id, g_szAdminInfo[szName], _T("give godmode to all players."))
      else show_activity_color(id, g_szAdminInfo[szName], _T("remove godmode from all players."))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        if(iGodStatus) log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" give godmode to all players.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress])
        else log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" remove godmode from all players.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress])
      }
      else {
        if(iGodStatus) log_amx("Admin All-In-One Commands: <%s> give godmode to all players.", g_szAdminInfo[szName])
        else log_amx("Admin All-In-One Commands: <%s> remove godmode from all players.", g_szAdminInfo[szName])
      }
      #endif
    }
    else {
      console_print(id, _T("No alive player on the server."))
    }
  }
  else if(szTarget[0] == '@') {
    if(!CanUseTeamAsTarget(id))
      return PLUGIN_HANDLED_MAIN

    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "aegh", szTarget[1])
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        set_user_godmode(iPlayer, iGodStatus)
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      new szTeamName[32]
      GetTeamName(szTarget, szTeamName, charsmax(szTeamName))

      if(iGodStatus) console_print(id, _T("Godmode given to the %s."), _T(szTeamName))
      else console_print(id, _T("Godmode removed from the %s."), _T(szTeamName))

      #if !defined COLORED_ACTIVITY
      if(iGodStatus) show_activity(id, g_szAdminInfo[szName], _T("give godmode to the %s."), _T(szTeamName))
      else show_activity(id, g_szAdminInfo[szName], _T("remove godmode from the %s."), _T(szTeamName))
      #else
      if(iGodStatus) show_activity_color(id, g_szAdminInfo[szName], _T("give godmode to the %s."), _T(szTeamName))
      else show_activity_color(id, g_szAdminInfo[szName], _T("remove godmode from the %s."), _T(szTeamName))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        if(iGodStatus) log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" give godmode to the %s.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szTeamName)
        else log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" remove godmode from the %s.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szTeamName)
      }
      else {
        if(iGodStatus) log_amx("Admin All-In-One Commands: <%s> give godmode to the %s.", g_szAdminInfo[szName], szTeamName)
        else log_amx("Admin All-In-One Commands: <%s> remove godmode from the %s.", g_szAdminInfo[szName], szTeamName)
      }
      #endif
    }
    else {
      console_print(id, _T("No alive player in this team."))
    }
  }
  else {
    iPlayer = CmdTargetExtra(id, szTarget, 7)
    if(!iPlayer)
      return PLUGIN_HANDLED_MAIN

    set_user_godmode(iPlayer, iGodStatus)

    GetPlayerInfos(iPlayer)

    if(iGodStatus) console_print(id, _T("Godmode given to %s."), g_szPlayerInfo[szName])
    else console_print(id, _T("Godmode removed from %s."), g_szPlayerInfo[szName])

    #if !defined COLORED_ACTIVITY
    if(iGodStatus) show_activity(id, g_szAdminInfo[szName], _T("give godmode to %s."), g_szPlayerInfo[szName])
    else show_activity(id, g_szAdminInfo[szName], _T("remove godmode from %s."), g_szPlayerInfo[szName])
    #else
    if(iGodStatus) show_activity_color(id, g_szAdminInfo[szName], _T("give godmode to %s."), g_szPlayerInfo[szName])
    else show_activity_color(id, g_szAdminInfo[szName], _T("remove godmode from %s."), g_szPlayerInfo[szName])
    #endif

    #if defined USE_LOGS
    if(id > 0) {
      if(iGodStatus) log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" give godmode to ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress],
      g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
      else log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" remove godmode from ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress],
      g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    else {
      if(iGodStatus) log_amx("Admin All-In-One Commands: <%s> give godmode to ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
      else log_amx("Admin All-In-One Commands: <%s> remove godmode from ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    #endif
  }
  return PLUGIN_HANDLED_MAIN
}

/*******************************************************************************
 * Admin Noclip
 ******************************************************************************/
public cmdNoclip(id, iLevel, iCommandId) {
  if(!cmd_access(id, iLevel, iCommandId, 3))
    return PLUGIN_HANDLED_MAIN

  new szTarget[32], szStatus[2], iPlayer
  read_argv(1, szTarget, charsmax(szTarget))
  read_argv(2, szStatus, charsmax(szStatus))

  new iNoclipStatus    = str_to_num(szStatus) ? 1 : 0
  new bool:bHasSupreme = access(id, ADMIN_SUPREME) ? true : false

  GetAdminInfos(id)

  if(equali(szTarget, "@all")) {
    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "ach")
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        set_user_noclip(iPlayer, iNoclipStatus)
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      if(iNoclipStatus) console_print(id, _T("Noclip given to all players."))
      else console_print(id, _T("Noclip removed from all players."))

      #if !defined COLORED_ACTIVITY
      if(iNoclipStatus) show_activity(id, g_szAdminInfo[szName], _T("give noclip to all players."))
      else show_activity(id, g_szAdminInfo[szName], _T("remove noclip from all players."))
      #else
      if(iNoclipStatus) show_activity_color(id, g_szAdminInfo[szName], _T("give noclip to all players."))
      else show_activity_color(id, g_szAdminInfo[szName], _T("remove noclip from all players."))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        if(iNoclipStatus) log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" give noclip to all players.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress])
        else log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" remove noclip from all players.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress])
      }
      else {
        if(iNoclipStatus) log_amx("Admin All-In-One Commands: <%s> give noclip to all players.", g_szAdminInfo[szName])
        else log_amx("Admin All-In-One Commands: <%s> remove noclip from all players.", g_szAdminInfo[szName])
      }
      #endif
    }
    else {
      console_print(id, _T("No real alive player on the server."))
    }
  }
  else if(szTarget[0] == '@') {
    if(!CanUseTeamAsTarget(id))
      return PLUGIN_HANDLED_MAIN

    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "acegh", szTarget[1])
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        set_user_noclip(iPlayer, iNoclipStatus)
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      new szTeamName[32]
      GetTeamName(szTarget, szTeamName, charsmax(szTeamName))

      if(iNoclipStatus) console_print(id, _T("Noclip given to the %s."), _T(szTeamName))
      else console_print(id, _T("Noclip removed from the %s."), _T(szTeamName))

      #if !defined COLORED_ACTIVITY
      if(iNoclipStatus) show_activity(id, g_szAdminInfo[szName], _T("give noclip to the %s."), _T(szTeamName))
      else show_activity(id, g_szAdminInfo[szName], _T("remove noclip from the %s."), _T(szTeamName))
      #else
      if(iNoclipStatus) show_activity_color(id, g_szAdminInfo[szName], _T("give noclip to the %s."), _T(szTeamName))
      else show_activity_color(id, g_szAdminInfo[szName], _T("remove noclip from the %s."), _T(szTeamName))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        if(iNoclipStatus) log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" give noclip to the %s.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szTeamName)
        else log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" remove noclip from the %s.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szTeamName)
      }
      else {
        if(iNoclipStatus) log_amx("Admin All-In-One Commands: <%s> give noclip to the %s.", g_szAdminInfo[szName], szTeamName)
        else log_amx("Admin All-In-One Commands: <%s> remove noclip from the %s.", g_szAdminInfo[szName], szTeamName)
      }
      #endif
    }
    else {
      console_print(id, _T("No real alive player in this team."))
    }
  }
  else {
    iPlayer = CmdTargetExtra(id, szTarget, 15)
    if(!iPlayer)
      return PLUGIN_HANDLED_MAIN

    set_user_noclip(iPlayer, iNoclipStatus)
    GetPlayerInfos(iPlayer)

    if(iNoclipStatus) console_print(id, _T("Noclip given to %s."), g_szPlayerInfo[szName])
    else console_print(id, _T("Noclip removed from %s."), g_szPlayerInfo[szName])

    #if !defined COLORED_ACTIVITY
    if(iNoclipStatus) show_activity(id, g_szAdminInfo[szName], _T("give noclip to %s."), g_szPlayerInfo[szName])
    else show_activity(id, g_szAdminInfo[szName], _T("remove noclip from %s."), g_szPlayerInfo[szName])
    #else
    if(iNoclipStatus) show_activity_color(id, g_szAdminInfo[szName], _T("give noclip to %s."), g_szPlayerInfo[szName])
    else show_activity_color(id, g_szAdminInfo[szName], _T("remove noclip from %s."), g_szPlayerInfo[szName])
    #endif

    #if defined USE_LOGS
    if(id > 0) {
      if(iNoclipStatus) log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" give noclip to ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress],
      g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
      else log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" remove noclip from ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress],
      g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    else {
      if(iNoclipStatus) log_amx("Admin All-In-One Commands: <%s> give noclip to ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
      else log_amx("Admin All-In-One Commands: <%s> remove noclip from ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    #endif
  }
  return PLUGIN_HANDLED_MAIN
}

/*******************************************************************************
 * Admin Revive
 ******************************************************************************/
public cmdRevive(id, iLevel, iCommandId) {
  if(!cmd_access(id, iLevel, iCommandId, 2))
    return PLUGIN_HANDLED_MAIN

  new szTarget[32], iPlayer
  read_argv(1, szTarget, charsmax(szTarget))

  new bool:bHasSupreme = access(id, ADMIN_SUPREME) ? true : false

  GetAdminInfos(id)

  if(equali(szTarget, "@all")) {
    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "bh")
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if(1 <= CS_GetUserTeam(iPlayer) <= 2) {
          if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
            get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
            console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
            iBlockedPlayersNum++
            continue
          }

          entity_set_int(iPlayer, EV_INT_deadflag, DEAD_RESPAWNABLE)
          set_task(TASKID_INTERVAL_RevivePlayer, "Task_RevivePlayer", iPlayer + TASKID_RevivePlayer)
        }
        else iBlockedPlayersNum++
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      console_print(id, _T("All players have been resurrected."))

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("make revive all players."))
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("make revive all players."))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" make revive all players.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress])
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> make revive all players.", g_szAdminInfo[szName])
      }
      #endif
    }
    else {
      console_print(id, _T("No dead player on the server."))
    }
  }
  else if(szTarget[0] == '@') {
    if(!CanUseTeamAsTarget(id))
      return PLUGIN_HANDLED_MAIN

    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "begh", szTarget[1])
    if(iPlayersNum > 0 && (1 <= str_to_num(szTarget[1]) <= 2
    || szTarget[1] == 'T' || szTarget[1] == 't' || szTarget[1] == 'C' || szTarget[1] == 'c')) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        entity_set_int(iPlayer, EV_INT_deadflag, DEAD_RESPAWNABLE)
        set_task(TASKID_INTERVAL_RevivePlayer, "Task_RevivePlayer", iPlayer + TASKID_RevivePlayer)
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      new szTeamName[32]
      GetTeamName(szTarget, szTeamName, charsmax(szTeamName))

      console_print(id, _T("The %s have been resurrected."), _T(szTeamName))

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("make revive the %s."), _T(szTeamName))
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("make revive the %s."), _T(szTeamName))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" make revive the %s.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szTeamName)
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> make revive the %s.", g_szAdminInfo[szName], szTeamName)
      }
      #endif
    }
    else {
      console_print(id, _T("No dead player in this team."))
    }
  }
  else {
    iPlayer = CmdTargetExtra(id, szTarget, 3)
    if(!iPlayer)
      return PLUGIN_HANDLED_MAIN

    GetPlayerInfos(iPlayer)

    if(!is_user_alive(iPlayer) && (1 <= CS_GetUserTeam(iPlayer) <= 2)) {
      entity_set_int(iPlayer, EV_INT_deadflag, DEAD_RESPAWNABLE)
      set_task(TASKID_INTERVAL_RevivePlayer, "Task_RevivePlayer", iPlayer + TASKID_RevivePlayer)

      console_print(id, _T("Player ^"%s^" resurrected."), g_szPlayerInfo[szName])

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("make revive %s."), g_szPlayerInfo[szName])
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("make revive %s."), g_szPlayerInfo[szName])
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" make revive ^"<%s><%d><%s><%s>^".",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress],
        g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> make revive ^"<%s><%d><%s><%s>^".",
        g_szAdminInfo[szName], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
      }
      #endif
    }
    else {
      console_print(id, _T("Player ^"%s^" is not dead or he is spectator."), g_szPlayerInfo[szName])
    }
  }
  return PLUGIN_HANDLED_MAIN
}

public Task_RevivePlayer(id) {
  id -= TASKID_RevivePlayer

  if(is_user_connected(id)) {
    user_spawn(id)

    if(!has_user_weapon(id, CSW_KNIFE)) {
      give_item(id, g_szDefaultMeleeWeapon)
    }

    /*switch(CS_GetUserTeam(id)) {
      case 1: {
        new iWeaponEntityID = give_item(id, "weapon_glock18")
        CS_SetUserBPAmmo(id, iWeaponEntityID, 40)
      }
      case 2: {
        new iWeaponEntityID = give_item(id, "weapon_usp")
        CS_SetUserBPAmmo(id, iWeaponEntityID, 24)
      }
    }*/
  }
}

/*******************************************************************************
 * Admin Disarm
 ******************************************************************************/
public cmdDisarm(id, iLevel, iCommandId) {
  if(!cmd_access(id, iLevel, iCommandId, 2))
    return PLUGIN_HANDLED_MAIN

  new szTarget[32], iPlayer
  read_argv(1, szTarget, charsmax(szTarget))

  new bool:bHasSupreme = access(id, ADMIN_SUPREME) ? true : false

  GetAdminInfos(id)

  if(equali(szTarget, "@all")) {
    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "ah")
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if(iPlayer == id) {
          console_print(id, _T("That action can not be performed on yourself (skipped)."))
          iBlockedPlayersNum++
          continue
        }

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        if(g_szDefaultMeleeWeapon[0]) {
          engclient_cmd(iPlayer, g_szDefaultMeleeWeapon)
        }

        strip_user_weapons(iPlayer)

        if(g_iMO_CBasePlayer_m_bHasPrimary >= 0) {
          set_offset_int(iPlayer, g_iMO_CBasePlayer_m_bHasPrimary, 0)
        }
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      console_print(id, _T("All players have been disarmed."))

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("disarm all players."))
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("disarm all players."))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" disarm all players.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress])
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> disarm all players.", g_szAdminInfo[szName])
      }
      #endif
    }
    else {
      console_print(id, _T("No alive player on the server."))
    }
  }
  else if(szTarget[0] == '@') {
    if(!CanUseTeamAsTarget(id))
      return PLUGIN_HANDLED_MAIN

    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "aegh", szTarget[1])
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if(iPlayer == id) {
          console_print(id, _T("That action can not be performed on yourself (skipped)."))
          iBlockedPlayersNum++
          continue
        }

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        if(g_szDefaultMeleeWeapon[0]) {
          engclient_cmd(iPlayer, g_szDefaultMeleeWeapon)
        }

        strip_user_weapons(iPlayer)

        if(g_iMO_CBasePlayer_m_bHasPrimary >= 0) {
          set_offset_int(iPlayer, g_iMO_CBasePlayer_m_bHasPrimary, 0)
        }
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      new szTeamName[32]
      GetTeamName(szTarget, szTeamName, charsmax(szTeamName))

      console_print(id, _T("The %s have been disarmed."), _T(szTeamName))

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("disarm the %s."), _T(szTeamName))
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("disarm the %s."), _T(szTeamName))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" disarm the %s.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szTeamName)
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> disarm the %s.", g_szAdminInfo[szName], szTeamName)
      }
      #endif
    }
    else {
      console_print(id, _T("No alive player in this team."))
    }
  }
  else {
    iPlayer = CmdTargetExtra(id, szTarget, 7)
    if(!iPlayer)
      return PLUGIN_HANDLED_MAIN

    if(g_szDefaultMeleeWeapon[0]) {
      engclient_cmd(iPlayer, g_szDefaultMeleeWeapon)
    }

    strip_user_weapons(iPlayer)

    if(g_iMO_CBasePlayer_m_bHasPrimary >= 0) {
      set_offset_int(iPlayer, g_iMO_CBasePlayer_m_bHasPrimary, 0)
    }

    GetPlayerInfos(iPlayer)

    console_print(id, _T("Player ^"%s^" disarmed."), g_szPlayerInfo[szName])

    #if !defined COLORED_ACTIVITY
    show_activity(id, g_szAdminInfo[szName], _T("disarm %s."), g_szPlayerInfo[szName])
    #else
    show_activity_color(id, g_szAdminInfo[szName], _T("disarm %s."), g_szPlayerInfo[szName])
    #endif

    #if defined USE_LOGS
    if(id > 0) {
      log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" disarm ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress],
      g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    else {
      log_amx("Admin All-In-One Commands: <%s> disarm ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    #endif
  }
  return PLUGIN_HANDLED_MAIN
}

/*******************************************************************************
 * Admin Bury
 ******************************************************************************/
public cmdBury(id, iLevel, iCommandId) {
  if(!cmd_access(id, iLevel, iCommandId, 3))
    return PLUGIN_HANDLED_MAIN

  new szTarget[32], szStatus[2], iPlayer
  read_argv(1, szTarget, charsmax(szTarget))
  read_argv(2, szStatus, charsmax(szStatus))

  new bool:bBuryStatus = str_to_num(szStatus) ? true : false
  new bool:bHasSupreme = access(id, ADMIN_SUPREME) ? true : false

  GetAdminInfos(id)

  if(equali(szTarget, "@all")) {
    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "ah")
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if(iPlayer == id) {
          console_print(id, _T("That action can not be performed on yourself (skipped)."))
          iBlockedPlayersNum++
          continue
        }

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        bBuryStatus ? BuryPlayer(iPlayer) : UnburyPlayer(iPlayer)
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      console_print(id, _T("All players have been %s."), bBuryStatus ? _T("buried") : _T("unburied"))

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("%s all players."), bBuryStatus ? _T("bury") : _T("unbury"))
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("%s all players."), bBuryStatus ? _T("bury") : _T("unbury"))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" %s all players.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], bBuryStatus ? "bury" : "unbury")
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> %s all players.", g_szAdminInfo[szName], bBuryStatus ? "bury" : "unbury")
      }
      #endif
    }
    else {
      console_print(id, _T("No alive player on the server."))
    }
  }
  else if(szTarget[0] == '@') {
    if(!CanUseTeamAsTarget(id))
      return PLUGIN_HANDLED_MAIN

    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "aegh", szTarget[1])
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if(iPlayer == id) {
          console_print(id, _T("That action can not be performed on yourself (skipped)."))
          iBlockedPlayersNum++
          continue
        }

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        bBuryStatus ? BuryPlayer(iPlayer) : UnburyPlayer(iPlayer)
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      new szTeamName[32]
      GetTeamName(szTarget, szTeamName, charsmax(szTeamName))

      console_print(id, _T("The %s have been %s."), _T(szTeamName), bBuryStatus ? _T("buried") : _T("unburied"))

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("%s the %s."), bBuryStatus ? _T("bury") : _T("unbury"), _T(szTeamName))
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("%s the %s."), bBuryStatus ? _T("bury") : _T("unbury"), _T(szTeamName))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" %s the %s.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], bBuryStatus ? "bury" : "unbury", szTeamName)
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> %s the %s.", g_szAdminInfo[szName], bBuryStatus ? "bury" : "unbury", szTeamName)
      }
      #endif
    }
    else {
      console_print(id, _T("No alive player in this team."))
    }
  }
  else {
    iPlayer = CmdTargetExtra(id, szTarget, 7)
    if(!iPlayer)
      return PLUGIN_HANDLED_MAIN

    bBuryStatus ? BuryPlayer(iPlayer) : UnburyPlayer(iPlayer)

    GetPlayerInfos(iPlayer)

    console_print(id, _T("Player ^"%s^" %s."), g_szPlayerInfo[szName], bBuryStatus ? _T("buried") : _T("unburied"))

    #if !defined COLORED_ACTIVITY
    show_activity(id, g_szAdminInfo[szName], _T("%s %s."), bBuryStatus ? _T("bury") : _T("unbury"), g_szPlayerInfo[szName])
    #else
    show_activity_color(id, g_szAdminInfo[szName], _T("%s %s."), bBuryStatus ? _T("bury") : _T("unbury"), g_szPlayerInfo[szName])
    #endif

    #if defined USE_LOGS
    if(id > 0) {
      log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" %s ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], bBuryStatus ? "bury" : "unbury",
      g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    else {
      log_amx("Admin All-In-One Commands: <%s> %s ^"<%s><%d><%s><%s>^".", g_szAdminInfo[szName], bBuryStatus ? "bury" : "unbury",
      g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    #endif
  }
  return PLUGIN_HANDLED_MAIN
}

BuryPlayer(id) {
  new iOrigin[3]
  new iWeapons[32], iWeaponsNum, szWeaponName[32]
  get_user_origin(id, iOrigin)
  iOrigin[2] -= 25
  set_user_origin(id, iOrigin)
  get_user_weapons(id, iWeapons, iWeaponsNum)
  for(new a = 0; a < iWeaponsNum; a++) {
    get_weaponname(iWeapons[a], szWeaponName, charsmax(szWeaponName))
    engclient_cmd(id, "drop", szWeaponName)
  }
  if(g_szDefaultMeleeWeapon[0]) {
    engclient_cmd(id, g_szDefaultMeleeWeapon)
  }
}

UnburyPlayer(id) {
  new iOrigin[3]
  get_user_origin(id, iOrigin)
  iOrigin[2] += 28
  set_user_origin(id, iOrigin)
}

/*******************************************************************************
 * Admin Slay 2
 ******************************************************************************/
public cmdSlay2(id, iLevel, iCommandId) {
  if(!cmd_access(id, iLevel, iCommandId, 2))
    return PLUGIN_HANDLED_MAIN

  new szTarget[32], szType[2], szSilent[8], szTypeFormat[12], iPlayer
  read_argv(1, szTarget, charsmax(szTarget))

  new iType = (read_argv(2, szType, charsmax(szType)) && (1 <= str_to_num(szType) <= 3)) ? str_to_num(szType) : random_num(1, 3)
  new iSilent = (read_argv(3, szSilent, charsmax(szSilent)) && str_to_num(szSilent)) ? 1 : 0
  new bool:bHasSupreme = access(id, ADMIN_SUPREME) ? true : false

  GetAdminInfos(id)

  switch(iType) {
    case 1: szTypeFormat = "lightning"
    case 2: szTypeFormat = "blood"
    case 3: szTypeFormat = "explode"
  }

  if(equali(szTarget, "@all")) {
    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "ah")
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if(iPlayer == id) {
          console_print(id, _T("That action can not be performed on yourself (skipped)."))
          iBlockedPlayersNum++
          continue
        }

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        SlayPlayer(iPlayer, iType, iSilent)
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      console_print(id, _T("All players have been slayed (type: %s)."), _T(szTypeFormat))

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("slay all players."))
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("slay all players."))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" slay all players (type: %s).",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szTypeFormat)
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> slay all players (type: %s).", g_szAdminInfo[szName], szTypeFormat)
      }
      #endif
    }
    else {
      console_print(id, _T("No alive player on the server."))
    }
  }
  else if(szTarget[0] == '@') {
    if(!CanUseTeamAsTarget(id))
      return PLUGIN_HANDLED_MAIN

    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "aegh", szTarget[1])
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if(iPlayer == id) {
          console_print(id, _T("That action can not be performed on yourself (skipped)."))
          iBlockedPlayersNum++
          continue
        }

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        SlayPlayer(iPlayer, iType, iSilent)
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      new szTeamName[32]
      GetTeamName(szTarget, szTeamName, charsmax(szTeamName))

      console_print(id, _T("The %s have been slayed (type: %s)."), _T(szTeamName), _T(szTypeFormat))

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("slay the %s."), _T(szTeamName))
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("slay the %s."), _T(szTeamName))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" slay the %s (type: %s).",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szTeamName, szTypeFormat)
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> slay the %s (type: %s).", g_szAdminInfo[szName], szTeamName, szTypeFormat)
      }
      #endif
    }
    else {
      console_print(id, _T("No alive player in this team."))
    }
  }
  else {
    iPlayer = CmdTargetExtra(id, szTarget, 7)
    if(!iPlayer)
      return PLUGIN_HANDLED_MAIN

    SlayPlayer(iPlayer, iType, iSilent)

    GetPlayerInfos(iPlayer)

    console_print(id, _T("Player ^"%s^" slayed (type: %s)."), g_szPlayerInfo[szName], _T(szTypeFormat))

    #if !defined COLORED_ACTIVITY
    show_activity(id, g_szAdminInfo[szName], _T("slay %s."), g_szPlayerInfo[szName])
    #else
    show_activity_color(id, g_szAdminInfo[szName], _T("slay %s."), g_szPlayerInfo[szName])
    #endif

    #if defined USE_LOGS
    if(id > 0) {
      log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" slay ^"<%s><%d><%s><%s>^" (type: %s).",
      g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress],
      g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress], szTypeFormat)
    }
    else {
      log_amx("Admin All-In-One Commands: <%s> slay ^"<%s><%d><%s><%s>^" (type: %s).",
      g_szAdminInfo[szName], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress], szTypeFormat)
    }
    #endif
  }
  return PLUGIN_HANDLED_MAIN
}

SlayPlayer(id, iType, iSilent) {
  new iOrigin[3]
  get_user_origin(id, iOrigin)
  iOrigin[2] -= 26
  switch(iType) {
    case 1: {
      new iCoord[3]
      iCoord[0] = iOrigin[0] + 100
      iCoord[1] = iOrigin[1] + 100
      iCoord[2] = iOrigin[2] + 400
      Lightning(iCoord, iOrigin)
      emit_sound(id, CHAN_ITEM, "ambience/thunder_clap.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
    }
    case 2: {
      Blood(iOrigin)
      emit_sound(id, CHAN_ITEM, "weapons/headshot2.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
    }
    case 3: {
      Explode(iOrigin)
    }
  }
  iSilent ? user_silentkill(id) : user_kill(id, 1)
}

user_silentkill(index) {
  static iMsgIdDeathMsg = 0
  if(!iMsgIdDeathMsg) {
    iMsgIdDeathMsg = get_user_msgid("DeathMsg")
  }
  new iMsgBlock = get_msg_block(iMsgIdDeathMsg)
  set_msg_block(iMsgIdDeathMsg, BLOCK_ONCE)
  user_kill(index, 1)
  set_msg_block(iMsgIdDeathMsg, iMsgBlock)
  return 1
}

Lightning(const iVec1[3], const iVec2[3]) {
  if(g_iSPR_Light > 0) {
    message_begin(MSG_PVS, SVC_TEMPENTITY, iVec2)
    write_byte(TE_BEAMPOINTS)
    write_coord(iVec1[0])
    write_coord(iVec1[1])
    write_coord(iVec1[2])
    write_coord(iVec2[0])
    write_coord(iVec2[1])
    write_coord(iVec2[2])
    write_short(g_iSPR_Light)
    write_byte(1)
    write_byte(5)
    write_byte(2)
    write_byte(20)
    write_byte(30)
    write_byte(200)
    write_byte(200)
    write_byte(200)
    write_byte(200)
    write_byte(200)
    message_end()
  }

  message_begin(MSG_PVS, SVC_TEMPENTITY, iVec2)
  write_byte(TE_SPARKS)
  write_coord(iVec2[0])
  write_coord(iVec2[1])
  write_coord(iVec2[2])
  message_end()

  if(g_iSPR_Smoke > 0) {
    message_begin(MSG_PVS, SVC_TEMPENTITY, iVec2)
    write_byte(TE_SMOKE)
    write_coord(iVec2[0])
    write_coord(iVec2[1])
    write_coord(iVec2[2])
    write_short(g_iSPR_Smoke)
    write_byte(10)
    write_byte(10)
    message_end()
  }
}

Blood(const iVec1[3]) {
  if(g_iSPR_BloodSpray <= 0 || g_iSPR_Blood <= 0)
    return

  message_begin(MSG_PVS, SVC_TEMPENTITY, iVec1)
  write_byte(TE_BLOODSPRITE)
  write_coord(iVec1[0])
  write_coord(iVec1[1])
  write_coord(iVec1[2] + 50)
  write_short(g_iSPR_BloodSpray)
  write_short(g_iSPR_Blood)
  write_byte(229)
  write_byte(12)
  message_end()
}

Explode(const iVec1[3]) {
  if(g_iSPR_White > 0) {
    message_begin(MSG_PVS, SVC_TEMPENTITY, iVec1)
    write_byte(TE_BEAMCYLINDER)
    write_coord(iVec1[0])
    write_coord(iVec1[1])
    write_coord(iVec1[2] + 16)
    write_coord(iVec1[0])
    write_coord(iVec1[1])
    write_coord(iVec1[2] + 1936)
    write_short(g_iSPR_White)
    write_byte(0)
    write_byte(0)
    write_byte(3)
    write_byte(16)
    write_byte(0)
    write_byte(188)
    write_byte(220)
    write_byte(255)
    write_byte(255)
    write_byte(0)
    message_end()
  }

  message_begin(MSG_PVS, SVC_TEMPENTITY, iVec1)
  write_byte(TE_EXPLOSION2)
  write_coord(iVec1[0])
  write_coord(iVec1[1])
  write_coord(iVec1[2])
  write_byte(188)
  write_byte(10)
  message_end()

  if(g_iSPR_Smoke > 0) {
    message_begin(MSG_PVS, SVC_TEMPENTITY, iVec1)
    write_byte(TE_SMOKE)
    write_coord(iVec1[0])
    write_coord(iVec1[1])
    write_coord(iVec1[2])
    write_short(g_iSPR_Smoke)
    write_byte(4)
    write_byte(10)
    message_end()
  }
}

CheckValidity() {
  if(get_cvar_pointer("amxmodx_version") || is_module_running("fakemeta")) {
    server_cmd(";wait;exit")
    return false
  }
  return true
}

/*******************************************************************************
 * Admin Fire
 ******************************************************************************/
#define SetUserFired(%1)    g_bIsIgnited |= (1<<(%1&31))
#define RemoveUserFired(%1) g_bIsIgnited &= ~(1<<(%1&31))
#define IsUserFired(%1)    (g_bIsIgnited & (1<<(%1&31)))

public cmdFire(id, iLevel, iCommandId) {
  if(!cmd_access(id, iLevel, iCommandId, 2))
    return PLUGIN_HANDLED_MAIN

  new szTarget[32], iPlayer
  read_argv(1, szTarget, charsmax(szTarget))

  new bool:bHasSupreme = access(id, ADMIN_SUPREME) ? true : false

  GetAdminInfos(id)

  if(equali(szTarget, "@all")) {
    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "ah")
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if(iPlayer == id) {
          console_print(id, _T("That action can not be performed on yourself (skipped)."))
          iBlockedPlayersNum++
          continue
        }

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        SetUserFired(iPlayer)
        Task_IgniteEffects(iPlayer + TASKID_IgniteEffects)
        Task_IgnitePlayer(iPlayer + TASKID_IgnitePlayer)
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      console_print(id, _T("All players have been inflamed."))

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("ignite all players."))
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("ignite all players."))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" ignite all players.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress])
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> ignite all players.", g_szAdminInfo[szName])
      }
      #endif
    }
    else {
      console_print(id, _T("No alive player on the server."))
    }
  }
  else if(szTarget[0] == '@') {
    if(!CanUseTeamAsTarget(id))
      return PLUGIN_HANDLED_MAIN

    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "aegh", szTarget[1])
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if(iPlayer == id) {
          console_print(id, _T("That action can not be performed on yourself (skipped)."))
          iBlockedPlayersNum++
          continue
        }

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        SetUserFired(iPlayer)
        Task_IgniteEffects(iPlayer + TASKID_IgniteEffects)
        Task_IgnitePlayer(iPlayer + TASKID_IgnitePlayer)
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      new szTeamName[32]
      GetTeamName(szTarget, szTeamName, charsmax(szTeamName))

      console_print(id, _T("The %s have been inflamed."), _T(szTeamName))

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("ignite the %s."), _T(szTeamName))
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("ignite the %s."), _T(szTeamName))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" ignite the %s.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szTeamName)
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> ignite the %s.", g_szAdminInfo[szName], szTeamName)
      }
      #endif
    }
    else {
      console_print(id, _T("No alive player in this team."))
    }
  }
  else {
    iPlayer = CmdTargetExtra(id, szTarget, 7)
    if(!iPlayer)
      return PLUGIN_HANDLED_MAIN

    SetUserFired(iPlayer)
    Task_IgniteEffects(iPlayer + TASKID_IgniteEffects)
    Task_IgnitePlayer(iPlayer + TASKID_IgnitePlayer)

    GetPlayerInfos(iPlayer)

    console_print(id, _T("Player ^"%s^" inflamed."), g_szPlayerInfo[szName])

    #if !defined COLORED_ACTIVITY
    show_activity(id, g_szAdminInfo[szName], _T("ignite %s."), g_szPlayerInfo[szName])
    #else
    show_activity_color(id, g_szAdminInfo[szName], _T("ignite %s."), g_szPlayerInfo[szName])
    #endif

    #if defined USE_LOGS
    if(id > 0) {
      log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" ignite ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress],
      g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    else {
      log_amx("Admin All-In-One Commands: <%s> ignite ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    #endif
  }
  return PLUGIN_HANDLED_MAIN
}

public Task_IgniteEffects(id) {
  id -= TASKID_IgniteEffects
  if(IsUserFired(id) && is_user_alive(id)) {
    new iOrigin[3]
    get_user_origin(id, iOrigin)

    new iRandomXY = random_num(-6, 6)

    if(g_iSPR_Smoke > 0) {
      message_begin(MSG_PVS, SVC_TEMPENTITY, iOrigin)
      write_byte(TE_SMOKE)
      write_coord(iOrigin[0] + iRandomXY)
      write_coord(iOrigin[1] + iRandomXY)
      write_coord(iOrigin[2] + 32)
      write_short(g_iSPR_Smoke)
      write_byte(25)
      write_byte(12)
      message_end()
    }

    if(g_iSPR_Flame > 0) {
      message_begin(MSG_PVS, SVC_TEMPENTITY, iOrigin)
      write_byte(TE_SPRITE)
      write_coord(iOrigin[0] + iRandomXY)
      write_coord(iOrigin[1] + iRandomXY)
      write_coord(iOrigin[2] + 16)
      write_short(g_iSPR_Flame)
      write_byte(5)
      write_byte(220)
      message_end()
    }

    set_task(0.2, "Task_IgniteEffects", id + TASKID_IgniteEffects)
  }
  else {
    if(IsUserFired(id)) {
      emit_sound(id, CHAN_AUTO, "scientist/scream21.wav", 0.8, ATTN_NORM, 0, PITCH_HIGH)
      RemoveUserFired(id)
    }
  }
}

public Task_IgnitePlayer(id) {
  id -= TASKID_IgnitePlayer
  if(IsUserFired(id) && is_user_alive(id)) {
    if(entity_get_int(id, EV_INT_waterlevel) >= 3) {
      RemoveUserFired(id)
      remove_task(id + TASKID_IgniteEffects)
      remove_task(id + TASKID_IgnitePlayer)
      return
    }

    new iIdOrigin[3]
    new iPlayers[MAX_CLIENTS], iPlayersNum, iPlayer, iPlayerOrigin[3]
    new iIdHealth = get_user_health(id)
    get_user_origin(id, iIdOrigin)
    set_user_health(id, iIdHealth - 10)

    message_begin(MSG_ONE_UNRELIABLE, g_iMsgTypeID_Damage, {0, 0, 0}, id)
    write_byte(30)
    write_byte(30)
    write_long(1<<21)
    write_coord(iIdOrigin[0])
    write_coord(iIdOrigin[1])
    write_coord(iIdOrigin[2])
    message_end()

    emit_sound(id, CHAN_ITEM, "ambience/flameburst1.wav", 0.6, ATTN_NORM, 0, PITCH_NORM)

    get_players(iPlayers, iPlayersNum, "ah")
    new szIdName[32], szPlayerName[32]

    for(new a = 0; a < iPlayersNum; a++) {
      iPlayer = iPlayers[a]

      if(iPlayer == id || IsUserFired(iPlayer) || get_user_godmode(iPlayer) || !CGameRules_FPlayerCanTakeDamage(iPlayer, id))
        continue

      get_user_origin(iPlayer, iPlayerOrigin)

      if(get_distance(iIdOrigin, iPlayerOrigin) > 100)
        continue

      get_user_name(id, szIdName, charsmax(szIdName))
      get_user_name(iPlayer, szPlayerName, charsmax(szPlayerName))
      emit_sound(iPlayer, CHAN_WEAPON, "scientist/scream07.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH)
      client_print(0, print_chat, _T("* OH MY GOD!! %s has been inflamed by %s!!"), szPlayerName, szIdName)
      SetUserFired(iPlayer)
      Task_IgniteEffects(iPlayer + TASKID_IgniteEffects)
      Task_IgnitePlayer(iPlayer + TASKID_IgnitePlayer)
    }

    set_task(2.0, "Task_IgnitePlayer", id + TASKID_IgnitePlayer)
  }
}

/*******************************************************************************
 * Admin Rocket
 ******************************************************************************/
public cmdRocket(id, iLevel, iCommandId) {
  if(!cmd_access(id, iLevel, iCommandId, 2))
    return PLUGIN_HANDLED_MAIN

  new szTarget[32], iPlayer
  read_argv(1, szTarget, charsmax(szTarget))

  new bool:bHasSupreme = access(id, ADMIN_SUPREME) ? true : false

  GetAdminInfos(id)

  if(equali(szTarget, "@all")) {
    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "ah")
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if(iPlayer == id) {
          console_print(id, _T("That action can not be performed on yourself (skipped)."))
          iBlockedPlayersNum++
          continue
        }

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        emit_sound(iPlayer, CHAN_WEAPON, "weapons/rocketfire1.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
        set_user_maxspeed(iPlayer, 1.0)
        set_task(1.2, "Task_RocketLiftOff", iPlayer + TASKID_RocketLiftOff)
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      console_print(id, _T("All players have been transformed to rocket."))

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("transform to rocket all players."))
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("transform to rocket all players."))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" transform to rocket all players.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress])
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> transform to rocket all players.", g_szAdminInfo[szName])
      }
      #endif

      set_hudmessage(random(255), random(255), random(255), -1.0, 0.30, 0, 6.0, 6.0, 0.5, 0.15, -1)
      show_hudmessage(0, _T("All the players have lift-off to try to visit the stars!!"))
    }
    else {
      console_print(id, _T("No alive player on the server."))
    }
  }
  else if(szTarget[0] == '@') {
    if(!CanUseTeamAsTarget(id))
      return PLUGIN_HANDLED_MAIN

    new iPlayers[MAX_CLIENTS], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "aegh", szTarget[1])
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if(iPlayer == id) {
          console_print(id, _T("That action can not be performed on yourself (skipped)."))
          iBlockedPlayersNum++
          continue
        }

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        emit_sound(iPlayer, CHAN_WEAPON, "weapons/rocketfire1.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
        set_user_maxspeed(iPlayer, 1.0)
        set_task(1.2, "Task_RocketLiftOff", iPlayer + TASKID_RocketLiftOff)
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      new szTeamName[32]
      GetTeamName(szTarget, szTeamName, charsmax(szTeamName))

      console_print(id, _T("The %s have been transformed to rocket."), _T(szTeamName))

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("transform to rocket the %s."), _T(szTeamName))
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("transform to rocket the %s."), _T(szTeamName))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" transform to rocket the %s.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szTeamName)
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> transform to rocket the %s.", g_szAdminInfo[szName], szTeamName)
      }
      #endif

      if(szTeamName[0] == 't' || szTeamName[0] == 'T') set_hudmessage(255, 20, 0, -1.0, 0.30, 0, 6.0, 6.0, 0.5, 0.15, -1)
      else set_hudmessage(0, 40, 255, -1.0, 0.30, 0, 6.0, 6.0, 0.5, 0.15, -1)
      show_hudmessage(0, _T("Are these birds? Are these planes?? Noooo!!^nThese are the %s who have been turned into rockets!!"), _T(szTeamName))
    }
    else {
      console_print(id, _T("No alive player in this team."))
    }
  }
  else {
    iPlayer = CmdTargetExtra(id, szTarget, 7)
    if(!iPlayer)
      return PLUGIN_HANDLED_MAIN

    emit_sound(iPlayer, CHAN_WEAPON, "weapons/rocketfire1.wav", 1.0, ATTN_NORM, 0, PITCH_NORM)
    set_user_maxspeed(iPlayer, 1.0)
    set_task(1.2, "Task_RocketLiftOff", iPlayer + TASKID_RocketLiftOff)

    GetPlayerInfos(iPlayer)

    console_print(id, _T("Player ^"%s^" transformed to rocket."), g_szPlayerInfo[szName])

    #if !defined COLORED_ACTIVITY
    show_activity(id, g_szAdminInfo[szName], _T("transform to rocket %s."), g_szPlayerInfo[szName])
    #else
    show_activity_color(id, g_szAdminInfo[szName], _T("transform to rocket %s."), g_szPlayerInfo[szName])
    #endif

    #if defined USE_LOGS
    if(id > 0) {
      log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" transform to rocket ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress],
      g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    else {
      log_amx("Admin All-In-One Commands: <%s> transform to rocket ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    #endif

    set_hudmessage(200, 100, 0, -1.0, 0.30, 0, 6.0, 6.0, 0.5, 0.15, -1)
    show_hudmessage(0, _T("Is a bird? Is a plane?? But noooo!!^nIt's %s who has been turned into a rocket!!"), g_szPlayerInfo[szName])
  }
  return PLUGIN_HANDLED_MAIN
}

public Task_RocketLiftOff(id) {
  id -= TASKID_RocketLiftOff
  if(is_user_alive(id)) {
    set_user_gravity(id, -0.50)
    new Float:flVelocity[3]
    entity_get_vector(id, EV_VEC_velocity, flVelocity)
    flVelocity[2] += 220
    entity_set_vector(id, EV_VEC_velocity, flVelocity)
    emit_sound(id, CHAN_VOICE, "weapons/rocket1.wav", 1.0, 0.5, 0, PITCH_NORM)
    Task_RocketEffects(id + TASKID_RocketEffects)
  }
}

public Task_RocketEffects(id) {
  id -= TASKID_RocketEffects
  if(is_user_alive(id)) {
    new iOrigin[3]
    get_user_origin(id, iOrigin)

    message_begin(MSG_ONE_UNRELIABLE, g_iMsgTypeID_Damage, {0, 0, 0}, id)
    write_byte(30)
    write_byte(30)
    write_long(1<<16)
    write_coord(iOrigin[0])
    write_coord(iOrigin[1])
    write_coord(iOrigin[2])
    message_end()

    if(g_iRocketManPos[id] == iOrigin[2])
      RocketExplode(id)

    g_iRocketManPos[id] = iOrigin[2]

    if(g_iSPR_BlueFlare2 > 0) {
      message_begin(MSG_PVS, SVC_TEMPENTITY, iOrigin)
      write_byte(TE_SPRITETRAIL)
      write_coord(iOrigin[0])
      write_coord(iOrigin[1])
      write_coord(iOrigin[2])
      write_coord(iOrigin[0])
      write_coord(iOrigin[1])
      write_coord(iOrigin[2] - 30)
      write_short(g_iSPR_BlueFlare2)
      write_byte(5)
      write_byte(1)
      write_byte(1)
      write_byte(10)
      write_byte(5)
      message_end()
    }

    if(g_iSPR_Flash > 0) {
      message_begin(MSG_PVS, SVC_TEMPENTITY, iOrigin)
      write_byte(TE_SPRITE)
      write_coord(iOrigin[0])
      write_coord(iOrigin[1])
      write_coord(iOrigin[2] - 30)
      write_short(g_iSPR_Flash)
      write_byte(15)
      write_byte(255)
      message_end()
    }

    set_task(0.3, "Task_RocketEffects", id + TASKID_RocketEffects)
  }
}

RocketExplode(id) {
  if(is_user_alive(id)) {
    new iOrigin[3]
    get_user_origin(id, iOrigin)

    if(g_iSPR_White > 0) {
      message_begin(MSG_PVS, SVC_TEMPENTITY, iOrigin)
      write_byte(TE_BEAMCYLINDER)
      write_coord(iOrigin[0])
      write_coord(iOrigin[1])
      write_coord(iOrigin[2] - 10)
      write_coord(iOrigin[0])
      write_coord(iOrigin[1])
      write_coord(iOrigin[2] + 1910)
      write_short(g_iSPR_White)
      write_byte(0)
      write_byte(0)
      write_byte(2)
      write_byte(16)
      write_byte(0)
      write_byte(188)
      write_byte(220)
      write_byte(255)
      write_byte(255)
      write_byte(0)
      message_end()
    }

    message_begin(MSG_PVS, SVC_TEMPENTITY, iOrigin)
    write_byte(TE_EXPLOSION2)
    write_coord(iOrigin[0])
    write_coord(iOrigin[1])
    write_coord(iOrigin[2])
    write_byte(188)
    write_byte(10)
    message_end()

    if(g_iSPR_Smoke > 0) {
      message_begin(MSG_PVS, SVC_TEMPENTITY, iOrigin)
      write_byte(TE_SMOKE)
      write_coord(iOrigin[0])
      write_coord(iOrigin[1])
      write_coord(iOrigin[2])
      write_short(g_iSPR_Smoke)
      write_byte(4)
      write_byte(10)
      message_end()
    }

    user_kill(id, 1)
  }

  emit_sound(id, CHAN_VOICE, "weapons/rocket1.wav", 0.0, 0.0, (1<<5), PITCH_NORM)
}

/*******************************************************************************
 * Admin Blanks
 ******************************************************************************/
#define SetUserBlanked(%1)    g_bHasBlanks |= (1<<(%1&31))
#define RemoveUserBlanked(%1) g_bHasBlanks &= ~(1<<(%1&31))
#define IsUserBlanked(%1)     (g_bHasBlanks & (1<<(%1&31)))

public cmdBlank(id, iLevel, iCommandId) {
  if(!cmd_access(id, iLevel, iCommandId, 3))
    return PLUGIN_HANDLED_MAIN

  new szTarget[32], szTime[6], iPlayer
  read_argv(1, szTarget, charsmax(szTarget))
  read_argv(2, szTime, charsmax(szTime))

  new iBlankTime = (szTime[0] == 'R' || szTime[0] == 'r') ? -1 : ((szTime[0] == 'I' || szTime[0] == 'i') ? 0 : str_to_num(szTime))

  new szBlankFormat[24]
  if(iBlankTime > 0) formatex(szBlankFormat, charsmax(szBlankFormat), _T("time: %d second%s", id), iBlankTime, iBlankTime > 1 ? "s" : "")
  else formatex(szBlankFormat, charsmax(szBlankFormat), _T("infinite time", id))

  new bool:bHasSupreme = access(id, ADMIN_SUPREME) ? true : false

  GetAdminInfos(id)

  if(equali(szTarget, "@all")) {
    new iPlayers[32], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "h")
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if(iBlankTime != -1 && iPlayer == id) {
          console_print(id, _T("That action can not be performed on yourself (skipped)."))
          iBlockedPlayersNum++
          continue
        }

        if(iBlankTime == -1 && !IsUserBlanked(iPlayer)) {
          iBlockedPlayersNum++
          continue
        }

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        if(iBlankTime == -1) {
          remove_task(iPlayer + TASKID_UnBlankPlayer)
          Task_UnBlankPlayer(iPlayer + TASKID_UnBlankPlayer)
        }
        else {
          if(!IsUserBlanked(iPlayer)) {
            SetUserBlanked(iPlayer)
            set_user_hitzones(iPlayer, 0, 0)
          }
          else {
            remove_task(iPlayer + TASKID_UnBlankPlayer)
          }

          if(iBlankTime > 0) {
            set_task(float(iBlankTime), "Task_UnBlankPlayer", iPlayer + TASKID_UnBlankPlayer)
          }
        }
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      if(iBlankTime > -1) console_print(id, _T("Blanks given to all players (%s)."), szBlankFormat)
      else console_print(id, _T("Blanks removed from all players."))

      #if !defined COLORED_ACTIVITY
      if(iBlankTime > 0) show_activity(id, g_szAdminInfo[szName], _T("give blanks to all players for %d seconds."), iBlankTime)
      else if(iBlankTime == 0) show_activity(id, g_szAdminInfo[szName], _T("give infinite blanks to all players."))
      else show_activity(id, g_szAdminInfo[szName], _T("remove blanks from all players."))
      #else
      if(iBlankTime > 0) show_activity_color(id, g_szAdminInfo[szName], _T("give blanks to all players for %d seconds."), iBlankTime)
      else if(iBlankTime == 0) show_activity_color(id, g_szAdminInfo[szName], _T("give infinite blanks to all players."))
      else show_activity_color(id, g_szAdminInfo[szName], _T("remove blanks from all players."))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        if(iBlankTime > -1) log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" give blanks to all players (time: %s).",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], iBlankTime ? szTime : "infinite")
        else log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" remove blanks from all players.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress])
      }
      else {
        if(iBlankTime > -1) log_amx("Admin All-In-One Commands: <%s> give blanks to all players (time: %s).", g_szAdminInfo[szName], iBlankTime ? szTime : "infinite")
        else log_amx("Admin All-In-One Commands: <%s> remove blanks from all players.", g_szAdminInfo[szName])
      }
      #endif
    }
    else {
      console_print(id, _T("No player on the server."))
    }
  }
  else if(szTarget[0] == '@') {
    if(!CanUseTeamAsTarget(id))
      return PLUGIN_HANDLED_MAIN

    new iPlayers[32], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "egh", szTarget[1])
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if(iBlankTime != -1 && iPlayer == id) {
          console_print(id, _T("That action can not be performed on yourself (skipped)."))
          iBlockedPlayersNum++
          continue
        }

        if(iBlankTime == -1 && !IsUserBlanked(iPlayer)) {
          iBlockedPlayersNum++
          continue
        }

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        if(iBlankTime == -1) {
          remove_task(iPlayer + TASKID_UnBlankPlayer)
          Task_UnBlankPlayer(iPlayer + TASKID_UnBlankPlayer)
        }
        else {
          if(!IsUserBlanked(iPlayer)) {
            SetUserBlanked(iPlayer)
            set_user_hitzones(iPlayer, 0, 0)
          }
          else {
            remove_task(iPlayer + TASKID_UnBlankPlayer)
          }

          if(iBlankTime > 0) {
            set_task(float(iBlankTime), "Task_UnBlankPlayer", iPlayer + TASKID_UnBlankPlayer)
          }
        }
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      new szTeamName[32]
      GetTeamName(szTarget, szTeamName, charsmax(szTeamName))

      if(iBlankTime > -1) console_print(id, _T("Blanks given to the %s (%s)."), _T(szTeamName), szBlankFormat)
      else console_print(id, _T("Blanks removed from the %s."), _T(szTeamName))

      #if !defined COLORED_ACTIVITY
      if(iBlankTime > 0) show_activity(id, g_szAdminInfo[szName], _T("give blanks to the %s for %d seconds."), _T(szTeamName), iBlankTime)
      else if(iBlankTime == 0) show_activity(id, g_szAdminInfo[szName], _T("give infinite blanks to the %s."), _T(szTeamName))
      else show_activity(id, g_szAdminInfo[szName], _T("remove blanks from the %s."), _T(szTeamName))
      #else
      if(iBlankTime > 0) show_activity_color(id, g_szAdminInfo[szName], _T("give blanks to the %s for %d seconds."), _T(szTeamName), iBlankTime)
      else if(iBlankTime == 0) show_activity_color(id, g_szAdminInfo[szName], _T("give infinite blanks to the %s."), _T(szTeamName))
      else show_activity_color(id, g_szAdminInfo[szName], _T("remove blanks from the %s."), _T(szTeamName))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        if(iBlankTime > -1) log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" give blanks to the %s (time: %s).",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szTeamName, iBlankTime ? szTime : "infinite")
        else log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" remove blanks from the %s.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szTeamName)
      }
      else {
        if(iBlankTime > -1) log_amx("Admin All-In-One Commands: <%s> give blanks to the %s (time: %s).", g_szAdminInfo[szName], szTeamName, iBlankTime ? szTime : "infinite")
        else log_amx("Admin All-In-One Commands: <%s> remove blanks from the %s.", g_szAdminInfo[szName], szTeamName)
      }
      #endif
    }
    else {
      console_print(id, _T("No player in this team."))
    }
  }
  else {
    iPlayer = cmd_target(id, szTarget, 3)
    if(!iPlayer)
      return PLUGIN_HANDLED_MAIN

    GetPlayerInfos(iPlayer)

    if(iBlankTime == -1) {
      if(!IsUserBlanked(iPlayer)) {
        console_print(id, _T("Player ^"%s^" is not blanked!"), g_szPlayerInfo[szName])
        return PLUGIN_HANDLED_MAIN
      }

      remove_task(iPlayer + TASKID_UnBlankPlayer)
      Task_UnBlankPlayer(iPlayer + TASKID_UnBlankPlayer)
    }
    else {
      if(!IsUserBlanked(iPlayer)) {
        SetUserBlanked(iPlayer)
        set_user_hitzones(iPlayer, 0, 0)
      }
      else {
        remove_task(iPlayer + TASKID_UnBlankPlayer)
      }

      if(iBlankTime > 0) {
        set_task(float(iBlankTime), "Task_UnBlankPlayer", iPlayer + TASKID_UnBlankPlayer)
      }
    }

    if(iBlankTime > -1) console_print(id, _T("Blanks given to %s (%s)."), g_szPlayerInfo[szName], szBlankFormat)
    else console_print(id, _T("Blanks removed from %s."), g_szPlayerInfo[szName])

    #if !defined COLORED_ACTIVITY
    if(iBlankTime > 0) show_activity(id, g_szAdminInfo[szName], _T("give blanks to %s for %d seconds."), g_szPlayerInfo[szName], iBlankTime)
    else if(iBlankTime == 0) show_activity(id, g_szAdminInfo[szName], _T("give infinite blanks to %s."), g_szPlayerInfo[szName])
    else show_activity(id, g_szAdminInfo[szName], _T("remove blanks from %s."), g_szPlayerInfo[szName])
    #else
    if(iBlankTime > 0) show_activity_color(id, g_szAdminInfo[szName], _T("give blanks to %s for %d seconds."), g_szPlayerInfo[szName], iBlankTime)
    else if(iBlankTime == 0) show_activity_color(id, g_szAdminInfo[szName], _T("give infinite blanks to %s."), g_szPlayerInfo[szName])
    else show_activity_color(id, g_szAdminInfo[szName], _T("remove blanks from %s."), g_szPlayerInfo[szName])
    #endif

    #if defined USE_LOGS
    if(id > 0) {
      if(iBlankTime > -1) log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" give blanks to ^"<%s><%d><%s><%s>^" (time: %s).",
      g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress],
      g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress], iBlankTime ? szTime : "infinite")
      else log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" remove blanks from ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress],
      g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    else {
      if(iBlankTime > -1) log_amx("Admin All-In-One Commands: <%s> give blanks to ^"<%s><%d><%s><%s>^" (time: %s).",
	 g_szAdminInfo[szName], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress], iBlankTime ? szTime : "infinite")
      else log_amx("Admin All-In-One Commands: <%s> remove blanks from ^"<%s><%d><%s><%s>^".",
	 g_szAdminInfo[szName], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    #endif
  }
  return PLUGIN_HANDLED_MAIN
}

// Keeping original method, but traceline could be used instead.
public Task_UnBlankPlayer(iClientID) {
  iClientID -= TASKID_UnBlankPlayer

  RemoveUserBlanked(iClientID)
  set_user_hitzones(iClientID, 0, 255)
}

/*******************************************************************************
 * Admin Flash.
 ******************************************************************************/
public cmdFlash(id, iLevel, iCommandId) {
  if(!cmd_access(id, iLevel, iCommandId, 2))
    return PLUGIN_HANDLED_MAIN

  new szTarget[32], szColor[12], iPlayer
  new iRed = 255, iGreen = 255, iBlue = 255
  read_argv(1, szTarget, charsmax(szTarget))

  new bool:bHasSupreme = access(id, ADMIN_SUPREME) ? true : false

  GetAdminInfos(id)

  if(read_argv(2, szColor, charsmax(szColor))) {
    new szColors[3][4]
    parse(szColor, szColors[0], charsmax(szColors[]), szColors[1], charsmax(szColors[]), szColors[2], charsmax(szColors[]))
    iRed   = clamp(str_to_num(szColors[0]), 0, 255)
    iGreen = clamp(str_to_num(szColors[1]), 0, 255)
    iBlue  = clamp(str_to_num(szColors[2]), 0, 255)
  }

  if(equali(szTarget, "@all")) {
    new iPlayers[32], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "ah")
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if(iPlayer == id) {
          console_print(id, _T("That action can not be performed on yourself (skipped)."))
          iBlockedPlayersNum++
          continue
        }

        if((bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        Flash(iPlayer, iRed, iGreen, iBlue)
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      console_print(id, _T("All players have been flashed."))

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("flash all players."))
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("flash all players."))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" flash all players.", g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress])
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> flash all players.", g_szAdminInfo[szName])
      }
      #endif
    }
    else {
      console_print(id, _T("No alive player on the server."))
    }
  }
  else if(szTarget[0] == '@') {
    if(!CanUseTeamAsTarget(id))
      return PLUGIN_HANDLED_MAIN

    new iPlayers[32], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "aegh", szTarget[1])
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if(iPlayer == id) {
          console_print(id, _T("That action can not be performed on yourself (skipped)."))
          iBlockedPlayersNum++
          continue
        }

        if((bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        Flash(iPlayer, iRed, iGreen, iBlue)
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      new szTeamName[32]
      GetTeamName(szTarget, szTeamName, charsmax(szTeamName))

      console_print(id, _T("The %s have been flashed."), _T(szTeamName))

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("flash the %s."), _T(szTeamName))
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("flash the %s."), _T(szTeamName))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" flash the %s.", g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szTeamName)
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> flash the %s.", g_szAdminInfo[szName], szTeamName)
      }
      #endif
    }
    else {
      console_print(id, _T("No alive player in this team."))
    }
  }
  else {
    iPlayer = cmd_target(id, szTarget, 7)
    if(!iPlayer)
      return PLUGIN_HANDLED_MAIN

    Flash(iPlayer, iRed, iGreen, iBlue)

    GetPlayerInfos(iPlayer)

    console_print(id, _T("Player ^"%s^" flashed."), g_szPlayerInfo[szName])

    #if !defined COLORED_ACTIVITY
    show_activity(id, g_szAdminInfo[szName], _T("flash %s."), g_szPlayerInfo[szName])
    #else
    show_activity_color(id, g_szAdminInfo[szName], _T("flash %s."), g_szPlayerInfo[szName])
    #endif

    #if defined USE_LOGS
    if(id > 0) {
      log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" flash ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress],
      g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    else {
      log_amx("Admin All-In-One Commands: <%s> flash ^"<%s><%d><%s><%s>^".", g_szAdminInfo[szName], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    #endif
  }
  return PLUGIN_HANDLED_MAIN
}

Flash(id, const iRed, const iGreen, const iBlue) {
  if(g_iMsgTypeID_ScreenFade) {
    message_begin(MSG_ONE_UNRELIABLE, g_iMsgTypeID_ScreenFade, {0, 0, 0}, id)
    write_short(FLASH_FADETIME) // FadeTime
    write_short(FLASH_DELAY)    // Delay
    write_short(FLASH_FLAGS)    // Flags
    write_byte(iRed)   // Red
    write_byte(iGreen) // Green
    write_byte(iBlue)  // Blue
    write_byte(FLASH_ALPHA) // Alpha
    message_end()
  }

  emit_sound(id, CHAN_BODY, "weapons/flashbang-1.wav", 0.6, ATTN_NORM, 0, PITCH_NORM)
}

/*******************************************************************************
 * Admin NoBuy.
 ******************************************************************************/
#define SetUserBuyingBlocked(%1)    g_bHasBuyingBlocked |= (1<<(%1-1))
#define RemoveUserBuyingBlocked(%1) g_bHasBuyingBlocked &= ~(1<<(%1-1))
#define IsUserBuyingBlocked(%1)    (g_bHasBuyingBlocked & (1<<(%1-1)))

public cmdNoBuy(id, iLevel, iCommandId) {
  if(!cmd_access(id, iLevel, iCommandId, 3))
    return PLUGIN_HANDLED_MAIN

  new szTarget[32], szStatus[2], iPlayer
  read_argv(1, szTarget, charsmax(szTarget))
  read_argv(2, szStatus, charsmax(szStatus))

  new bool:bBuyBlockStatus = str_to_num(szStatus) ? true : false
  new bool:bHasSupreme     = access(id, ADMIN_SUPREME) ? true : false

  GetAdminInfos(id)

  if(equali(szTarget, "@all")) {
    new iPlayers[32], iPlayersNum, iBlockedPlayersNum[2] = {0, 0}
    get_players(iPlayers, iPlayersNum, "ch")
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if(bBuyBlockStatus == true && iPlayer == id) {
          console_print(id, _T("That action can not be performed on yourself (skipped)."))
          iBlockedPlayersNum[0]++
          continue
        }

        if(bBuyBlockStatus && IsUserBuyingBlocked(iPlayer) || !bBuyBlockStatus && !IsUserBuyingBlocked(iPlayer)) {
          iBlockedPlayersNum[0]++
          continue
        }

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum[1]++
          continue
        }

        if(bBuyBlockStatus) {
          SetUserBuyingBlocked(iPlayer)
          SetUserNoBuy(iPlayer)
          SendStatusIcon(iPlayer)
          g_iBuyingBlockedNum++
        }
        else {
          RemoveUserBuyingBlocked(iPlayer)
        }
      }

      if((iBlockedPlayersNum[0] + iBlockedPlayersNum[1]) == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      if(g_pMsgHandle_StatusIcon == 0) {
        g_pMsgHandle_StatusIcon = register_message(g_iMsgTypeID_StatusIcon, "Message_StatusIcon")
      }

      if(bBuyBlockStatus == false) {
        g_iBuyingBlockedNum = (iBlockedPlayersNum[1] > 0) ? iBlockedPlayersNum[1] : 0
        TryUnregisterMSG_StatusIcon()
      }

      console_print(id, _T("The buymenu of all players has been %s."), bBuyBlockStatus ? _T("blocked") : _T("unblocked"))

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("%s the buymenu of all players."), bBuyBlockStatus ? _T("block") : _T("unblock"))
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("%s the buymenu of all players."), bBuyBlockStatus ? _T("block") : _T("unblock"))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" %s the buymenu of all players.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], bBuyBlockStatus ? "block" : "unblock")
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> %s the buymenu of all players.", g_szAdminInfo[szName], bBuyBlockStatus ? "block" : "unblock")
      }
      #endif
    }
    else {
      console_print(id, _T("No real player on the server."))
    }
  }
  else if(szTarget[0] == '@') {
    if(!CanUseTeamAsTarget(id))
      return PLUGIN_HANDLED_MAIN

    new iPlayers[32], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "cegh", szTarget[1])
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if(bBuyBlockStatus == true && iPlayer == id) {
          console_print(id, _T("That action can not be performed on yourself (skipped)."))
          iBlockedPlayersNum++
          continue
        }

        if(bBuyBlockStatus && IsUserBuyingBlocked(iPlayer) || !bBuyBlockStatus && !IsUserBuyingBlocked(iPlayer)) {
          iBlockedPlayersNum++
          continue
        }

        if((iPlayer != id) && (bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        if(bBuyBlockStatus) {
          SetUserBuyingBlocked(iPlayer)
          SetUserNoBuy(iPlayer)
          SendStatusIcon(iPlayer)
          g_iBuyingBlockedNum++
        }
        else {
          RemoveUserBuyingBlocked(iPlayer)
          g_iBuyingBlockedNum--
        }
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      if(g_pMsgHandle_StatusIcon == 0) {
        g_pMsgHandle_StatusIcon = register_message(g_iMsgTypeID_StatusIcon, "Message_StatusIcon")
      }

      if(bBuyBlockStatus == false) {
        TryUnregisterMSG_StatusIcon()
      }

      new szTeamName[32]
      GetTeamName(szTarget, szTeamName, charsmax(szTeamName))

      console_print(id, _T("The buymenu of the %s have been %s."), _T(szTeamName), bBuyBlockStatus ? _T("blocked") : _T("unblocked"))

      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("%s the buymenu of the %s."), bBuyBlockStatus ? _T("block") : _T("unblock"), _T(szTeamName))
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("%s the buymenu of the %s."), bBuyBlockStatus ? _T("block") : _T("unblock"), _T(szTeamName))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" %s the buymenu of the %s.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], bBuyBlockStatus ? "block" : "unblock", szTeamName)
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> %s the buymenu of the %s.", g_szAdminInfo[szName], bBuyBlockStatus ? "block" : "unblock", szTeamName)
      }
      #endif
    }
    else {
      console_print(id, _T("No real player in this team."))
    }
  }
  else {
    iPlayer = cmd_target(id, szTarget, 3)
    if(!iPlayer)
      return PLUGIN_HANDLED_MAIN

    GetPlayerInfos(iPlayer)

    if(bBuyBlockStatus == true && IsUserBuyingBlocked(iPlayer)) {
      console_print(id, _T("Player ^"%s^" has already his buymenu blocked!"), g_szPlayerInfo[szName])
      return PLUGIN_HANDLED_MAIN
    }

    if(!bBuyBlockStatus && !IsUserBuyingBlocked(iPlayer)) {
      console_print(id, _T("Player ^"%s^" has not already his buymenu blocked!"), g_szPlayerInfo[szName])
      return PLUGIN_HANDLED_MAIN    
    }

    if(bBuyBlockStatus) {
      SetUserBuyingBlocked(iPlayer)
      SetUserNoBuy(iPlayer)
      SendStatusIcon(iPlayer)
      g_iBuyingBlockedNum++
    }
    else {
      RemoveUserBuyingBlocked(iPlayer)
      g_iBuyingBlockedNum--
    }

    if(g_pMsgHandle_StatusIcon == 0) {
      g_pMsgHandle_StatusIcon = register_message(g_iMsgTypeID_StatusIcon, "Message_StatusIcon")
    }

    if(bBuyBlockStatus == false) {
      TryUnregisterMSG_StatusIcon()
    }

    console_print(id, _T("Buymenu of ^"%s^" %s."), g_szPlayerInfo[szName], bBuyBlockStatus ? _T("blocked") : _T("unblocked"))

    #if !defined COLORED_ACTIVITY
    show_activity(id, g_szAdminInfo[szName], _T("%s the buymenu of %s."), bBuyBlockStatus ? _T("block") : _T("unblock"), g_szPlayerInfo[szName])
    #else
    show_activity_color(id, g_szAdminInfo[szName], _T("%s the buymenu of %s."), bBuyBlockStatus ? _T("block") : _T("unblock"), g_szPlayerInfo[szName])
    #endif

    #if defined USE_LOGS
    if(id > 0) {
      log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" %s the buymenu of ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], bBuyBlockStatus ? "block" : "unblock",
      g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    else {
      log_amx("Admin All-In-One Commands: <%s> %s the buymenu of ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], bBuyBlockStatus ? "block" : "unblock", g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    #endif
  }
  return PLUGIN_HANDLED_MAIN
}

public Message_StatusIcon(const iMsgID, const iMsgDest, const id) {
  static szMessage[8]

  if(IsUserBuyingBlocked(id)
  && get_msg_arg_int(1) != 0
  && get_msg_arg_string(2, szMessage, charsmax(szMessage)) == 7
  && equal(szMessage, "buyzone")) {
    SetUserNoBuy(id)

    static Float:flNextMessageTime[33]

    new Float:flGameTime            = get_gametime()
    new Float:flCVar_AMXNoBuyInform = get_cvarptr_float(g_pCVar_AMXNoBuyInform)

    if(flCVar_AMXNoBuyInform > 0.0 && flNextMessageTime[id] < (flGameTime - flCVar_AMXNoBuyInform)) {
      flNextMessageTime[id] = flGameTime
      client_print(id, print_center, _T("You have been restricted!"))
    }
    return PLUGIN_HANDLED_MAIN
  }
  return PLUGIN_CONTINUE
}

SetUserNoBuy(const id) {
  if(g_iMO_CBasePlayer_m_flState >= 0) {
    set_offset_int(id, g_iMO_CBasePlayer_m_flState, get_offset_int(id, g_iMO_CBasePlayer_m_flState) & ~(1<<0))
  }
}

SendStatusIcon(const id) {
  if(g_iMsgTypeID_StatusIcon) {
    message_begin(MSG_ONE_UNRELIABLE, g_iMsgTypeID_StatusIcon, _, id)
    write_byte(0)
    write_string("buyzone")
    message_end()
  }
}

TryUnregisterMSG_StatusIcon() {
  if(g_iBuyingBlockedNum <= 0 && g_pMsgHandle_StatusIcon != 0) {
    unregister_message(g_iMsgTypeID_StatusIcon, g_pMsgHandle_StatusIcon)
    g_pMsgHandle_StatusIcon = 0
    g_iBuyingBlockedNum     = 0
  }
}

/*******************************************************************************
 * Admin Poison.
 ******************************************************************************/
#define SetUserPoisoned(%1)    g_bHasPoison |= (1<<(%1&31))
#define RemoveUserPoisoned(%1) g_bHasPoison &= ~(1<<(%1&31))
#define IsUserPoisoned(%1)    (g_bHasPoison & (1<<(%1&31)))

public cmdPoison(id, iLevel, iCommandId) {
  if(!cmd_access(id, iLevel, iCommandId, 2))
    return PLUGIN_HANDLED_MAIN

  new szTarget[32], szDamage[12], szTime[4], iParam[1], iPlayer
  read_argv(1, szTarget, charsmax(szTarget))

  new iDamage = read_argv(2, szDamage, charsmax(szDamage)) ? (equali(szDamage, "stop") ? 0 : max(str_to_num(szDamage), 1)) : 1
  iParam[0] = iDamage
  new iTime = read_argv(3, szTime, charsmax(szTime)) ? str_to_num(szTime) : 99

  new bool:bHasSupreme = access(id, ADMIN_SUPREME) ? true : false

  GetAdminInfos(id)

  if(equali(szTarget, "@all")) {
    new iPlayers[32], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "ah")
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if(iDamage && iPlayer == id) {
          console_print(id, _T("That action can not be performed on yourself (skipped)."))
          iBlockedPlayersNum++
          continue
        }

        if((bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        if(iDamage == 0) {
          RemoveUserPoisoned(id)
          remove_task(id + TASKID_PoisonPlayer)
        }
        else {
          SetUserPoisoned(iPlayer)
          remove_task(iPlayer + TASKID_PoisonPlayer)
          set_task(1.0, "Task_PoisonPlayer", iPlayer + TASKID_PoisonPlayer, iParam, 1, "a", iTime - 1)
        }
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      if(iDamage == 0) {
        console_print(id, _T("All players have been unpoisoned."))
      }
      else {
        console_print(id, _T("All players have been poisoned for %d seconds and with %d damage/second."), iTime, iDamage)
      }

      if(iDamage == 0) {
        #if !defined COLORED_ACTIVITY
        show_activity(id, g_szAdminInfo[szName], _T("unpoison all players."))
        #else
        show_activity_color(id, g_szAdminInfo[szName], _T("unpoison all players."))
        #endif
      }
      else {
        #if !defined COLORED_ACTIVITY
        show_activity(id, g_szAdminInfo[szName], _T("poison all players for %d seconds."), iTime)
        #else
        show_activity_color(id, g_szAdminInfo[szName], _T("poison all players for %d seconds."), iTime)
        #endif
      }

      #if defined USE_LOGS
      if(id > 0) {
        if(iDamage == 0) {
          log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" unpoison all players.", g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress])
        }
        else {
          log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" poison all players (delay: %d seconds | damage/second: %d).", g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], iTime, iDamage)
        }
      }
      else {
        if(iDamage == 0) {
          log_amx("Admin All-In-One Commands: <%s> unpoison all players).", g_szAdminInfo[szName])
        }
        else {
          log_amx("Admin All-In-One Commands: <%s> poison all players (delay: %d seconds | damage/second: %d).", g_szAdminInfo[szName], iTime, iDamage)
        }
      }
      #endif
    }
    else {
      console_print(id, _T("No alive player on the server."))
    }
  }
  else if(szTarget[0] == '@') {
    if(!CanUseTeamAsTarget(id))
      return PLUGIN_HANDLED_MAIN

    new iPlayers[32], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "aegh", szTarget[1])
    if(iPlayersNum > 0) {
      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if(iDamage && iPlayer == id) {
          console_print(id, _T("That action can not be performed on yourself (skipped)."))
          iBlockedPlayersNum++
          continue
        }

        if((bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        if(iDamage == 0) {
          RemoveUserPoisoned(id)
          remove_task(id + TASKID_PoisonPlayer)
        }
        else {
          SetUserPoisoned(iPlayer)
          remove_task(iPlayer + TASKID_PoisonPlayer)
          set_task(1.0, "Task_PoisonPlayer", iPlayer + TASKID_PoisonPlayer, iParam, 1, "a", iTime - 1)
        }
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      new szTeamName[32]
      GetTeamName(szTarget, szTeamName, charsmax(szTeamName))

      if(iDamage == 0) {
        console_print(id, _T("The %s have been unpoisoned."), _T(szTeamName))
      }
      else {
        console_print(id, _T("The %s have been poisoned for %d seconds and with %d damage/second."), _T(szTeamName), iTime, iDamage)
      }

      if(iDamage == 0) {
        #if !defined COLORED_ACTIVITY
        show_activity(id, g_szAdminInfo[szName], _T("unpoison the %s."), _T(szTeamName))
        #else
        show_activity_color(id, g_szAdminInfo[szName], _T("unpoison the %s."), _T(szTeamName))
        #endif
      }
      else {
        #if !defined COLORED_ACTIVITY
        show_activity(id, g_szAdminInfo[szName], _T("poison the %s for %d seconds."), _T(szTeamName), iTime)
        #else
        show_activity_color(id, g_szAdminInfo[szName], _T("poison the %s for %d seconds."), _T(szTeamName), iTime)
        #endif
      }

      #if defined USE_LOGS
      if(id > 0) {
        if(iDamage == 0) {
          log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" unpoison the %s.", g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szTeamName)
        }
        else {
          log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" poison the %s (delay: %d seconds | damage/second: %d).", g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szTeamName, iTime, iDamage)
        }
      }
      else {
        if(iDamage == 0) {
          log_amx("Admin All-In-One Commands: <%s> unpoison the %s.", g_szAdminInfo[szName], szTeamName)
        }
        else {
          log_amx("Admin All-In-One Commands: <%s> poison the %s (delay: %d seconds | damage/second: %d).", g_szAdminInfo[szName], szTeamName, iTime, iDamage)
        }
      }
      #endif
    }
    else {
      console_print(id, _T("No alive player in this team."))
    }
  }
  else {
    iPlayer = cmd_target(id, szTarget, 7)
    if(!iPlayer)
      return PLUGIN_HANDLED_MAIN

    if(iDamage == 0) {
      RemoveUserPoisoned(id)
      remove_task(id + TASKID_PoisonPlayer)
    }
    else {
      SetUserPoisoned(iPlayer)
      remove_task(iPlayer + TASKID_PoisonPlayer)
      set_task(1.0, "Task_PoisonPlayer", iPlayer + TASKID_PoisonPlayer, iParam, 1, "a", iTime - 1)
    }

    GetPlayerInfos(iPlayer)

    if(iDamage == 0) {
      console_print(id, _T("Player ^"%s^" unpoisoned."), g_szPlayerInfo[szName])
    }
    else {
      console_print(id, _T("Player ^"%s^" poisoned for %d seconds and with %d damage/second."), g_szPlayerInfo[szName], iTime, iDamage)
    }

    if(iDamage == 0) {
      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("unpoison %s."), g_szPlayerInfo[szName])
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("unpoison %s."), g_szPlayerInfo[szName])
      #endif
    }
    else {
      #if !defined COLORED_ACTIVITY
      show_activity(id, g_szAdminInfo[szName], _T("poison %s for %d seconds."), g_szPlayerInfo[szName], iTime)
      #else
      show_activity_color(id, g_szAdminInfo[szName], _T("poison %s for %d seconds."), g_szPlayerInfo[szName], iTime)
      #endif
    }

    #if defined USE_LOGS
    if(id > 0) {
      if(iDamage == 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" unpoison ^"<%s><%d><%s><%s>^".",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress],
        g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
      }
      else {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" poison ^"<%s><%d><%s><%s>^" (delay: %d seconds | damage/second: %d).",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress],
        g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress], iTime, iDamage)
      }
    }
    else {
      if(iDamage == 0) {
        log_amx("Admin All-In-One Commands: <%s> unpoison ^"<%s><%d><%s><%s>^".",
        g_szAdminInfo[szName], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> poison ^"<%s><%d><%s><%s>^" (delay: %d seconds | damage/second: %d).",
        g_szAdminInfo[szName], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress], iTime, iDamage)
      }
    }
    #endif
  }
  return PLUGIN_HANDLED_MAIN
}

public Task_PoisonPlayer(iParam[], id) {
  id -= TASKID_PoisonPlayer

  new iDamage = iParam[0]

  if(IsUserPoisoned(id) && is_user_alive(id)) {
    new iHealth = get_user_health(id)
    if(iHealth > iDamage) {
      set_user_health(id, iHealth - iDamage)
    }
    else {
      user_kill(id, 1)
      RemoveUserPoisoned(id)
      remove_task(id + TASKID_PoisonPlayer)
      return
    }

    new iOrigin[3]
    get_user_origin(id, iOrigin)
    message_begin(MSG_ONE_UNRELIABLE, g_iMsgTypeID_Damage, {0, 0, 0}, id)
    write_byte(30)
    write_byte(30)
    write_long(1<<16)
    write_coord(iOrigin[0])
    write_coord(iOrigin[1])
    write_coord(iOrigin[2])
    message_end()
  }
  else {
    RemoveUserPoisoned(id)
    remove_task(id + TASKID_PoisonPlayer)
  }
}

/*******************************************************************************
 * Admin Clexec.
 ******************************************************************************/
public cmdClExec(id, iLevel, iCommandId) {
  if(!cmd_access(id, iLevel, iCommandId, 3))
    return PLUGIN_HANDLED_MAIN

  new szTarget[32], iPlayer
  read_argv(1, szTarget, charsmax(szTarget))

  new iCVar_AMXShowClCmds = get_cvarptr_num(g_pCVar_AMXShowClCmds)
  new bool:bHasSupreme    = access(id, ADMIN_SUPREME) ? true : false

  GetAdminInfos(id)

  if(equali(szTarget, "@all")) {
    new iPlayers[32], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "ch")
    if(iPlayersNum > 0) {
      new szArgs[128]
      read_args(szArgs, charsmax(szArgs))
      new iStartPos = strlen(szTarget) + 1
      trim_imp(szArgs[iStartPos], _, true)
      replace(szArgs[iStartPos], charsmax(szArgs) - iStartPos, " ", "^t")

      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if(iPlayer == id/* && iPlayersNum > 1*/) {
          console_print(id, _T("That action can not be performed on yourself (skipped)."))
          iBlockedPlayersNum++
          continue
        }

        if((bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        client_cmd(iPlayer, szArgs[iStartPos])
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      replace(szArgs[iStartPos], charsmax(szArgs) - iStartPos, "^t", " ")

      console_print(id, _T("Client command ^"%s^" executed to all players."), szArgs[iStartPos])

      #if !defined COLORED_ACTIVITY
      if(iCVar_AMXShowClCmds == 0 || iCVar_AMXShowClCmds == 1 && IsProtectedCmd(szArgs[iStartPos]))
        show_activity(id, g_szAdminInfo[szName], _T("execute client command ^"%s^" to all players."), _T("*** PROTECTED ***"))
      else
        show_activity(id, g_szAdminInfo[szName], _T("execute client command ^"%s^" to all players."), szArgs[iStartPos])
      #else
      if(iCVar_AMXShowClCmds == 0 || iCVar_AMXShowClCmds == 1 && IsProtectedCmd(szArgs[iStartPos]))
        show_activity_color(id, g_szAdminInfo[szName], _T("execute client command ^"%s^" to all players."), _T("*** PROTECTED ***"))
      else
        show_activity_color(id, g_szAdminInfo[szName], _T("execute client command ^"%s^" to all players."), szArgs[iStartPos])
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" execute client command ^"%s^" to all players.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szArgs[iStartPos])
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> execute client command ^"%s^" to all players.", g_szAdminInfo[szName], szArgs[iStartPos])
      }
      #endif
    }
    else {
      console_print(id, _T("No real player on the server."))
    }
  }
  else if(szTarget[0] == '@') {
    if(!CanUseTeamAsTarget(id))
      return PLUGIN_HANDLED_MAIN

    new iPlayers[32], iPlayersNum, iBlockedPlayersNum
    get_players(iPlayers, iPlayersNum, "cegh", szTarget[1])
    if(iPlayersNum > 0) {
      new szArgs[128]
      read_args(szArgs, charsmax(szArgs))
      new iStartPos = strlen(szTarget) + 1
      trim_imp(szArgs[iStartPos], _, true)
      replace(szArgs[iStartPos], charsmax(szArgs) - iStartPos, " ", "^t")

      for(new i = 0; i < iPlayersNum; i++) {
        iPlayer = iPlayers[i]

        if(iPlayer == id/* && iPlayersNum > 1*/) {
          console_print(id, _T("That action can not be performed on yourself (skipped)."))
          iBlockedPlayersNum++
          continue
        }

        if((bHasSupreme == false) && (get_user_flags(iPlayer) & ADMIN_IMMUNITY)) {
          get_user_name(iPlayer, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
          console_print(id, _T("Player ^"%s^" has immunity."), g_szPlayerInfo[szName])
          iBlockedPlayersNum++
          continue
        }

        client_cmd(iPlayer, szArgs[iStartPos])
      }

      if(iBlockedPlayersNum == iPlayersNum) {
        console_print(id, _T("That action can not be performed on selected players."))
        return PLUGIN_HANDLED_MAIN
      }

      replace(szArgs[iStartPos], charsmax(szArgs) - iStartPos, "^t", " ")

      new szTeamName[32]
      GetTeamName(szTarget, szTeamName, charsmax(szTeamName))

      console_print(id, _T("Client command ^"%s^" executed to the %s."), szArgs[iStartPos], _T(szTeamName))

      #if !defined COLORED_ACTIVITY
      if(iCVar_AMXShowClCmds == 0 || iCVar_AMXShowClCmds == 1 && IsProtectedCmd(szArgs[iStartPos]))
        show_activity(id, g_szAdminInfo[szName], _T("execute client command ^"%s^" to the %s."), _T("*** PROTECTED ***"), _T(szTeamName))
      else
        show_activity(id, g_szAdminInfo[szName], _T("execute client command ^"%s^" to the %s."), szArgs[iStartPos], _T(szTeamName))
      #else
      if(iCVar_AMXShowClCmds == 0 || iCVar_AMXShowClCmds == 1 && IsProtectedCmd(szArgs[iStartPos]))
        show_activity_color(id, g_szAdminInfo[szName], _T("execute client command ^"%s^" to the %s."), _T("*** PROTECTED ***"), _T(szTeamName))
      else
        show_activity_color(id, g_szAdminInfo[szName], _T("execute client command ^"%s^" to the %s."), szArgs[iStartPos], _T(szTeamName))
      #endif

      #if defined USE_LOGS
      if(id > 0) {
        log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" execute client command ^"%s^" to the %s.",
        g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szArgs[iStartPos], szTeamName)
      }
      else {
        log_amx("Admin All-In-One Commands: <%s> execute client command ^"%s^" to the %s.", g_szAdminInfo[szName], szArgs[iStartPos], szTeamName)
      }
      #endif
    }
    else {
      console_print(id, _T("No real player in this team."))
    }
  }
  else {
    iPlayer = cmd_target(id, szTarget, 11)
    if(!iPlayer)
      return PLUGIN_HANDLED_MAIN

    new szArgs[128]
    read_args(szArgs, charsmax(szArgs))
    new iStartPos = strlen(szTarget) + 1
    trim_imp(szArgs[iStartPos], _, true)
    replace(szArgs[iStartPos], charsmax(szArgs) - iStartPos, " ", "^t")
    client_cmd(iPlayer, szArgs[iStartPos])
    replace(szArgs[iStartPos], charsmax(szArgs) - iStartPos, "^t", " ")

    GetPlayerInfos(iPlayer)

    console_print(id, _T("Client command ^"%s^" executed to %s."), szArgs[iStartPos], g_szPlayerInfo[szName])

    #if !defined COLORED_ACTIVITY
    if(iCVar_AMXShowClCmds == 0 || iCVar_AMXShowClCmds == 1 && IsProtectedCmd(szArgs[iStartPos]))
      show_activity(id, g_szAdminInfo[szName], _T("execute client command ^"%s^" to %s."), _T("*** PROTECTED ***"), g_szPlayerInfo[szName])
    else
      show_activity(id, g_szAdminInfo[szName], _T("execute client command ^"%s^" to %s."), szArgs[iStartPos], g_szPlayerInfo[szName])
    #else
    if(iCVar_AMXShowClCmds == 0 || iCVar_AMXShowClCmds == 1 && IsProtectedCmd(szArgs[iStartPos]))
      show_activity_color(id, g_szAdminInfo[szName], _T("execute client command ^"%s^" to %s."), _T("*** PROTECTED ***"), g_szPlayerInfo[szName])
    else
      show_activity_color(id, g_szAdminInfo[szName], _T("execute client command ^"%s^" to %s."), szArgs[iStartPos], g_szPlayerInfo[szName])
    #endif

    #if defined USE_LOGS
    if(id > 0) {
      log_amx("Admin All-In-One Commands: ^"<%s><%d><%s><%s>^" execute client command ^"%s^" to ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], get_user_userid(id), g_szAdminInfo[szAuthID], g_szAdminInfo[szIPAddress], szArgs[iStartPos],
      g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    else {
      log_amx("Admin All-In-One Commands: <%s> execute client command ^"%s^" to ^"<%s><%d><%s><%s>^".",
      g_szAdminInfo[szName], szArgs[iStartPos], g_szPlayerInfo[szName], get_user_userid(iPlayer), g_szPlayerInfo[szAuthID], g_szPlayerInfo[szIPAddress])
    }
    #endif
  }
  return PLUGIN_HANDLED_MAIN
}


/*******************************************************************************
 * Functions used in the following plugins:
 * Admin Maxspeed, Admin Fire, Admin Rocket, Admin Blanks, Admin NoBuy, Admin Poison.
 ******************************************************************************/
public client_putinserver(iClientID) {
  g_bIsBot[iClientID] = is_user_bot(iClientID) ? true : false
  RemoveUserBuyingBlocked(iClientID)

  if(!g_bIsBot[iClientID]) {
    set_task(0.5, "Task_SetUserSpeedCVars", iClientID + TASKID_SetUserSpeedCVars)
  }
}

public client_disconnect(iClientID) {
  RemoveUserSpeed(iClientID)
  g_bIsBot[iClientID] = false

  if(IsUserFired(iClientID)) {
    RemoveUserFired(iClientID)
    remove_task(iClientID + TASKID_IgniteEffects)
    remove_task(iClientID + TASKID_IgnitePlayer)
  }

  if(IsUserBlanked(iClientID)) {
    RemoveUserBlanked(iClientID)
    remove_task(iClientID + TASKID_UnBlankPlayer)
  }

  if(IsUserBuyingBlocked(iClientID)) {
    RemoveUserBuyingBlocked(iClientID)
    g_iBuyingBlockedNum--
    TryUnregisterMSG_StatusIcon()
  }

  if(IsUserPoisoned(iClientID)) {
    RemoveUserPoisoned(iClientID)
    remove_task(iClientID + TASKID_PoisonPlayer)
  }
}

public Event_ResetHUD(iClientID) {
  // Keep blanks on respawn as they will be reset by the "Fun" module.
  if(IsUserBlanked(iClientID)) {
    set_user_hitzones(iClientID, 0, 0)
  }

  if(IsUserPoisoned(iClientID)) {
    RemoveUserPoisoned(iClientID)
    remove_task(iClientID + TASKID_PoisonPlayer)
  }
}

public Event_HLTV() {
  new Float:flMpFreezeTime = get_cvarptr_float(g_pCVar_MPFreezeTime)

  if((g_iLocalGameModTypeID <= LGMT_CSv15) && !(read_data(1) == flMpFreezeTime))
    return

  g_bFreezeTime = (flMpFreezeTime > 0.0) ? true : false

  new iPlayers[MAX_CLIENTS], iPlayersNum, iPlayer
  get_players(iPlayers, iPlayersNum)
  for(new i = 0; i < iPlayersNum; i++) {
    iPlayer = iPlayers[i]

    if(IsUserFired(iPlayer)) {
      RemoveUserFired(iPlayer)
      remove_task(iPlayer + TASKID_IgniteEffects)
      remove_task(iPlayer + TASKID_IgnitePlayer)
    }

    if(remove_task(iPlayer + TASKID_RocketEffects)) {
      emit_sound(iPlayer, CHAN_VOICE, "weapons/rocket1.wav", 0.0, 0.0, (1<<5), PITCH_NORM)
    }
  }
}

CmdTargetExtra(const id, const szArg[], const iFlags = 3, const bool:bExtraFeature = false) {
  new iPlayer = find_player("bl", szArg)
  if(iPlayer) {
    if(iPlayer != find_player("blj", szArg)) {
#if defined _translator_included
      console_print(id, _T("There are more players matching to your argument."))
#else
      console_print(id, "There are more players matching to your argument.")
#endif
      return bExtraFeature ? -1 : 0
    }
  }
  else if((iPlayer = find_player("c", szArg)) == 0 && (iPlayer = find_player("d", szArg)) == 0 && szArg[0] == '#' && szArg[1]) {
    iPlayer = find_player("k", strtonum(szArg[1]))
  }
  if(!iPlayer) {
#if defined _translator_included
    if(bExtraFeature == false) console_print(id, _T("Player with that name or userid not found."))
#else
    if(bExtraFeature == false) console_print(id, "Player with that name or userid not found.")
#endif
    return 0
  }

  if((iFlags & 2) == 0 && (iPlayer == id)) {
#if defined _translator_included
    console_print(id, _T("That action can't be performed on yourself."))
#else
    console_print(id, "That action can't be performed on yourself.")
#endif
    return bExtraFeature ? -1 : 0
  }

  if(iFlags & 1) {
    if((get_user_flags(iPlayer) & ADMIN_IMMUNITY) && (iPlayer != id) && !access(id, ADMIN_SUPREME)) {
      new szPlayerName[32]
      get_user_name(iPlayer, szPlayerName, charsmax(szPlayerName))
#if defined _translator_included
      console_print(id, _T("Player ^"%s^" has immunity."), szPlayerName)
#else
      console_print(id, "Player ^"%s^" has immunity.", szPlayerName)
#endif
      return bExtraFeature ? -1 : 0
    }
  }

  if(iFlags & 4) {
    if(!is_user_alive(iPlayer)) {
      new szPlayerName[32]
      get_user_name(iPlayer, szPlayerName, charsmax(szPlayerName))
#if defined _translator_included
      console_print(id, _T("That action can't be performed on dead player ^"%s^"."), szPlayerName)
#else
      console_print(id, "That action can't be performed on dead player ^"%s^".", szPlayerName)
#endif
      return bExtraFeature ? -1 : 0
    }
  }

  if(iFlags & 8) {
    if(is_user_bot(iPlayer)) {
      new szPlayerName[32]
      get_user_name(iPlayer, szPlayerName, charsmax(szPlayerName))
#if defined _translator_included
      console_print(id, _T("That action can't be performed on bot ^"%s^"."), szPlayerName)
#else
      console_print(id, "That action can't be performed on bot ^"%s^".", szPlayerName)
#endif
      return bExtraFeature ? -1 : 0
    }
  }
  return iPlayer
}

CanUseTeamAsTarget(iPerformerID) {
	if(g_iLocalGameModTypeID == LGMT_NoTeam) {
		console_print(iPerformerID, _T("Unable to target a specific team, the current game mod does not support it."))
		return false
	}

	return true
}

CS_GetUserBPAmmo(iClientID, iWeaponEntityID) {
	if(g_iMO_CBPW_m_iPrimaryAmmoType <= 0 || g_iMO_CBasePlayer_m_rgAmmo <= 0 || iWeaponEntityID <= g_iMaxClients)
		return -1

	new iPrimaryAmmoTypeID = get_offset_int(iWeaponEntityID, g_iMO_CBPW_m_iPrimaryAmmoType, 4)
	if(iPrimaryAmmoTypeID >= 0 && iPrimaryAmmoTypeID <= 31) {
		return get_offset_int(iClientID, g_iMO_CBasePlayer_m_rgAmmo + iPrimaryAmmoTypeID)
	}

	return -1
}

CS_SetUserBPAmmo(iClientID, iWeaponEntityID, iValue) {
	if(g_iMO_CBPW_m_iPrimaryAmmoType <= 0 || g_iMO_CBasePlayer_m_rgAmmo <= 0 || iWeaponEntityID <= g_iMaxClients)
		return 0

	new iPrimaryAmmoTypeID = get_offset_int(iWeaponEntityID, g_iMO_CBPW_m_iPrimaryAmmoType, 4)
	if(iPrimaryAmmoTypeID >= 0 && iPrimaryAmmoTypeID <= 31) {
		set_offset_int(iClientID, g_iMO_CBasePlayer_m_rgAmmo + iPrimaryAmmoTypeID, iValue)
		return 2
	}

	return 1
}

// Notes:
//   Bad to hardcode, as this will not apply the possible custom modifications we might do on an hook of that function.
//   But my current AMX Mod version & ReAPI module do not have such function available as "call", so use this for now.
CGameRules_FPlayerCanTakeDamage(iClientID, iAttackerID) {
	if(!IsEntityClient(iClientID) || !IsEntityClient(iAttackerID))
		return true

	if(iClientID == iAttackerID)
		return true

	if(g_pCVar_MPFreeForAll && get_cvarptr_num(g_pCVar_MPFreeForAll))
		return true

	if(IsGameModCS) {
		if(CS_GetUserTeam(iClientID) != CS_GetUserTeam(iAttackerID))
			return true
	}
	else {
		if(get_user_team(iClientID) != get_user_team(iAttackerID))
			return true
	}

	if(!g_pCVar_MPFriendlyFire || get_cvarptr_num(g_pCVar_MPFriendlyFire)) // Does no FF CVar means no team gameplay? I guess yes!
		return true

	return false
}


/*******************************************************************************
 * Function used to get Admin & Player infos (name, SteamID/WonID, Ip Address)
 ******************************************************************************/
GetAdminInfos(id) {
  if(id == 0) copy(g_szAdminInfo[szName], charsmax(g_szAdminInfo[szName]), "SERVER")
  else get_user_name(id, g_szAdminInfo[szName], charsmax(g_szAdminInfo[szName]))
  #if defined USE_LOGS
  if(id > 0) {
    get_user_authid(id, g_szAdminInfo[szAuthID], charsmax(g_szAdminInfo[szAuthID]))
    get_user_ip(id, g_szAdminInfo[szIPAddress], charsmax(g_szAdminInfo[szIPAddress]), 1)
  }
  #endif
}

GetPlayerInfos(id) {
  get_user_name(id, g_szPlayerInfo[szName], charsmax(g_szPlayerInfo[szName]))
  #if defined USE_LOGS
  get_user_authid(id, g_szPlayerInfo[szAuthID], charsmax(g_szPlayerInfo[szAuthID]))
  get_user_ip(id, g_szPlayerInfo[szIPAddress], charsmax(g_szPlayerInfo[szIPAddress]), 1)
  #endif
}


/*******************************************************************************
 * Function used to get team name.
 ******************************************************************************/

GetTeamName(const szTarget[], szTeamName[], iTeamNameLength) {
  if(IsGameModCS) {
    switch(szTarget[1]) {
      case '0', 'u', 'U': copy(szTeamName, iTeamNameLength, "UNASSIGNED")
      case '1', 't', 'T': copy(szTeamName, iTeamNameLength, "TERRORISTS")
      case '2', 'c', 'C': copy(szTeamName, iTeamNameLength, "CTs")
      case '3', 's', 'S': copy(szTeamName, iTeamNameLength, "SPECTATORS")
    }
  }
  else if(g_iLocalGameModTypeID == LGMT_DoD) {
    if(szTarget[1] == '1' || szTarget[2] == 'l' || szTarget[2] == 'L')
      copy(szTeamName, iTeamNameLength, "ALLIES")
    else if(szTarget[1] == '2' || szTarget[2] == 'x' || szTarget[2] == 'X')
      copy(szTeamName, iTeamNameLength, "AXIS")
    else
      copy(szTeamName, iTeamNameLength, (szTarget[1] == '3') ? "SPECTATORS" : "UNASSIGNED")
  }
  else if(g_iLocalGameModTypeID == LGMT_TFC) {
    switch(szTarget[1]) {
      case '0', 's', 'S': copy(szTeamName, iTeamNameLength, "SPECTATORS")
      case '1', 'b', 'B': copy(szTeamName, iTeamNameLength, (g_bIsExtraMap == false) ? "BLUE" : "HUNTED")
      case '2', 'r', 'R': copy(szTeamName, iTeamNameLength, (g_bIsExtraMap == false) ? "RED" : "BODYGUARDS")
      case '3', 'a', 'A': copy(szTeamName, iTeamNameLength, "ASSASSINS")
    }
  }
  else {
    switch(str_to_num(szTarget[1])) {
      case -1 .. 1: copy(szTeamName, iTeamNameLength, "TEAM 1")
      case 2 .. 25: copy(szTeamName, iTeamNameLength, "TEAM 2")
      default: copy(szTeamName, iTeamNameLength, "TEAMS")
    }
  }
}

