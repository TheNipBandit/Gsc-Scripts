/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: common_scripts\_exploder.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 37
 * Decompile Time: 183 ms
 * Timestamp: 5/5/2026 9:25:58 PM
*******************************************************************/

//Function Number: 1
func_44D1(param_00)
{
	param_00 = param_00 + "";
	if(isdefined(level.var_2807))
	{
		return level.var_2807[param_00];
	}

	var_01 = [];
	foreach(var_03 in level.var_2804)
	{
		if(!isdefined(var_03))
		{
			continue;
		}

		if(var_03.var_A265["type"] != "exploder")
		{
			continue;
		}

		if(!isdefined(var_03.var_A265["exploder"]))
		{
			continue;
		}

		if(var_03.var_A265["exploder"] == param_00)
		{
			var_01[var_01.size] = var_03;
		}
	}

	return var_01;
}

//Function Number: 2
func_885C(param_00)
{
	var_01 = param_00.var_8186;
	if(!isdefined(level.var_3948[var_01]))
	{
		level.var_3948[var_01] = [];
	}

	var_02 = param_00.targetname;
	if(!isdefined(var_02))
	{
		var_02 = "";
	}

	level.var_3948[var_01][level.var_3948[var_01].size] = param_00;
	if(func_393B(param_00))
	{
		param_00 hide();
		return;
	}

	if(func_393A(param_00))
	{
		param_00 hide();
		param_00 notsolid();
		if(isdefined(param_00.spawnflags) && param_00.spawnflags & 1)
		{
			if(isdefined(param_00.var_8166))
			{
				param_00 method_8060();
			}
		}

		return;
	}

	if(func_3939(param_00))
	{
		param_00 hide();
		param_00 notsolid();
		if(isdefined(param_00.spawnflags) && param_00.spawnflags & 1)
		{
			param_00 method_8060();
		}
	}
}

