/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: maps\mp\_global_fx_code.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 1
 * Decompile Time: 0 ms
 * Timestamp: 5/5/2026 9:13:29 PM
*******************************************************************/

//Function Number: 1
func_47DC(param_00,param_01,param_02,param_03,param_04)
{
	var_05 = common_scripts\utility::func_46B7(param_00,"targetname");
	if(var_05.size <= 0)
	{
		return;
	}

	if(!isdefined(param_02))
	{
		param_02 = randomfloatrange(-20,-15);
	}

	if(!isdefined(param_03))
	{
		param_03 = param_01;
	}

	foreach(var_07 in var_05)
	{
		if(!isdefined(level.var_611))
		{
			level.var_611 = [];
		}

		if(!isdefined(level.var_611[param_03]))
		{
			level.var_611[param_03] = loadfx(param_01);
		}

		if(!isdefined(var_07.angles))
		{
			var_07.angles = (0,0,0);
		}

		var_08 = common_scripts\utility::func_281B(param_03);
		var_08.var_A265["origin"] = var_07.origin;
		var_08.var_A265["angles"] = var_07.angles;
		var_08.var_A265["fxid"] = param_03;
		var_08.var_A265["delay"] = param_02;
		if(isdefined(param_04))
		{
			var_08.var_A265["soundalias"] = param_04;
		}
	}
}