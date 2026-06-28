/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: maps\mp\mp_zombie_island_trap_1.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 5
 * Decompile Time: 30 ms
 * Timestamp: 5/5/2026 9:00:04 PM
*******************************************************************/

//Function Number: 1
trap_1(param_00)
{
	if(isdefined(level.zmb_on_any_trap_activated))
	{
		[[ level.zmb_on_any_trap_activated ]]();
	}

	var_01 = common_scripts\utility::func_44BE(param_00.target,"targetname");
	foreach(var_03 in var_01)
	{
		var_03.var_9C92 = param_00;
		var_03.var_9CBB = param_00.script_noteworthy;
		if(!isdefined(var_03.script_noteworthy))
		{
			continue;
		}

		if(lib_0547::func_5565(var_03.script_noteworthy,"fx_trap"))
		{
			var_03 thread aud_play_spike_sound();
		}

		if(var_03.script_noteworthy == "spike_damage")
		{
			param_00 thread trap_trigger_watch(var_03);
			wait 0.05;
		}
	}
}

//Function Number: 2
aud_play_spike_sound()
{
	lib_0378::func_8D74("artillery_bunker_trap_spikes",self.origin);
}

//Function Number: 3
trap_trigger_watch(param_00)
{
	trap_1_damage_fx_watch(param_00);
}

//Function Number: 4
trap_1_damage_fx_watch(param_00)
{
	self endon("cooldown");
	self endon("no_power");
	self endon("ready");
	self endon("deactivate");
	var_01 = gettime();
	for(;;)
	{
		param_00 waittill("trigger",var_02);
		var_03 = (var_02.origin[0],var_02.origin[1],param_00.origin[2]);
		if(isplayer(var_02))
		{
			if(isdefined(param_00.var_8260) && param_00.var_8260 == "no_player_damage")
			{
				continue;
			}

			if(isdefined(var_02.var_66D3) && var_02.var_66D3 > gettime())
			{
				continue;
			}

			if(var_01 + 3000 > gettime())
			{
				continue;
			}

			var_02 dodamage(4,var_02.origin,undefined,undefined,"MOD_EXPLOSIVE","trap_zm_mp");
			continue;
		}

		if(isdefined(var_02.agentteam) && var_02.agentteam == level.var_746E)
		{
			if(isdefined(param_00.var_8260) && param_00.var_8260 == "no_player_damage")
			{
				continue;
			}

			if(isdefined(var_02.var_66D3) && var_02.var_66D3 > gettime())
			{
				continue;
			}

			if(var_01 + 3000 > gettime())
			{
				continue;
			}

			continue;
		}

		playfx(common_scripts\utility::func_44F5("zmb_isl_med_trap_gib_rnr"),var_02.origin);
		var_04 = var_02 modify_damage_to_island_zombie_types(5);
		var_02 dodamage(var_04,var_02.origin,param_00,param_00,"MOD_EXPLOSIVE","trap_zm_mp");
	}
}

//Function Number: 5
modify_damage_to_island_zombie_types(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = 1;
	}

	if(!isdefined(self.maxhealth))
	{
		return 0;
	}

	if(lib_0547::func_5565(self.var_A4B,"zombie_fireman") || lib_0547::func_5565(self.var_A4B,"zombie_assassin") || lib_0547::func_5565(self.var_A4B,"zombie_heavy"))
	{
		return int(self.maxhealth * 0.15 / param_00);
	}

	return self.health + 666;
}