//Function Number: 3
func_8A1A()
{
	level.var_3948 = [];
	var_00 = getentarray("script_brushmodel","classname");
	var_01 = getentarray("script_model","classname");
	for(var_02 = 0;var_02 < var_01.size;var_02++)
	{
		var_00[var_00.size] = var_01[var_02];
	}

	foreach(var_04 in var_00)
	{
		if(isdefined(var_04.var_8272))
		{
			var_04.var_8186 = var_04.var_8272;
		}

		if(isdefined(var_04.var_6019))
		{
			continue;
		}

		if(isdefined(var_04.var_8186))
		{
			func_885C(var_04);
		}
	}

	var_06 = [];
	var_07 = getentarray("script_brushmodel","classname");
	for(var_02 = 0;var_02 < var_07.size;var_02++)
	{
		if(isdefined(var_07[var_02].var_8272))
		{
			var_07[var_02].var_8186 = var_07[var_02].var_8272;
		}

		if(isdefined(var_07[var_02].var_8186))
		{
			var_06[var_06.size] = var_07[var_02];
		}
	}

	var_07 = getentarray("script_model","classname");
	for(var_02 = 0;var_02 < var_07.size;var_02++)
	{
		if(isdefined(var_07[var_02].var_8272))
		{
			var_07[var_02].var_8186 = var_07[var_02].var_8272;
		}

		if(isdefined(var_07[var_02].var_8186))
		{
			var_06[var_06.size] = var_07[var_02];
		}
	}

	var_07 = getentarray("script_origin","classname");
	for(var_02 = 0;var_02 < var_07.size;var_02++)
	{
		if(isdefined(var_07[var_02].var_8272))
		{
			var_07[var_02].var_8186 = var_07[var_02].var_8272;
		}

		if(isdefined(var_07[var_02].var_8186))
		{
			var_06[var_06.size] = var_07[var_02];
		}
	}

	var_07 = getentarray("item_health","classname");
	for(var_02 = 0;var_02 < var_07.size;var_02++)
	{
		if(isdefined(var_07[var_02].var_8272))
		{
			var_07[var_02].var_8186 = var_07[var_02].var_8272;
		}

		if(isdefined(var_07[var_02].var_8186))
		{
			var_06[var_06.size] = var_07[var_02];
		}
	}

	var_07 = level.var_9478;
	for(var_02 = 0;var_02 < var_07.size;var_02++)
	{
		if(!isdefined(var_07[var_02]))
		{
			continue;
		}

		if(isdefined(var_07[var_02].var_8272))
		{
			var_07[var_02].var_8186 = var_07[var_02].var_8272;
		}

		if(isdefined(var_07[var_02].var_8186))
		{
			if(!isdefined(var_07[var_02].angles))
			{
				var_07[var_02].angles = (0,0,0);
			}

			var_06[var_06.size] = var_07[var_02];
		}
	}

	if(!isdefined(level.var_2804))
	{
		level.var_2804 = [];
	}

	var_08 = [];
	var_08["exploderchunk visible"] = 1;
	var_08["exploderchunk"] = 1;
	var_08["exploder"] = 1;
	thread func_8825();
	for(var_02 = 0;var_02 < var_06.size;var_02++)
	{
		var_09 = var_06[var_02];
		var_04 = common_scripts\utility::func_27E7(var_09.var_81BB);
		var_04.var_A265 = [];
		var_04.var_A265["origin"] = var_09.origin;
		var_04.var_A265["angles"] = var_09.angles;
		var_04.var_A265["delay"] = var_09.var_161;
		var_04.var_A265["delay_post"] = var_09.var_8155;
		var_04.var_A265["firefx"] = var_09.var_8193;
		var_04.var_A265["firefxdelay"] = var_09.var_8194;
		var_04.var_A265["firefxsound"] = var_09.var_8195;
		var_04.var_A265["firefxtimeout"] = var_09.var_8196;
		var_04.var_A265["earthquake"] = var_09.var_817B;
		var_04.var_A265["rumble"] = var_09.var_827D;
		var_04.var_A265["damage"] = var_09.var_8146;
		var_04.var_A265["damage_radius"] = var_09.var_8276;
		var_04.var_A265["soundalias"] = var_09.var_828B;
		var_04.var_A265["repeat"] = var_09.var_8278;
		var_04.var_A265["delay_min"] = var_09.var_8154;
		var_04.var_A265["delay_max"] = var_09.var_8153;
		var_04.var_A265["target"] = var_09.target;
		var_04.var_A265["ender"] = var_09.var_817E;
		var_04.var_A265["physics"] = var_09.var_8269;
		var_04.var_A265["type"] = "exploder";
		if(!isdefined(var_09.var_81BB))
		{
			var_04.var_A265["fxid"] = "No FX";
		}
		else
		{
			var_04.var_A265["fxid"] = var_09.var_81BB;
		}

		var_04.var_A265["exploder"] = var_09.var_8186;
		if(isdefined(level.var_2807))
		{
			var_0A = level.var_2807[var_04.var_A265["exploder"]];
			if(!isdefined(var_0A))
			{
				var_0A = [];
			}

			var_0A[var_0A.size] = var_04;
			level.var_2807[var_04.var_A265["exploder"]] = var_0A;
		}

		if(!isdefined(var_04.var_A265["delay"]))
		{
			var_04.var_A265["delay"] = 0;
		}

		if(isdefined(var_09.target))
		{
			var_0B = getentarray(var_04.var_A265["target"],"targetname")[0];
			if(isdefined(var_0B))
			{
				var_0C = var_0B.origin;
				var_04.var_A265["angles"] = vectortoangles(var_0C - var_04.var_A265["origin"]);
			}
			else
			{
				var_0B = common_scripts\utility::func_4375(var_04.var_A265["target"]);
				if(isdefined(var_0B))
				{
					var_0C = var_0B.origin;
					var_04.var_A265["angles"] = vectortoangles(var_0C - var_04.var_A265["origin"]);
				}
			}
		}

		if(!isdefined(var_09.code_classname))
		{
			var_04.model = var_09;
			if(isdefined(var_04.model.var_8205))
			{
				precachemodel(var_04.model.var_8205);
			}
		}
		else if(var_09.code_classname == "script_brushmodel" || isdefined(var_09.model))
		{
			var_04.model = var_09;
			var_04.model.var_2FBF = var_09.var_8166;
		}

		if(isdefined(var_09.targetname) && isdefined(var_08[var_09.targetname]))
		{
			var_04.var_A265["exploder_type"] = var_09.targetname;
		}
		else
		{
			var_04.var_A265["exploder_type"] = "normal";
		}

		if(isdefined(var_09.var_6019))
		{
			var_04.var_A265["masked_exploder"] = var_09.model;
			var_04.var_A265["masked_exploder_spawnflags"] = var_09.spawnflags;
			var_04.var_A265["masked_exploder_script_disconnectpaths"] = var_09.var_8166;
			var_09 delete();
		}

		var_04 common_scripts\_createfx::func_75BE();
	}
}

