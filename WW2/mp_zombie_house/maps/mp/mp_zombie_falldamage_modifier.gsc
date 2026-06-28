/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: maps\mp\mp_zombie_falldamage_modifier.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 2
 * Decompile Time: 2 ms
 * Timestamp: 5/5/2026 9:13:20 PM
*******************************************************************/

//Function Number: 1
main()
{
	thread func_7D14();
}

//Function Number: 2
func_7D14()
{
	for(;;)
	{
		if(isdefined(level.players))
		{
			foreach(var_01 in level.players)
			{
				if(!var_01 maps\mp\_utility::_hasperk("specialty_falldamage"))
				{
					var_01 maps\mp\_utility::func_47A2("specialty_falldamage");
					var_01.var_3A0F = float(0);
				}
			}
		}

		wait(1);
	}
}