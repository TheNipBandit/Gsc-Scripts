/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: maps\mp\gametypes\_deathicons.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 5
 * Decompile Time: 0 ms
 * Timestamp: 5/5/2026 9:13:19 PM
*******************************************************************/

//Function Number: 1
init()
{
	if(!level.teambased)
	{
		return;
	}

	precacheshader("friendly_death_hud");
	level thread onplayerconnect();
}

//Function Number: 2
onplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		var_00.var_83C1 = [];
	}
}

//Function Number: 3
func_A107()
{
}

//Function Number: 4
func_09AA(param_00,param_01,param_02,param_03,param_04,param_05,param_06)
{
	if(!level.teambased)
	{
		return;
	}

	if(isdefined(param_04))
	{
		if(isplayer(param_04) && param_04 maps\mp\_utility::_hasperk("specialty_silentkill"))
		{
			return;
		}

		if(isdefined(param_05) && maps\mp\_utility::ismeleemod(param_05) && isdefined(param_06) && function_01A9(param_06) == "melee")
		{
			return;
		}
	}

	var_07 = param_00.origin;
	param_01 endon("spawned_player");
	param_01 endon("disconnect");
	wait 0.05;
	maps\mp\_utility::waittillslowprocessallowed();
	if(getdvar("ui_hud_showdeathicons") == "0")
	{
		return;
	}

	if(level.hardcoremode)
	{
		return;
	}

	if(isdefined(self.var_5B8E))
	{
		self.var_5B8E destroy();
	}

	var_08 = newteamhudelem(param_02);
	var_08.x = var_07[0];
	var_08.y = var_07[1];
	var_08.z = var_07[2] + 54;
	var_08.alpha = 0.61;
	var_08.color = (0.9058824,0.8784314,0.7686275);
	var_08.archived = 1;
	if(level.splitscreen)
	{
		var_08 setshader("friendly_death_hud",14,14);
	}
	else
	{
		var_08 setshader("friendly_death_hud",7,7);
	}

	var_08 setwaypoint(0);
	self.var_5B8E = var_08;
	var_08 thread func_2DDC(param_03);
}

//Function Number: 5
func_2DDC(param_00)
{
	self endon("death");
	wait(param_00);
	self fadeovertime(1);
	self.alpha = 0;
	wait(1);
	self destroy();
}