//Function Number: 4
func_8825()
{
	waittillframeend;
	waittillframeend;
	waittillframeend;
	var_00 = [];
	foreach(var_02 in level.var_2804)
	{
		if(var_02.var_A265["type"] != "exploder")
		{
			continue;
		}

		var_03 = var_02.var_A265["flag"];
		if(!isdefined(var_03))
		{
			continue;
		}

		if(var_03 == "nil")
		{
			var_02.var_A265["flag"] = undefined;
		}

		var_00[var_03] = 1;
	}

	foreach(var_07, var_06 in var_00)
	{
		thread func_3933(var_07);
	}
}

//Function Number: 5
func_3933(param_00)
{
	if(!common_scripts\utility::func_3C83(param_00))
	{
		common_scripts\utility::func_3C87(param_00);
	}

	common_scripts\utility::func_3C9F(param_00);
	foreach(var_02 in level.var_2804)
	{
		if(var_02.var_A265["type"] != "exploder")
		{
			continue;
		}

		var_03 = var_02.var_A265["flag"];
		if(!isdefined(var_03))
		{
			continue;
		}

		if(var_03 != param_00)
		{
			continue;
		}

		var_02 common_scripts\utility::func_894();
	}
}

//Function Number: 6
func_393A(param_00)
{
	return isdefined(param_00.targetname) && param_00.targetname == "exploder";
}

//Function Number: 7
func_393B(param_00)
{
	return param_00.model == "fx" && !isdefined(param_00.targetname) || param_00.targetname != "exploderchunk";
}

//Function Number: 8
func_3939(param_00)
{
	return isdefined(param_00.targetname) && param_00.targetname == "exploderchunk";
}

//Function Number: 9
func_8BCA(param_00)
{
	param_00 = param_00 + "";
	if(isdefined(level.var_2807))
	{
		var_01 = level.var_2807[param_00];
		if(isdefined(var_01))
		{
			foreach(var_03 in var_01)
			{
				if(!func_393B(var_03.model) && !func_393A(var_03.model) && !func_3939(var_03.model))
				{
					var_03.model show();
				}

				if(isdefined(var_03.var_1CB4))
				{
					var_03.model show();
				}
			}

			return;
		}

		return;
	}

	var_05 = 0;
	while(var_03 < level.var_2804.size)
	{
		var_05 = level.var_2804[var_03];
		if(!isdefined(var_05))
		{
			continue;
		}

		if(var_05.var_A265["type"] != "exploder")
		{
			continue;
		}

		if(!isdefined(var_05.var_A265["exploder"]))
		{
			continue;
		}

		if(var_05.var_A265["exploder"] + "" != var_02)
		{
			continue;
		}

		if(isdefined(var_05.model))
		{
			if(!func_393B(var_05.model) && !func_393A(var_05.model) && !func_3939(var_05.model))
			{
				var_05.model show();
			}

			if(isdefined(var_05.var_1CB4))
			{
				var_05.model show();
			}
		}

		var_03++;
	}
}

//Function Number: 10
func_93C8(param_00)
{
	param_00 = param_00 + "";
	if(isdefined(level.var_2807))
	{
		var_01 = level.var_2807[param_00];
		if(isdefined(var_01))
		{
			foreach(var_03 in var_01)
			{
				if(!isdefined(var_03.var_5EED))
				{
					continue;
				}

				var_03.var_5EED delete();
			}

			return;
		}

		return;
	}

	var_05 = 0;
	while(var_03 < level.var_2804.size)
	{
		var_05 = level.var_2804[var_03];
		if(!isdefined(var_05))
		{
			continue;
		}

		if(var_05.var_A265["type"] != "exploder")
		{
			continue;
		}

		if(!isdefined(var_05.var_A265["exploder"]))
		{
			continue;
		}

		if(var_05.var_A265["exploder"] + "" != var_02)
		{
			continue;
		}

		if(!isdefined(var_05.var_5EED))
		{
			continue;
		}

		var_05.var_5EED delete();
		var_03++;
	}
}

