/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: maps\mp\bots\_bots_gametype_scorestreak_training.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 0 ms
 * Timestamp: 5/5/2026 9:33:39 PM
*******************************************************************/

//Function Number: 1
main()
{
	func_87A7();
}

//Function Number: 2
func_87A7()
{
	level.var_19D5["gametype_think"] = ::func_1ABC;
}

//Function Number: 3
func_1ABC()
{
	self notify("bot_scorestreak_training_think");
	self endon("bot_scorestreak_training_think");
	self endon("death");
	self endon("disconnect");
	level endon("game_ended");
	self endon("owner_disconnect");
	for(;;)
	{
		self [[ self.var_6F7F ]]();
		wait 0.05;
	}
}