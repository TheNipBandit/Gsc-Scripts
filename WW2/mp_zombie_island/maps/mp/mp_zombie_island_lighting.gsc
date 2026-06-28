/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: maps\mp\mp_zombie_island_lighting.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 7
 * Decompile Time: 39 ms
 * Timestamp: 5/5/2026 9:00:02 PM
*******************************************************************/

//Function Number: 1
main()
{
	func_84F8();
	if(level.var_1D4 && getdvar("2695") != "true")
	{
		xbox_optimizations();
	}

	if(level.var_149 && getdvar("3957") != "true")
	{
		neo_optimizations();
	}

	level thread maps\mp\_utility::func_6F74(::onplayerspawned);
}

//Function Number: 2
onplayerspawned()
{
	var_00 = self;
	var_00 endon("disconnect");
	wait(0.5);
	var_00 vignettesetparams(0.25,1.7,1.2,1.2,0);
}

//Function Number: 3
func_84F8()
{
	setdvar("2973",0);
	setdvar("2664",0);
	setdvar("4230",500);
	setdvar("2387",1);
	setdvar("1578",3);
	setdvar("5156",1);
	setdvar("935",1);
	setdvar("2893",2);
}

//Function Number: 4
neo_optimizations()
{
	setdvar("1578",2);
}

//Function Number: 5
xbox_optimizations()
{
	setdvar("1578",0);
	setdvar("5156",0);
}

//Function Number: 6
main_off()
{
	var_00 = spawnstruct();
	var_00.transitiontime = 2;
	var_00.var_1103 = 1;
	var_00.var_1128 = (0.687426,0.828278,1);
	var_00.var_1108 = (0.826306,0.773848,0.422946);
	var_00.var_110A = 0.173616;
	var_00.var_1109 = 0.118084;
	var_00.var_1106 = 1;
	var_00.var_1105 = 0.472503;
	var_00.var_1110 = 19.5715;
	var_00.var_1107 = 67391.6;
	var_00.var_1126 = -1000;
	var_00.var_1102 = 2.45955;
	var_00.var_1112 = -19924;
	var_00.var_1111 = 1;
	var_00.var_1114 = 16.5631;
	var_00.var_1113 = 219.708;
	var_00.var_1127 = (0.629852,-0.752156,0.193774);
	var_00.var_110C = 1;
	var_00.var_110B = 554.428;
	var_00.var_110D = 140.001;
	var_00.var_110E = 596.118;
	var_00.var_110F = 0.646403;
	var_00.var_1104 = 1;
	var_00.var_10FF = 0;
	var_00.var_1100 = 1;
	var_00.var_1101 = 0;
	var_00.var_111F = 1;
	var_00.var_1115 = 3564.58;
	var_00.var_1116 = 12745.2;
	var_00.var_1117 = 69106.2;
	var_00.var_1120 = 69106.2;
	var_00.var_111C = 0.00404669;
	var_00.var_111D = 0.119998;
	var_00.var_111E = 0.753736;
	var_00.var_1122 = 0.9411;
	var_00.var_1125 = 0;
	var_00.var_1123 = (0,0,0);
	var_00.var_111B = 0;
	var_00.var_1124 = 0;
	var_00.var_1118 = 0;
	var_00.var_1119 = 0;
	var_00.var_111A = 0;
	var_00.var_1121 = 0;
	level.island_fog_off = var_00;
}

//Function Number: 7
main_on()
{
	var_00 = spawnstruct();
	var_00.transitiontime = 2;
	var_00.var_1103 = 1;
	var_00.var_1128 = (0.859647,0.926756,1);
	var_00.var_1108 = (0.754224,0.754224,0.754224);
	var_00.var_110A = 0.3258;
	var_00.var_1109 = 0.592218;
	var_00.var_1106 = 1;
	var_00.var_1105 = 0.472503;
	var_00.var_1110 = 18.363;
	var_00.var_1107 = 127780;
	var_00.var_1126 = 176.675;
	var_00.var_1102 = 2.45955;
	var_00.var_1112 = 70760;
	var_00.var_1111 = 1;
	var_00.var_1114 = 40.7579;
	var_00.var_1113 = 425.773;
	var_00.var_1127 = (0.629852,-0.752156,0.193774);
	var_00.var_110C = 1;
	var_00.var_110B = 5413.97;
	var_00.var_110D = 416.519;
	var_00.var_110E = 1860.54;
	var_00.var_110F = 0.307481;
	var_00.var_1104 = 1;
	var_00.var_10FF = 0;
	var_00.var_1100 = 1;
	var_00.var_1101 = 0;
	var_00.var_111F = 1;
	var_00.var_1115 = 2049.48;
	var_00.var_1116 = 12167.7;
	var_00.var_1117 = 30606.5;
	var_00.var_1120 = 0;
	var_00.var_111C = 0.0992995;
	var_00.var_111D = 0.707615;
	var_00.var_111E = 1;
	var_00.var_1122 = 1;
	var_00.var_1125 = 0;
	var_00.var_1123 = (0,0,0);
	var_00.var_111B = 0;
	var_00.var_1124 = 0;
	var_00.var_1118 = 0;
	var_00.var_1119 = 0;
	var_00.var_111A = 0;
	var_00.var_1121 = 0;
	level.island_fog_on = var_00;
}