//Function Number: 11
func_417F(param_00)
{
	param_00 = param_00 + "";
	var_01 = [];
	if(isdefined(level.var_2807))
	{
		var_02 = level.var_2807[param_00];
		if(isdefined(var_02))
		{
			var_01 = var_02;
		}
	}
	else
	{
		foreach(var_04 in level.var_2804)
		{
			if(var_04.var_A265["type"] != "exploder")
			{
				continue;
			}

			if(!isdefined(var_04.var_A265["exploder"]))
			{
				continue;
			}

			if(var_04.var_A265["exploder"] + "" != param_00)
			{
				continue;
			}

			var_01[var_01.size] = var_04;
		}
	}

	return var_01;
}

//Function Number: 12
func_4CE3(param_00)
{
	param_00 = param_00 + "";
	if(isdefined(level.var_2807))
	{
		var_01 = level.var_2807[param_00];
		if(isdefined(var_01))
		{
			foreach(var_03 in var_01)
			{
				if(isdefined(var_03.model))
				{
					var_03.model hide();
				}
			}

			return;
		}

		return;
	}

	var_05 = 0;
	while(var_03 < level.var_2804.size)
	{
		var_05 = level.var_2804[var_03];
		if(!isdefined(var_05))
		{
			continue;
		}

		if(var_05.var_A265["type"] != "exploder")
		{
			continue;
		}

		if(!isdefined(var_05.var_A265["exploder"]))
		{
			continue;
		}

		if(var_05.var_A265["exploder"] + "" != var_02)
		{
			continue;
		}

		if(isdefined(var_05.model))
		{
			var_05.model hide();
		}

		var_03++;
	}
}

//Function Number: 13
func_2D0D(param_00)
{
	param_00 = param_00 + "";
	if(isdefined(level.var_2807))
	{
		var_01 = level.var_2807[param_00];
		if(isdefined(var_01))
		{
			foreach(var_03 in var_01)
			{
				if(isdefined(var_03.model))
				{
					var_03.model delete();
				}
			}
		}
	}
	else
	{
		for(var_05 = 0;var_05 < level.var_2804.size;var_05++)
		{
			var_03 = level.var_2804[var_05];
			if(!isdefined(var_03))
			{
				continue;
			}

			if(var_03.var_A265["type"] != "exploder")
			{
				continue;
			}

			if(!isdefined(var_03.var_A265["exploder"]))
			{
				continue;
			}

			if(var_03.var_A265["exploder"] + "" != param_00)
			{
				continue;
			}

			if(isdefined(var_03.model))
			{
				var_03.model delete();
			}
		}
	}

	level notify("killexplodertridgers" + param_00);
}

//Function Number: 14
func_392F()
{
	if(isdefined(self.var_A265["delay"]))
	{
		var_00 = self.var_A265["delay"];
	}
	else
	{
		var_00 = 0;
	}

	if(isdefined(self.var_A265["damage_radius"]))
	{
		var_01 = self.var_A265["damage_radius"];
	}
	else
	{
		var_01 = 128;
	}

	var_02 = self.var_A265["damage"];
	var_03 = self.var_A265["origin"];
	wait(var_00);
	if(isdefined(level.var_2971))
	{
		[[ level.var_2971 ]](var_03,var_01,var_02);
		return;
	}

	radiusdamage(var_03,var_01,var_02,var_02);
}

