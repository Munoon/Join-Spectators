#include <sourcemod>
#include <sdktools>
#pragma semicolon 1
#pragma newdecls required

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
	
}

public void OnClientPutInServer(int client) 
{
	if (IsFakeClient(client)) {
		return; 
	}
	
	ChangeClientTeam(client, 3);
}