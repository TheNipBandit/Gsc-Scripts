/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: maps\mp\mp_zombie_dig_02_lighting.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 4
 * Decompile Time: 1 ms
 * Timestamp: 5/5/2026 9:24:08 PM
*******************************************************************/

//Function Number: 1
main()
{
}

//Function Number: 2
onplayerspawned()
{
	for(;;)
	{
		level waittill("player_spawned",var_00);
		var_00 thread setplayerlightset();
	}
}

//Function Number: 3
setplayerlightset()
{
	wait(0.5);
	self vignettesetparams(0.65,1.7,1.2,1.2,0);
	self lightsetforplayer("mp_zombie_dig_02_bright");
}

//Function Number: 4
func_84F8()
{
	setdvar("2973",0);
	setdvar("2664",0);
	setdvar("1533",3);
	setdvar("2387",1);
	setdvar("5156",1);
	setdvar("2428","2");
	setdvar("4087","2");
	setdvar("5142",2);
	setdvar("3357",2);
}