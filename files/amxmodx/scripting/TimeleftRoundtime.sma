#include <amxmod>

#define VERSION   "1.2"

public plugin_init ()
{
    register_plugin( "Timeleft as Roundtime", VERSION, "AcidoX/joaquim");
    register_cvar( "TimeleftRoundtime", VERSION, FCVAR_SERVER|FCVAR_SPONLY )
    register_message( get_user_msgid( "RoundTime" ), "Event_RoundTime" );
    register_event( "BombDrop", "Event_BombDropped", "a", "4=1" );                        
}

public Event_RoundTime( const MsgId, const MsgDest, const MsgEnt )
{
    set_msg_arg_int( 1, get_timeleft() );
}

public Event_BombDropped ()
{
    static gMsgidShowTimer
    if(gMsgidShowTimer == 0)
    {
	    gMsgidShowTimer = get_user_msgid( "ShowTimer" );
    }
    
    message_begin( MSG_BROADCAST, gMsgidShowTimer );
    message_end();
}
