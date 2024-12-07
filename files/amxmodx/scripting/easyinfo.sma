#include <amxmodx>
#include <amxmisc>
#include <cstrike>

public plugin_init() {
	register_plugin("Stats","0.2","Dah-Veeeed")
	set_task(2.0,"the_main",0,_,_,"b")
	register_event("Damage","damage_event","b","2!0","3=0","4!0")
	register_cvar("amx_info","1")
}

new damage[33] = 0

public client_putinserver(id) {
	damage[id] = 0
}

public client_disconnect(id) {
	damage[id] = 0
}

public damage_event(id)
{
	new attacker = get_user_attacker(id)
	new dmg = read_data(2)
	
	damage[attacker] += dmg
}


public the_main() {
	if(!get_cvar_num("amx_info")) {
		return PLUGIN_HANDLED
	}
	new players[32],num,i
	new message[200]
	get_players(players,num)
	for(i = 0; i <= num; i++)
	{
		new id = players[i]
		
		if(is_user_connected(id)) {
			new name[33]
			new ping
			new loss
			get_user_name(id,name,32)
			new frags = get_user_frags(id)
			new deaths = get_user_deaths(id)
			get_user_ping(id,ping,loss)
			
			set_hudmessage (0,0,255, 0.01, 0.29, 0, 6.0, 2.0, 0.1, 0.2, 4 )
			format(message,199," %s ^n Frags: %i ^n Deaths: %i ^n Total Damage: %i ^n Ping: %i",name,frags,deaths,damage,ping)
			show_hudmessage(id,message) 
		}
	}
	return PLUGIN_CONTINUE
}