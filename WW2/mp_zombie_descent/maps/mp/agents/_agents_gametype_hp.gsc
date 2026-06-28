/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: maps\mp\agents\_agents_gametype_hp.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 5/5/2026 9:22:56 PM
*******************************************************************/

//Function Number: 1
main()
{
	func_87A7();
}

//Function Number: 2
func_87A7()
{
	level.var_A41["player"]["think"] = ::maps/mp/bots/_bots_gametype_hp::func_1A1A;
}