/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: 1403.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 4
 * Decompile Time: 1 ms
 * Timestamp: 5/5/2026 9:34:56 PM
*******************************************************************/

//Function Number: 1
init()
{
	level.var_1EB9 = 20;
	level.killstreakfuncs["zm_camouflage"] = ::func_9E3E;
}

//Function Number: 2
func_9E3E(param_00,param_01)
{
	thread func_73BA();
	return 1;
}

//Function Number: 3
func_73BA(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = level.var_1EB9;
	}

	var_01 = int(gettime() + param_00 * 1000);
	if(isdefined(self.var_2747) && self.var_2747)
	{
		var_02 = self getclientomnvar("ui_zm_camo");
		if(var_02 >= var_01)
		{
			return;
		}
	}

	self notify("playerCamouflageMode");
	if(!isdefined(self.var_2747))
	{
		self.var_2747 = 0;
	}

	self playlocalsound("zmb_ss_camo_use");
	self.var_2747++;
	lib_0547::func_8A6D(1);
	self setclientomnvar("ui_zm_camo",var_01);
	func_73BB(param_00);
	if(isdefined(self))
	{
		lib_0547::func_8A6D(0);
		self.var_2747--;
	}
}

//Function Number: 4
func_73BB(param_00)
{
	self endon("playerCamouflageMode");
	wait(param_00);
}