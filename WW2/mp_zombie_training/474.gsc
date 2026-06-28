/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: 474.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 5/5/2026 9:34:59 PM
*******************************************************************/

//Function Number: 1
main()
{
	wait(0);
	if(isdefined(self))
	{
		self delete();
	}
}

//Function Number: 2
func_0044()
{
	self endon("death");
	wait 0.05;
	self delete();
}