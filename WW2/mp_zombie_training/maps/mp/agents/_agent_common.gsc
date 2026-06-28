/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: maps\mp\agents\_agent_common.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 10
 * Decompile Time: 0 ms
 * Timestamp: 5/5/2026 9:33:24 PM
*******************************************************************/

//Function Number: 1
func_003D()
{
	maps/mp/agents/_agent_utility::func_5291();
	var_00 = "axis";
	if(level.var_687D % 2 == 0)
	{
		var_00 = "allies";
	}

	level.var_687D++;
	maps/mp/agents/_agent_utility::func_83FE(var_00);
	level.var_A4E[level.var_A4E.size] = self;
}

//Function Number: 2
func_003E(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A)
{
	param_01 = maps\mp\_utility::_validateattacker(param_01);
	self [[ maps/mp/agents/_agent_utility::func_A59("on_damaged") ]](param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08,param_09,param_0A);
}

//Function Number: 3
func_003F(param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08)
{
	param_01 = maps\mp\_utility::_validateattacker(param_01);
	maps/mp/agents/_agent_utility::cleanupentsonagentdeath();
	self thread [[ maps/mp/agents/_agent_utility::func_A59("on_killed") ]](param_00,param_01,param_02,param_03,param_04,param_05,param_06,param_07,param_08);
}

//Function Number: 4
init()
{
	func_5290();
	level thread func_08F8();
}

//Function Number: 5
func_2581(param_00,param_01,param_02,param_03)
{
	if(isdefined(param_00))
	{
		param_00.var_2589 = gettime();
		if(isdefined(param_02))
		{
			param_00 maps/mp/agents/_agent_utility::func_83FE(param_02);
		}
		else
		{
			param_00 maps/mp/agents/_agent_utility::func_83FE(param_00.team);
		}

		if(isdefined(param_03))
		{
			param_00.var_231C = param_03;
		}

		if(isdefined(self.target))
		{
			param_00.var_90AA = self.target;
		}

		if(isdefined(level.var_A41[param_01]) && isdefined(level.var_A41[param_01]["onAIConnect"]))
		{
			param_00 [[ param_00 maps/mp/agents/_agent_utility::func_A59("onAIConnect") ]]();
		}

		addtocharactersarray(param_00);
	}

	return param_00;
}

//Function Number: 6
func_2586(param_00,param_01,param_02)
{
	var_03 = maps/mp/agents/_agent_utility::func_44EE(param_00);
	return func_2581(var_03,param_00,param_01,param_02);
}

//Function Number: 7
func_2588(param_00,param_01,param_02,param_03)
{
	maps/mp/agents/_agent_utility::func_5344(param_00,param_01);
	return func_2581(param_00,param_01,param_02,param_03);
}

//Function Number: 8
func_5290()
{
	level.var_A4E = [];
	level.var_687D = 0;
}

//Function Number: 9
func_08F8()
{
	level endon("game_ended");
	level waittill("connected",var_00);
	var_01 = maps/mp/agents/_agent_utility::get_max_agents();
	while(level.var_A4E.size < var_01)
	{
		var_02 = addagent();
		if(!isdefined(var_02))
		{
			wait 0.05;
			continue;
		}
	}
}

//Function Number: 10
func_83FD(param_00)
{
	self.agenthealth = param_00;
	self.health = param_00;
	self.maxhealth = param_00;
}