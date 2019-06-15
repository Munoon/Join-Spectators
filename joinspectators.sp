#include <sourcemod>
#include <sdktools>
#pragma semicolon 1
#pragma newdecls required

ConVar moveFrom;
ConVar isEnable;

public Plugin myinfo = 
{
	name = "Join Spectators",
	author = "Munoon",
	description = "This plugin join player to spectator if on server more than X players",
	version = "1.0",
	url = "www.Train4Game.com"
};

public void OnPluginStart()
{
	isEnable = CreateConVar("sm_js_enable", "1", "Is plugin enabled");
	moveFrom = CreateConVar("sm_js_movefrom", "10", "Count of players that require to move player to spectators");
}

public void OnClientPutInServer(int client) 
{	
	if (!GetConVarBool(isEnable) || IsFakeClient(client)) {
		return; 
	}
	
	int moveFromInt = GetConVarInt(moveFrom);
	if (GetClientCount(true) <= moveFromInt) {
		return;
	}
	
	ChangeClientTeam(client, 3);
}