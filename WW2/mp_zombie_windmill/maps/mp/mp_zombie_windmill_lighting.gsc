/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: maps\mp\mp_zombie_windmill_lighting.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 4
 * Decompile Time: 0 ms
 * Timestamp: 5/5/2026 9:24:37 PM
*******************************************************************/

//Function Number: 1
main()
{
	func_84F8();
	level thread maps\mp\_utility::func_6F74(::onplayerspawned);
	var_00 = function_021F("auto62","targetname");
	foreach(var_02 in var_00)
	{
		var_02 setscriptablepartstate("lightpart","off");
	}

	if(level.var_1D4 && getdvar("2695") != "true")
	{
		xbox_optimizations();
	}
}

//Function Number: 2
func_84F8()
{
	setdvar("2973",0);
	setdvar("2664",1);
	setdvar("r_sunShadowScale",1);
	setdvar("5153",1);
}

//Function Number: 3
onplayerspawned()
{
	var_00 = self;
	var_00 endon("disconnect");
	wait(1.5);
	var_00 vignettesetparams(0.85,0.25,1,1,0);
}

//Function Number: 4
xbox_optimizations()
{
	setdvar("r_sunShadowScale",0.7);
	setdvar("r_sunSampleSizeNear",0.25);
	setdvar("5153",0);
}