/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: 1334.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 0 ms
 * Timestamp: 5/5/2026 9:25:07 PM
*******************************************************************/

//Function Number: 1
init()
{
	self.var_4BA2 = 0;
}

//Function Number: 2
func_3662()
{
	maps\mp\_utility::func_47A2("specialty_personaluav");
	maps\mp\_utility::func_47A2("specialty_spygame");
	maps\mp\_utility::func_47A2("specialty_coldblooded");
	maps\mp\_utility::func_47A2("specialty_heartbreaker");
	maps\mp\_utility::func_47A2("specialty_undercover");
	self.var_267E = maps\mp\gametypes\_class::func_1F95(1);
	maps\mp\gametypes\_class::func_21B9();
	maps\mp\gametypes\_teams::func_73CA();
	self.var_4BA2 = 1;
}

//Function Number: 3
func_2F9E()
{
	maps\mp\_utility::func_735("specialty_coldblooded");
	maps\mp\_utility::func_735("specialty_spygame");
	maps\mp\_utility::func_735("specialty_heartbreaker");
	maps\mp\_utility::func_735("specialty_personaluav");
	maps\mp\_utility::func_735("specialty_undercover");
	self.var_267E = maps\mp\gametypes\_class::func_1F95(1);
	maps\mp\gametypes\_class::func_21B9();
	maps\mp\gametypes\_teams::func_73CA();
	self.var_4BA2 = 0;
}