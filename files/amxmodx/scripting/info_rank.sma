#include <translator>
#include <amxmod>
#include <amxmisc>
#include <csstats>

#define FLAG_INFORANK ADMIN_ALL

#define ENABLED_BY_DEFAULT 1
#define MAX_PLAYERS 32

#if !defined charsmax
  #define charsmax(%1) sizeof(%1) - 1
#endif

new g_iOldRank[MAX_PLAYERS + 1]
new g_iEnabled[MAX_PLAYERS + 1]

new g_pCvarInfoRank

public plugin_init() {
  load_translations("info_rank")
  register_plugin("Info Rank", "0.3.0", "ConnorMcLeod")

  g_pCvarInfoRank = register_cvar("amx_inforank", "1")

  register_event("ResetHUD", "Player_Spawn_Post", "be")

  register_clcmd("say /inforank", "ClientCommand_InfoRank", FLAG_INFORANK, _T("- enable/disable info rank messages"))
  register_clcmd("say_team /inforank", "ClientCommand_InfoRank", FLAG_INFORANK, _T("- enable/disable info rank messages"))
}

public client_authorized(id) {
  new szSteamID[24]
  get_user_authid(id, szSteamID, charsmax(szSteamID))
  if(szSteamID[0] != 'B') {
    new mOsef[8]
    g_iOldRank[id] = get_user_stats(id, mOsef, mOsef)
    CheckVaultData(id, szSteamID)
  }
}

public Player_Spawn_Post(id) {
  if(g_iEnabled[id] && get_cvarptr_num(g_pCvarInfoRank) > 0) {
    new mOsef[8], iRank, iOldRank
    iRank = get_user_stats(id, mOsef, mOsef)

    iOldRank = g_iOldRank[id]
    if(iOldRank == 0) {
      iOldRank = iRank
    }
    g_iOldRank[id] = iRank

    new iDiff = iOldRank - iRank

    if(iDiff > 0) {
      client_print_color(id, id, _T("[^4Info Rank^1] Congratulations, you have advanced ^4%i ^1place(s)!!"), iDiff)  
    }
    else if(iDiff < 0) {
      client_print_color(id, id, _T("[^4Info Rank^1] Noob, you have gone down ^4%i ^1place(s)!!"), iDiff)
    }
    client_print_color(id, id, _T("[^4Info Rank^1] Your rank: ^4%i ^1of ^4%i"), iRank, get_statsnum())
  }
}

public ClientCommand_InfoRank(id, level) {
  if(access(id, level) && get_cvarptr_num(g_pCvarInfoRank) > 0) {
    new szSteamID[24]
    get_user_authid(id, szSteamID, charsmax(szSteamID))
    if((g_iEnabled[id] = !g_iEnabled[id])) {
      SetVaultData(szSteamID, g_iEnabled[id] = 1)
      client_print_color(id, id, _T("[^4Info Rank^1] ^4You have enabled messages."))
    }
    else {
      SetVaultData(szSteamID, g_iEnabled[id] = 0)
      client_print_color(id, id, _T("[^4Info Rank^1] ^4You have disabled messages."))
    }
  }
  return PLUGIN_CONTINUE
}

SetVaultData(const szSteamID[], const iEnabled) {
  new szVaultKey[32]
  formatex(szVaultKey, charsmax(szVaultKey), "InfoRank_%s", szSteamID)
  set_vaultdata(szVaultKey, iEnabled ? "1" : "0")
}

CheckVaultData(id, const szSteamID[]) {
  new szVaultKey[32], szVaultData[2]
  formatex(szVaultKey, charsmax(szVaultKey), "InfoRank_%s", szSteamID)
  if(get_vaultdata(szVaultKey, szVaultData, charsmax(szVaultData))) {
    g_iEnabled[id] = (szVaultData[0] == '0') ? 0 : 1
  }
  else {
    #if ENABLED_BY_DEFAULT
    set_vaultdata(szVaultKey, "1")
    #else
    set_vaultdata(szVaultKey, "0")
    #endif
    g_iEnabled[id] = ENABLED_BY_DEFAULT
  }
}
