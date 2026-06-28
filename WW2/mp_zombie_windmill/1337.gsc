/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: 1337.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 4
 * Decompile Time: 2 ms
 * Timestamp: 5/5/2026 9:25:50 PM
*******************************************************************/

//Function Number: 1
init()
{
}

//Function Number: 2
func_3662()
{
	maps\mp\zombies\_zombies_roles::func_6AB2("role_ability_melee_frenzy_zm");
	self.var_60E8 = 1;
	lib_0547::func_7ACD();
}

//Function Number: 3
func_2F9E()
{
	if(common_scripts\utility::func_562E(self.var_60E8))
	{
		self.var_60E8 = undefined;
		lib_0547::func_7ACD();
	}
}

//Function Number: 4
func_62A6(param_00,param_01,param_02)
{
	var_03 = param_00;
	if(isdefined(param_02) && maps\mp\_utility::ismeleemod(param_02) && isdefined(param_01.var_60E8))
	{
		switch(self.var_A4B)
		{
			case "zombie_berserker":
			case "zombie_generic":
			case "zombie_exploder":
				var_03 = self.health + 1;
				break;

			default:
				var_03 = var_03 + 1500;
				break;
		}
	}

	return var_03;
}