//Function Number: 15
func_0895()
{
	if(isdefined(self.var_A265["firefx"]))
	{
		thread func_3BB8();
	}

	if(isdefined(self.var_A265["fxid"]) && self.var_A265["fxid"] != "No FX")
	{
		thread func_1F5E();
	}

	if(isdefined(self.var_A265["soundalias"]) && self.var_A265["soundalias"] != "nil")
	{
		thread func_8F30();
	}

	if(isdefined(self.var_A265["loopsound"]) && self.var_A265["loopsound"] != "nil")
	{
		thread func_359F();
	}

	if(isdefined(self.var_A265["damage"]))
	{
		thread func_392F();
	}

	if(isdefined(self.var_A265["earthquake"]))
	{
		thread func_3931();
	}

	if(isdefined(self.var_A265["rumble"]))
	{
		thread func_393F();
	}

	if(self.var_A265["exploder_type"] == "exploder")
	{
		thread func_1CB3();
		return;
	}

	if(self.var_A265["exploder_type"] == "exploderchunk" || self.var_A265["exploder_type"] == "exploderchunk visible")
	{
		thread func_1CB5();
		return;
	}

	thread func_1CB2();
}

//Function Number: 16
func_1CB2()
{
	var_00 = self.var_A265["exploder"];
	if(isdefined(self.var_A265["delay"]) && self.var_A265["delay"] >= 0)
	{
		wait(self.var_A265["delay"]);
	}
	else
	{
		wait 0.05;
	}

	if(!isdefined(self.model))
	{
		return;
	}

	if(isdefined(self.model.classname))
	{
		if(common_scripts\utility::func_57D7() && self.model.spawnflags & 1)
		{
			self.model [[ level.var_2587 ]]();
		}
	}

	if(level.var_27F6)
	{
		if(isdefined(self.var_3928))
		{
			return;
		}

		self.var_3928 = 1;
		self.model hide();
		self.model notsolid();
		wait(3);
		self.var_3928 = undefined;
		self.model show();
		self.model solid();
		return;
	}

	if(!isdefined(self.var_A265["fxid"]) || self.var_A265["fxid"] == "No FX")
	{
		self.var_A265["exploder"] = undefined;
	}

	waittillframeend;
	if(isdefined(self.model) && isdefined(self.model.classname))
	{
		self.model delete();
	}
}

//Function Number: 17
func_1CB5()
{
	if(isdefined(self.var_A265["delay"]))
	{
		wait(self.var_A265["delay"]);
	}

	var_00 = undefined;
	if(isdefined(self.var_A265["target"]))
	{
		var_00 = common_scripts\utility::func_4375(self.var_A265["target"]);
	}

	if(!isdefined(var_00))
	{
		self.model delete();
		return;
	}

	self.model show();
	if(isdefined(self.var_A265["delay_post"]))
	{
		wait(self.var_A265["delay_post"]);
	}

	var_01 = self.var_A265["origin"];
	var_02 = self.var_A265["angles"];
	var_03 = var_00.origin;
	var_04 = var_03 - self.var_A265["origin"];
	var_05 = var_04[0];
	var_06 = var_04[1];
	var_07 = var_04[2];
	var_08 = isdefined(self.var_A265["physics"]);
	if(var_08)
	{
		var_09 = undefined;
		if(isdefined(var_00.target))
		{
			var_09 = var_00 common_scripts\utility::func_4375();
		}

		if(!isdefined(var_09))
		{
			var_0A = var_01;
			var_0B = var_00.origin;
		}
		else
		{
			var_0A = var_02.origin;
			var_0B = var_0A.origin - var_01.origin * self.var_A265["physics"];
		}

		self.model method_82C5(var_0A,var_0B);
		return;
	}
	else
	{
		self.model rotatevelocity((var_08,var_09,var_0A),12);
		self.model gravitymove((var_08,var_09,var_0A),12);
	}

	if(level.var_27F6)
	{
		if(isdefined(self.var_3928))
		{
			return;
		}

		self.var_3928 = 1;
		wait(3);
		self.var_3928 = undefined;
		self.var_A265["origin"] = var_04;
		self.var_A265["angles"] = var_05;
		self.model hide();
		return;
	}

	self.var_A265["exploder"] = undefined;
	wait(6);
	self.model delete();
}

