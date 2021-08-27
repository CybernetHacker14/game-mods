#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "CybernetHacker14"
#define PLUGIN_VERSION "0.01"

#include <sourcemod>
#include <sdktools>
#include <cstrike>
//#include <sdkhooks>

#pragma newdecls required

EngineVersion g_Game;

public Plugin myinfo = 
{
	name = "Domination/Revenge System", 
	author = PLUGIN_AUTHOR, 
	description = "My version of the Domination/Revenge system in Casual/Competitve mode", 
	version = PLUGIN_VERSION, 
	url = ""
};

enum struct ClientStats {
	int clientId;
	char clientName[64];
	int otherClients[MAXPLAYERS + 1];
	int timesKilled[MAXPLAYERS + 1];
}

ClientStats clientData[MAXPLAYERS + 1];

int dominationKillCount = 3;

int clientListHead;

bool initExecution;

public void OnPluginStart()
{
	g_Game = GetEngineVersion();
	if (g_Game != Engine_CSGO && g_Game != Engine_CSS)
	{
		SetFailState("This plugin is for CSGO/CSS only.");
	}
	
	HookEvent("round_start", Event_RoundStart);
	HookEvent("player_death", Event_RecordDeath);
}

public void OnMapStart() {
	clientListHead = 0;
	initExecution = false;
}

public void OnClientConnected(int id) {
	clientData[clientListHead].clientId = id;
	GetClientName(id, clientData[clientListHead].clientName, 64);
	clientListHead++;
}

void Event_RoundStart(Event event, const char[] name, bool dontBroadcast) {
	if (!initExecution) {
		CreateTimer(5.0, KillLogInit);
	}
	
}

Action KillLogInit(Handle handle) {
	
	for (int i = 0; i < clientListHead; i++) {
		int counter = 0;
		for (int j = 0; j < clientListHead; j++) {
			if (clientData[i].clientId == clientData[j].clientId) {
				continue;
			}
			else {
				clientData[i].otherClients[counter] = clientData[j].clientId;
				clientData[i].timesKilled[counter] = 0;
				counter++;
			}
		}
	}
	
	initExecution = true;
	
	return Plugin_Handled;
}

void Event_RecordDeath(Event event, const char[] name, bool dontBroadcast) {
	
	int victim_id = event.GetInt("userid");
	int victim = GetClientOfUserId(victim_id);
	
	int attacker_id = event.GetInt("attacker");
	int attacker = GetClientOfUserId(attacker_id);
	
	UpdateKillLog(victim, attacker);
}

void UpdateKillLog(int client_victim, int client_attacker) {
	for (int i = 0; i < clientListHead; i++) {
		if (clientData[i].clientId == client_attacker) {
			for (int j = 0; j < clientListHead - 1; j++) {
				if (clientData[i].otherClients[j] == client_victim) {
					clientData[i].timesKilled[j] += 1;
				}
			}
		}
		if (clientData[i].clientId == client_victim) {
			for (int j = 0; j < clientListHead - 1; j++) {
				if (clientData[i].otherClients[j] == client_attacker) {
					clientData[i].timesKilled[j] = 0;
				}
			}
		}
	}
	
	for (int i = 1; i <= MaxClients; i++) {
		if (IsClientConnected(i)) {
			DisplayKillLog(i);
		}
	}
}

void DisplayKillLog(int client) {
	char messageBuffer[512];
	char formatBuffer[64];
	char nameBuffer[64];
	
	StrCat(messageBuffer, 512, "Dominating\n");
	
	for (int i = 0; i < clientListHead; i++) {
		if (clientData[i].clientId == client) {
			for (int j = 0; j < clientListHead - 1; j++) {
				if (clientData[i].timesKilled[j] > dominationKillCount) {
					GetClientName(clientData[i].otherClients[j], nameBuffer, 64);
					Format(formatBuffer, 64, "%s - %i", nameBuffer, clientData[i].timesKilled[j]);
					StrCat(messageBuffer, 512, formatBuffer);
					StrCat(messageBuffer, 512, "\n");
				}
			}
		}
	}
	
	StrCat(messageBuffer, 512, "\n");
	StrCat(messageBuffer, 512, "Take Revenge from\n");
	
	for (int i = 0; i < clientListHead; i++) {
		for (int j = 0; j < clientListHead - 1; j++) {
			if (clientData[i].timesKilled[j] > dominationKillCount && clientData[i].otherClients[j] == client) {
				Format(formatBuffer, 64, "%s - %i", clientData[i].clientName, clientData[i].timesKilled[j]);
				StrCat(messageBuffer, 512, formatBuffer);
				StrCat(messageBuffer, 512, "\n");
			}
		}
	}
	
	SetHudTextParams(0.6, 0.3, 100.0, 255, 0, 0, 255);
	ShowHudText(client, 2, messageBuffer);
} 