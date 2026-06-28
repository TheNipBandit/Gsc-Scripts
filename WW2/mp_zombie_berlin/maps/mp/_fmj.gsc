/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: maps\mp\_fmj.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 1
 * Decompile Time: 5 ms
 * Timestamp: 5/5/2026 9:12:58 PM
*******************************************************************/

//Function Number: 1
func_3D93()
{
	self endon("death");
	self endon("disconnect");
	self endon("faux_spawn");
	self.var_4B2D = 0;
	for(;;)
	{
		if(!self.var_4B2D)
		{
			if(maps\mp\_utility::_hasperk("specialty_bulletpenetration"))
			{
				maps\mp\_utility::func_735("specialty_bulletpenetration");
				if(!maps\mp\_utility::_hasperk("specialty_superbulletpenetration"))
				{
					maps\mp\_utility::func_735("specialty_armorpiercing");
				}
			}

			wait 0.05;
			continue;
		}

		if(!maps\mp\_utility::_hasperk("specialty_bulletpenetration"))
		{
			maps\mp\_utility::func_47A2("specialty_bulletpenetration");
			maps\mp\_utility::func_47A2("specialty_armorpiercing");
		}

		wait 0.05;
	}
}