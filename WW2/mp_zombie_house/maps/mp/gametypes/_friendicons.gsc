/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: maps\mp\gametypes\_friendicons.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 7
 * Decompile Time: 1 ms
 * Timestamp: 5/5/2026 9:13:45 PM
*******************************************************************/

//Function Number: 1
init()
{
	level.var_33D6 = 0;
	game["headicon_allies"] = maps\mp\gametypes\_teams::func_46D1("allies");
	game["headicon_axis"] = maps\mp\gametypes\_teams::func_46D1("axis");
	level thread onplayerconnect();
	for(;;)
	{
		func_A117();
		wait(5);
	}
}

//Function Number: 2
onplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		var_00 thread onplayerspawned();
		var_00 thread func_6B7B();
	}
}

//Function Number: 3
onplayerspawned()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("spawned_player");
		thread func_8BFA();
	}
}

//Function Number: 4
func_6B7B()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("killed_player");
		self.headicon = "";
	}
}

//Function Number: 5
func_8BFA()
{
	if(level.var_33D6)
	{
		if(self.pers["team"] == "allies")
		{
			self.headicon = game["headicon_allies"];
			self.headiconteam = "allies";
			return;
		}

		self.headicon = game["headicon_axis"];
		self.headiconteam = "axis";
	}
}

//Function Number: 6
func_A117()
{
	var_00 = maps\mp\_utility::func_4529("scr_drawfriend",level.var_33D6);
	if(level.var_33D6 != var_00)
	{
		level.var_33D6 = var_00;
		func_A116();
	}
}

//Function Number: 7
func_A116()
{
	var_00 = level.players;
	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		var_02 = var_00[var_01];
		if(isdefined(var_02.pers["team"]) && var_02.pers["team"] != "spectator" && var_02.sessionstate == "playing")
		{
			if(level.var_33D6)
			{
				if(var_02.pers["team"] == "allies")
				{
					var_02.headicon = game["headicon_allies"];
					var_02.headiconteam = "allies";
				}
				else
				{
					var_02.headicon = game["headicon_axis"];
					var_02.headiconteam = "axis";
				}

				continue;
			}

			var_00 = level.players;
			for(var_01 = 0;var_01 < var_00.size;var_01++)
			{
				var_02 = var_00[var_01];
				if(isdefined(var_02.pers["team"]) && var_02.pers["team"] != "spectator" && var_02.sessionstate == "playing")
				{
					var_02.headicon = "";
				}
			}
		}
	}
}