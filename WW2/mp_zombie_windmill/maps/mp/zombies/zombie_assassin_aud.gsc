/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: maps\mp\zombies\zombie_assassin_aud.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 0 ms
 * Timestamp: 5/5/2026 9:24:30 PM
*******************************************************************/

//Function Number: 1
init_assassin_aud_state_info()
{
	self endon("death");
	wait 0.05;
	self.assassinaudioinformation = spawnstruct();
	self.assassinaudioinformation.players_near = [];
	self.assassinaudioinformation.players_far = [];
	self.assassinaudioinformation.isagressive = [];
	self.assassinaudioinformation.isrunningaway = [];
	childthread update_assassin_audio_info();
}

//Function Number: 2
update_assassin_audio_info()
{
	var_00 = 0.125;
	for(;;)
	{
		self.assassinaudioinformation.players_near = [];
		self.assassinaudioinformation.players_far = [];
		foreach(var_02 in level.players)
		{
			if(distance(self.origin,var_02.origin) > 700)
			{
				self.assassinaudioinformation.players_far = common_scripts\utility::func_F6F(self.assassinaudioinformation.players_far,var_02);
			}
			else
			{
				self.assassinaudioinformation.players_near = common_scripts\utility::func_F6F(self.assassinaudioinformation.players_near,var_02);
			}

			self.assassinaudioinformation.isagressive = common_scripts\utility::func_3794("zmb_assassin_is_alarmed");
			self.assassinaudioinformation.isrunningaway = common_scripts\utility::func_3794("Phase 4: EXITING");
		}

		wait(var_00);
	}
}