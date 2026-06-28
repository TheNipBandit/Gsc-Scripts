/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: maps\mp\mp_zombie_island_cart_aud.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 13
 * Decompile Time: 76 ms
 * Timestamp: 5/5/2026 8:59:58 PM
*******************************************************************/

//Function Number: 1
cart_begin_leave(param_00)
{
}

//Function Number: 2
cart_finish_leave(param_00)
{
}

//Function Number: 3
cart_begin_roundabout(param_00)
{
}

//Function Number: 4
cart_finish_roundabout(param_00)
{
}

//Function Number: 5
cart_begin_arrival(param_00)
{
}

//Function Number: 6
cart_finish_arrival(param_00)
{
}

//Function Number: 7
gate_closing(param_00)
{
}

//Function Number: 8
gate_closed(param_00)
{
}

//Function Number: 9
gate_opening(param_00)
{
}

//Function Number: 10
gate_opened(param_00)
{
}

//Function Number: 11
lever_toggle_start(param_00,param_01)
{
}

//Function Number: 12
lever_toggle_end(param_00,param_01)
{
}

//Function Number: 13
play_transport_aud(param_00,param_01)
{
	switch(param_00)
	{
		case 0:
			thread cart_begin_leave(self);
			break;

		case 1:
			thread cart_begin_roundabout(self);
			break;

		case 2:
			thread cart_begin_arrival(self);
			break;
	}

	wait(param_01);
	switch(param_00)
	{
		case 0:
			thread cart_finish_leave(self);
			break;

		case 1:
			thread cart_finish_roundabout(self);
			break;

		case 2:
			thread cart_finish_arrival(self);
			break;
	}
}