//Function Number: 18
func_1CB3()
{
	if(isdefined(self.var_A265["delay"]))
	{
		wait(self.var_A265["delay"]);
	}

	if(!isdefined(self.model.var_8205))
	{
		self.model show();
		self.model solid();
	}
	else
	{
		var_00 = self.model common_scripts\utility::func_8FFC();
		if(isdefined(self.model.script_linkname))
		{
			var_00.script_linkname = self.model.script_linkname;
		}

		var_00 setmodel(self.model.var_8205);
		var_00 show();
	}

	self.var_1CB4 = 1;
	if(common_scripts\utility::func_57D7() && !isdefined(self.model.var_8205) && self.model.spawnflags & 1)
	{
		if(!isdefined(self.model.var_2FBF))
		{
			self.model [[ level.var_2587 ]]();
		}
		else
		{
			self.model [[ level.var_2FC3 ]]();
		}
	}

	if(level.var_27F6)
	{
		if(isdefined(self.var_3928))
		{
			return;
		}

		self.var_3928 = 1;
		wait(3);
		self.var_3928 = undefined;
		if(!isdefined(self.model.var_8205))
		{
			self.model hide();
			self.model notsolid();
		}
	}
}

//Function Number: 19
func_393F()
{
	if(!common_scripts\utility::func_57D7())
	{
		return;
	}

	func_3930();
	level.player playrumbleonentity(self.var_A265["rumble"]);
}

//Function Number: 20
func_3930()
{
	if(!isdefined(self.var_A265["delay"]))
	{
		self.var_A265["delay"] = 0;
	}

	var_00 = self.var_A265["delay"];
	var_01 = self.var_A265["delay"] + 0.001;
	if(isdefined(self.var_A265["delay_min"]))
	{
		var_00 = self.var_A265["delay_min"];
	}

	if(isdefined(self.var_A265["delay_max"]))
	{
		var_01 = self.var_A265["delay_max"];
	}

	if(var_00 > 0)
	{
		var_02 = randomfloatrange(var_00,var_01);
		self.var_8F0 = var_02;
		wait(var_02);
	}
}

//Function Number: 21
func_359F()
{
	common_scripts\utility::func_3F51();
	var_00 = self.var_A265["origin"];
	var_01 = self.var_A265["loopsound"];
	func_3930();
	common_scripts\utility::func_5EDF(var_01,var_00);
}

//Function Number: 22
func_8F30()
{
	func_35A0();
}

//Function Number: 23
func_35A0()
{
	var_00 = self.var_A265["origin"];
	var_01 = self.var_A265["soundalias"];
	func_3930();
	common_scripts\utility::func_3F50(var_01,var_00);
}

//Function Number: 24
func_3931()
{
	func_3930();
	common_scripts\utility::func_30AE(self.var_A265["earthquake"],self.var_A265["origin"]);
}

//Function Number: 25
func_393D()
{
	if(!isdefined(self.var_A265["soundalias"]) || self.var_A265["soundalias"] == "nil")
	{
		return;
	}

	common_scripts\utility::func_3F50(self.var_A265["soundalias"],self.var_A265["origin"]);
}

//Function Number: 26
func_3BB8()
{
	var_00 = self.var_A265["forward"];
	var_01 = self.var_A265["up"];
	var_02 = undefined;
	var_03 = self.var_A265["firefxsound"];
	var_04 = self.var_A265["origin"];
	var_05 = self.var_A265["firefx"];
	var_06 = self.var_A265["ender"];
	if(!isdefined(var_06))
	{
		var_06 = "createfx_effectStopper";
	}

	var_07 = 0.5;
	if(isdefined(self.var_A265["firefxdelay"]))
	{
		var_07 = self.var_A265["firefxdelay"];
	}

	func_3930();
	if(isdefined(var_03))
	{
		common_scripts\utility::func_5EE2(var_03,var_04,(0,0,0),1,var_06);
	}

	playfx(level.var_611[var_05],self.var_A265["origin"],var_00,var_01);
}

