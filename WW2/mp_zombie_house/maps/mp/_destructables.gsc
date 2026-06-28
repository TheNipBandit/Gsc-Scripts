/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: maps\mp\_destructables.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 7
 * Decompile Time: 1 ms
 * Timestamp: 5/5/2026 9:13:26 PM
*******************************************************************/

//Function Number: 1
init()
{
	var_00 = getentarray("destructable","targetname");
	if(getdvar("scr_destructables") == "0")
	{
		for(var_01 = 0;var_01 < var_00.size;var_01++)
		{
			var_00[var_01] delete();
		}

		return;
	}

	for(var_01 = 0;var_01 < var_00.size;var_01++)
	{
		var_00[var_01] thread func_2DE1();
	}
}

//Function Number: 2
func_2DE1()
{
	var_00 = 40;
	var_01 = 0;
	if(isdefined(self.var_80F8))
	{
		var_00 = self.var_80F8;
	}

	if(isdefined(self.var_82B7))
	{
		var_01 = self.var_82B7;
	}

	if(isdefined(self.var_8162))
	{
		var_02 = strtok(self.var_8162," ");
		for(var_03 = 0;var_03 < var_02.size;var_03++)
		{
			func_17D7(var_02[var_03]);
		}
	}

	if(isdefined(self.var_81BB))
	{
		self.var_3F2F = loadfx(self.var_81BB);
	}

	var_04 = 0;
	self setcandamage(1);
	for(;;)
	{
		self waittill("damage",var_05,var_06);
		if(var_05 >= var_01)
		{
			var_04 = var_04 + var_05;
			if(var_04 >= var_00)
			{
				thread func_2DE0();
				return;
			}
		}
	}
}

//Function Number: 3
func_2DE0()
{
	var_00 = self;
	if(isdefined(self.var_8162))
	{
		var_01 = strtok(self.var_8162," ");
		for(var_02 = 0;var_02 < var_01.size;var_02++)
		{
			func_A017(var_01[var_02]);
		}
	}

	if(isdefined(var_00.var_3F2F))
	{
		playfx(var_00.var_3F2F,var_00.origin + (0,0,6));
	}

	var_00 delete();
}

//Function Number: 4
func_17D7(param_00)
{
}

//Function Number: 5
func_17E0(param_00,param_01)
{
}

//Function Number: 6
func_A017(param_00)
{
}

//Function Number: 7
func_A018(param_00,param_01)
{
}