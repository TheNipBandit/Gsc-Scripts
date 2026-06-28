/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: maps\mp\killstreaks\_molotovs.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 0 ms
 * Timestamp: 5/5/2026 9:34:34 PM
*******************************************************************/

//Function Number: 1
init()
{
	level.killstreakfuncs["molotovs"] = ::func_9E32;
	level.var_5A7D["killstreak_molotov_cocktail_mp"] = "molotovs";
	level.var_5A7D["killstreak_molotov_cocktail_grenadier_mp"] = "molotovs";
	level.var_5A7D["thermite_flames_mp"] = "molotovs";
}

//Function Number: 2
func_9E32(param_00)
{
	var_01 = func_9E33();
	return var_01;
}

//Function Number: 3
func_9E33()
{
	if(maps\mp\_utility::func_57A0(self))
	{
		maps\mp\_matchdata::func_5E9A("molotovs",self.origin);
		return 1;
	}

	return 0;
}