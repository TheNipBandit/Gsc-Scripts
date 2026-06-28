/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: maps\mp\gametypes\_playercards.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 3 ms
 * Timestamp: 5/5/2026 9:24:50 PM
*******************************************************************/

//Function Number: 1
init()
{
	level thread onplayerconnect();
}

//Function Number: 2
onplayerconnect()
{
	for(;;)
	{
		level waittill("connected",var_00);
		if(!isai(var_00))
		{
		}
	}
}