#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "CybernetHacker14"
#define PLUGIN_VERSION "0.01"

#include <sourcemod>
#include <sdktools>
#include <cstrike>
#include <sdkhooks>

#pragma newdecls required

EngineVersion g_Game;

public Plugin myinfo = 
{
	name = "Slow Time",
	author = PLUGIN_AUTHOR,
	description = "A key-press based slow time mod. Press the 'v' key to toggle slow-down time",
	version = PLUGIN_VERSION,
	url = ""
};

public void OnPluginStart()
{
	g_Game = GetEngineVersion();
	if(g_Game != Engine_CSGO && g_Game != Engine_CSS)
	{
		SetFailState("This plugin is for CSGO/CSS only.");	
	}
	
	ServerCommand("sv_cheats %i", 1);
	ServerCommand("bind v \"toggle host_timescale 0.3 1.0\"");
}
