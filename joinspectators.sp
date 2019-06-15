#include <sourcemod>
#include <sdktools>
#pragma semicolon 1
#pragma newdecls required

ConVar moveFrom;
int joined_players = 0;

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
	moveFrom = CreateConVar("sm_js_movefrom", "10", "Count of players that require to move player to spectators");
}

public void OnClientPutInServer(int client) 
{
	if (IsFakeClient(client)) {
		return; 
	}
	
	++joined_players;
	
	int moveFromInt = GetConVarInt(moveFrom);

	if (joined_players <= moveFromInt) {
		return;
	}
	
	ChangeClientTeam(client, 3);
}

public void OnClientDisconnect(int client)
{
	--joined_players;
}