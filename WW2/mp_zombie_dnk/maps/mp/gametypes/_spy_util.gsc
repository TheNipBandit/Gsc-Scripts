/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: maps\mp\gametypes\_spy_util.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 1 ms
 * Timestamp: 5/5/2026 9:23:44 PM
*******************************************************************/

//Function Number: 1
spyclasstostring(param_00)
{
	if(!isdefined(param_00))
	{
		return "<undefined>";
	}

	switch(param_00)
	{
		case 0:
			return "civilian";

		case 1:
			return "detective";

		case 2:
			return "traitor";

		case 16777215:
			return "none";

		default:
			return "unknown";
	}
}

//Function Number: 2
spyclasstolocstring(param_00)
{
	if(!isdefined(param_00))
	{
		return "<undefined>";
	}

	switch(param_00)
	{
		case 0:
			return &"MP_SPY_CLASS_CIVILIAN";

		case 1:
			return &"MP_SPY_DETECTIVE";

		case 2:
			return &"MP_SPY_CLASS_TRAITOR";

		case 16777215:
			return "none";

		default:
			return "unknown";
	}
}

//Function Number: 3
spyclassfriendlycheck(param_00,param_01)
{
	if(param_00 == 0 || param_00 == 1)
	{
		return param_01 == 0 || param_01 == 1;
	}

	return param_01 == 2;
}