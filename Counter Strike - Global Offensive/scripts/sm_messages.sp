#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "CybernetHacker14"
#define PLUGIN_VERSION "0.01"

#define VICTIM "{victim}"
#define ATTACKER "{attacker}"

#include <sourcemod>
#include <sdktools>
#include <cstrike>
#include <sdkhooks>

#pragma newdecls required

EngineVersion g_Game;

public Plugin myinfo = 
{
	name = "", 
	author = PLUGIN_AUTHOR, 
	description = "WARNING: A toxic plugin to display a random horrendous message when a kill event occurs", 
	version = PLUGIN_VERSION, 
	url = ""
};

char killMessages[][] =  {
	"{attacker} killed {victim}", 
	"{victim} was assassinated by {attacker}"
};

int killMessageCount = 2;

char suicideMessages[][] =  {
	"{victim} killed himself", 
	"{victim} fought with great honor, but accidentally\n killed himself"
};

int suicideMessageCount = 2;

public void OnPluginStart()
{
	g_Game = GetEngineVersion();
	if (g_Game != Engine_CSGO && g_Game != Engine_CSS)
	{
		SetFailState("This plugin is for CSGO/CSS only.");
	}
	
	HookEvent("player_death", Event_RecordDeath);
}

public void Event_RecordDeath(Event event, const char[] name, bool dontBroadcast) {
	int victim_id = event.GetInt("userid");
	int victim = GetClientOfUserId(victim_id);
	char victim_name[64];
	
	int attacker_id = event.GetInt("attacker");
	int attacker = GetClientOfUserId(attacker_id);
	char attacker_name[64];
	
	GetClientName(victim, victim_name, sizeof(victim_name));
	GetClientName(attacker, attacker_name, sizeof(attacker_name));
	
	DisplayMessage(victim_name, attacker_name);
}

void DisplayMessage(char victim_name[64], char attacker_name[64]) {
	
	
	for (int i = 1; i <= MaxClients; i++) {
		if (!IsClientConnected(i) || IsFakeClient(i)) {
			continue;
		}
		MessageSystem(victim_name, attacker_name, i);
	}
}

void MessageSystem(char victim_name[64], char attacker_name[64], int client) {
	
	bool suicideDetected = false;
	char messageBuffer[128][128];
	char finalMessage[512];
	
	int randomNumber;
	int parts;
	
	if (StrEqual(victim_name, attacker_name)) {
		suicideDetected = true;
	}
	
	if (suicideDetected == true) {
		randomNumber = GetRandomInt(0, suicideMessageCount - 1);
		parts = ExplodeString(suicideMessages[randomNumber], " ", messageBuffer, 128, 128);
	} else {
		randomNumber = GetRandomInt(0, killMessageCount - 1);
		parts = ExplodeString(killMessages[randomNumber], " ", messageBuffer, 128, 128);
	}
	
	for (int i = 0; i < parts; i++) {
		if (StrContains(messageBuffer[i], VICTIM) != -1) {
			ReplaceString(messageBuffer[i], 128, VICTIM, victim_name);
		}
		else if (StrContains(messageBuffer[i], ATTACKER) != -1) {
			ReplaceString(messageBuffer[i], 128, ATTACKER, attacker_name);
		}
	}
	
	for (int i = 0; i < parts; i++) {
		StrCat(finalMessage, sizeof(finalMessage), messageBuffer[i]);
		StrCat(finalMessage, sizeof(finalMessage), " ");
	}
	
	SetHudTextParams(-1.0, 0.05, 8.0, 255, 255, 255, 255);
	ShowHudText(client, 1, finalMessage);
} 