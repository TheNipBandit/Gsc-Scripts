/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: maps\mp\agents\_agents_gametype_sd.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 0 ms
 * Timestamp: 5/5/2026 9:23:21 PM
*******************************************************************/

//Function Number: 1
main()
{
	func_87A7();
}

//Function Number: 2
func_87A7()
{
	level.var_A41["player"]["think"] = ::func_0A46;
}

//Function Number: 3
func_0A46()
{
	common_scripts\utility::func_615();
	foreach(var_01 in level.var_1913)
	{
		var_01.var_9D65 enableplayeruse(self);
	}

	thread maps/mp/bots/_bots_gametype_sd::func_1AC0();
}