//Function Number: 27
func_1F5E()
{
	if(isdefined(self.var_A265["repeat"]))
	{
		thread func_393D();
		for(var_00 = 0;var_00 < self.var_A265["repeat"];var_00++)
		{
			playfx(level.var_611[self.var_A265["fxid"]],self.var_A265["origin"],self.var_A265["forward"],self.var_A265["up"]);
			func_3930();
		}

		return;
	}

	if(!isdefined(self.var_A265["delay"]))
	{
		self.var_A265["delay"] = 0;
	}

	if(self.var_A265["delay"] >= 0)
	{
		func_3930();
		var_01 = 0;
	}
	else
	{
		var_01 = self.var_A265["delay"];
	}

	if(isdefined(self.var_5EED))
	{
		self.var_5EED delete();
	}

	self.var_5EED = spawnfx(common_scripts\utility::func_44F5(self.var_A265["fxid"]),self.var_A265["origin"],self.var_A265["forward"],self.var_A265["up"]);
	if(level.var_27F6)
	{
		function_014E(self.var_5EED,1);
	}

	if(self.var_A265["delay"] >= 0)
	{
		triggerfx(self.var_5EED);
	}
	else
	{
		triggerfx(self.var_5EED,var_01);
	}

	func_393D();
}

//Function Number: 28
func_0891(param_00,param_01,param_02)
{
	param_00 = param_00 + "";
	level notify("exploding_" + param_00);
	var_03 = 0;
	if(isdefined(level.var_2807) && !level.var_27F6)
	{
		var_04 = level.var_2807[param_00];
		if(isdefined(var_04))
		{
			foreach(var_06 in var_04)
			{
				if(!var_06 func_2158())
				{
					continue;
				}

				var_06 common_scripts\utility::func_894();
				var_03 = 1;
			}
		}
	}
	else
	{
		for(var_08 = 0;var_08 < level.var_2804.size;var_08++)
		{
			var_06 = level.var_2804[var_08];
			if(!isdefined(var_06))
			{
				continue;
			}

			if(var_06.var_A265["type"] != "exploder")
			{
				continue;
			}

			if(!isdefined(var_06.var_A265["exploder"]))
			{
				continue;
			}

			if(var_06.var_A265["exploder"] + "" != param_00)
			{
				continue;
			}

			if(!var_06 func_2158())
			{
				continue;
			}

			var_06 common_scripts\utility::func_894();
			var_03 = 1;
		}
	}

	if(!func_8BA5() && !var_03)
	{
		func_088E(param_00,param_01,param_02);
	}
}

//Function Number: 29
func_392A(param_00,param_01,param_02)
{
	[[ level.var_62E.var_3945 ]](param_00,param_01,param_02);
}

//Function Number: 30
func_5A01(param_00)
{
	var_01 = func_44D1(param_00);
	if(isdefined(var_01))
	{
		foreach(var_03 in var_01)
		{
			if(isdefined(var_03.var_5EED))
			{
				function_014E(var_03.var_5EED,1);
			}
		}

		wait 0.05;
		foreach(var_03 in var_01)
		{
			var_03 common_scripts\utility::func_6F21();
		}
	}
}

//Function Number: 31
func_2158()
{
	var_00 = self;
	return 1;
}

//Function Number: 32
func_088E(param_00,param_01,param_02)
{
	if(!func_5640(param_00))
	{
		return;
	}

	var_03 = int(param_00);
	activateclientexploder(var_03,param_01,param_02);
}

//Function Number: 33
func_2A6D(param_00,param_01,param_02)
{
	if(!func_5640(param_00))
	{
		return;
	}

	var_03 = int(param_00);
	stopclientexploder(var_03,param_01,param_02);
}

//Function Number: 34
func_5640(param_00)
{
	if(!isdefined(param_00))
	{
		return 0;
	}

	var_01 = param_00;
	if(isstring(param_00))
	{
		var_01 = int(param_00);
		if(var_01 == 0 && param_00 != "0")
		{
			return 0;
		}
	}

	return var_01 >= 0;
}

//Function Number: 35
func_8BA5()
{
	if(common_scripts\utility::func_57D7())
	{
		return 1;
	}

	if(!isdefined(level.var_27F6))
	{
		level.var_27F6 = getdvar("1459") != "";
	}

	if(level.var_27F6)
	{
		return 1;
	}

	return getdvar("3508") != "1";
}

//Function Number: 36
func_392D(param_00,param_01,param_02)
{
	waittillframeend;
	waittillframeend;
	func_0891(param_00,param_01,param_02);
}

//Function Number: 37
func_392B(param_00,param_01,param_02)
{
	func_0891(param_00,param_01,param_02);
}