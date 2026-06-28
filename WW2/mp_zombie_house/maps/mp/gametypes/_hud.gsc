/*******************************************************************
 * Decompiled By: Bog
 * Decompiled File: maps\mp\gametypes\_hud.gsc
 * Game: Call of Duty: WWII
 * Platform: PC
 * Function Count: 3
 * Decompile Time: 0 ms
 * Timestamp: 5/5/2026 9:13:49 PM
*******************************************************************/

//Function Number: 1
init()
{
	level.uiparent = spawnstruct();
	level.uiparent.horzalign = "left";
	level.uiparent.vertalign = "top";
	level.uiparent.alignx = "left";
	level.uiparent.aligny = "top";
	level.uiparent.x = 0;
	level.uiparent.y = 0;
	level.uiparent.width = 0;
	level.uiparent.height = 0;
	level.uiparent.children = [];
	level.fontheight = 12;
	level.var_4F52["allies"] = spawnstruct();
	level.var_4F52["axis"] = spawnstruct();
	level.primaryprogressbary = -61;
	level.primaryprogressbarx = 0;
	level.primaryprogressbarheight = 9;
	level.primaryprogressbarwidth = 120;
	level.primaryprogressbartexty = -75;
	level.primaryprogressbartextx = 0;
	level.primaryprogressbarfontsize = 0.6;
	level.teamprogressbary = 32;
	level.teamprogressbarheight = 14;
	level.teamprogressbarwidth = 192;
	level.teamprogressbartexty = 8;
	level.teamprogressbarfontsize = 1.65;
	level.var_5F2F = "BOTTOM";
	level.var_5F2E = -90;
	level.var_5F2D = 1.6;
}

//Function Number: 2
func_3DDA(param_00)
{
	self.basefontscale = self.fontscale;
	if(isdefined(param_00))
	{
		self.var_6085 = min(param_00,6.3);
	}
	else
	{
		self.var_6085 = min(self.fontscale * 2,6.3);
	}

	self.var_5136 = 2;
	self.var_6C71 = 4;
}

//Function Number: 3
func_3DD9(param_00)
{
	self notify("fontPulse");
	self endon("fontPulse");
	self endon("death");
	param_00 endon("disconnect");
	param_00 endon("joined_team");
	param_00 endon("joined_spectators");
	self changefontscaleovertime(self.var_5136 * 0.05);
	self.fontscale = self.var_6085;
	wait(self.var_5136 * 0.05);
	self changefontscaleovertime(self.var_6C71 * 0.05);
	self.fontscale = self.basefontscale;
}