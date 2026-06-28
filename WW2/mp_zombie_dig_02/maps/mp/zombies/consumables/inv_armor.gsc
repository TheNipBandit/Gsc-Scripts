/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: maps\mp\zombies\consumables\inv_armor.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 4
 * Decompile Time: 4 ms
 * Timestamp: 5/5/2026 9:23:49 PM
*******************************************************************/

//Function Number: 1
func_52A4()
{
	lib_0561::initconsumablesfromtable("armor",::usearmor,::canusearmor,::getarmorcharges);
}

//Function Number: 2
canusearmor(param_00)
{
	var_01 = self;
	if(!lib_0561::func_1F7B())
	{
		return 0;
	}

	if(var_01 lib_056A::func_4B53())
	{
		return 0;
	}

	return 1;
}

//Function Number: 3
usearmor(param_00)
{
	foreach(var_02 in level.players)
	{
		var_02 lib_056A::func_4775();
		var_02 thread maps\mp\gametypes\_hud_message::func_9102("zm_shattered_maxarmor_splash");
	}
}

//Function Number: 4
getarmorcharges(param_00)
{
	if(!isdefined(param_00))
	{
		param_00 = "";
	}

	switch(param_00)
	{
		case "epic":
			return 4;

		case "legendary":
			return 3;

		case "rare":
			return 2;

		case "common":
			return 1;

		default:
			return 0;
	}
}