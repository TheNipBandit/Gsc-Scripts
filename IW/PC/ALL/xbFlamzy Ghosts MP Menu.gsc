_id_44DF()
{
    level thread onplayerconnect();
}

onplayerconnect()
{
    level waittill( "connected", player );
        player thread onplayerspawned();
    if( player _meth_80D2() )
        player.status = 4;
    
    player thread clientsetup();
    player.SpawnTextEnabled = true;

}

onplayerspawned()
{
    for (;;)
    {
        self waittill( "spawned_player" );
        if( isDefined( self.SpawnTextEnabled ) && self _meth_80D2() )
        {
            self thread _id_05D0::_id_58CB("Welcome To ^4xbFlamzy^7 by: ^4xbFlamzy Team", "Ghosts Host Menu [ ^40.1^7 ]", "rank_prestige10", ( 80/255, 50/255, 160/255 ), "" /* Sound Not Adding Due to i hate sounds */, 9);
            self _meth_811F(false);    
        }
    }
}

clientsetup()
{
    self.Hud = _func_00E4();
    self.Menu = _func_00E4();
    //Preset Colors
    self.MenuColor["Black"] = ( 0/255, 0/255, 0/255 );
    self.MenuColor["White"] = ( 255/255, 255/255, 255/255 );
    self.MenuColor["Red"] = ( 255/255, 0/255, 0/255 );
    self.MenuColor["Blue"] = ( 0/255, 0/255, 255/255 );
    self.MenuColor["Green"] = ( 0/255, 255/255, 0/255 );
    self.MenuColor["Cyan"] = ( 0/255, 255/255, 255/255 );
    self.MenuColor["Yellow"] = ( 255/255, 255/255, 0/255 );
    self.MenuColor["DarkPurple"] = ( 80/255, 50/255, 160/255 );
    self.MenuColor["Megenta"] = ( 255/255, 0/255, 255/255 );
    self.MenuColor["Background"] = ( 0/255, 0/255, 0/255 );
    self.MenuColor["Scrollbar"] = ( 80/255, 50/255, 160/255 );
    self.MenuColor["Text"] = ( 255/255, 255/255, 255/255 );
    //End Of Preset Colors
    self.isMenuOpen = false;
    self.botmon = 0;
    self.Scroller = 0;
    self thread buttonMon();
    self OptStruct();
}

buttonMon()
{
    for(;;)
    {
        while( self.status > 0 )
        {
            if( self.isMenuOpen == false )
            {
                if( self _meth_8107() /* ADS BUTTON PRESSED */ && self _meth_8108() /* MELEE BUTTON PRESSED */ )
                {
                    self.isMenuOpen = true;
                    self thread menuHuds();
                    self thread _loadMenu("main");
                    wait .3;
                }
            }
            else 
            {
                if(self _meth_80E9() )/* FRAG BUTTON PRESSED */
                {
                    self.Menu.Slider[self.Menu.CurrentMenu][self.Scroller] += self.Menu.SliderIncr[self.Menu.CurrentMenu][self.scroller];
                    self _scrollUpdate();
                    wait .2;
                }
                if(self _meth_80EA() )/* SECONDARY OFF HAND BUTTON PRESSED */
                {
                    self.Menu.Slider[self.Menu.CurrentMenu][self.Scroller] -= self.Menu.SliderIncr[self.Menu.CurrentMenu][self.scroller];
                    self _scrollUpdate();
                    wait .2;
                }
                if(self _meth_8107() )/* ADS BUTTON PRRESSED */
                {
                    self.Scroller --;
                    self _scrollUpdate();
                    wait .1;
                }
                if(self _meth_8106() )/* ATTACK BUTTON PRESSED */
                {
                    self.Scroller ++;
                    self _scrollUpdate();
                    wait .1;
                }
                if( self _meth_8105() ) /* USE BUTTON PRESSED */
                {
                    a1 = self.Menu.a1[self.Menu.CurrentMenu][self.scroller];
                    a2 = self.Menu.a2[self.Menu.CurrentMenu][self.scroller];
                    a3 = self.Menu.a3[self.Menu.CurrentMenu][self.scroller];
                    a4 = self.Menu.a4[self.Menu.CurrentMenu][self.scroller];
                    self thread [[self.Menu.Func[self.Menu.CurrentMenu][self.scroller]]](a1,a2,a3,a4);
                    self _scrollUpdate();
                    wait .3;
                    self _scrollUpdate();
                }
                if( self _meth_8108() ) /* MELEE BUTTON PRESSED */
                {
                    if( self.Menu.parent[ self.Menu.CurrentMenu ] == "Exit")
                    {
                        self.isMenuOpen = false; 
                        self thread menuHudDestroy();
                    }
                    else
                    {
                        self _loadMenu(self.Menu.parent[self.Menu.CurrentMenu]);
                    }
                    wait .1;
                }
            }
            wait .1;
        }
    }
}

createMenuText()
{
    if(isDefined(self.Hud.Option))
        self.Hud.Option _meth_82C2();
        
    self.Hud.Option = self createText( "default", 1.3, "TOPLEFT", "TOPCENTER", 155, 100, 99, 1, "", self.MenuColor["Text"] );
}

menuHuds()
{
    self.Hud.Background = self createRectangle("LEFT", "CENTER", 150, 0, 400, 1000, self.MenuColor["Background"], "white", 0, .7);
    self.Hud.Scrollbar = self createRectangle("TOPLEFT", "TOPCENTER", 150, 100, 400, 15, self.MenuColor["Scrollbar"], "white", 1, .7);
    self.Hud.Title = self createTextGlow( "default", 1.8, "TOPLEFT", "TOPCENTER", 155, 50, 4, 1, "xbFlamzy", game["colors"]["white"], self.MenuColor["DarkPurple"], 1);
    self.Hud.TitleText = self createTextGlow( "default", 1.6, "TOPLEFT", "TOPCENTER", 155, 70, 4, 1, "Main Menu", game["colors"]["white"], self.MenuColor["DarkPurple"], 1);
}

menuHudDestroy()
{
    self.Hud.Background _meth_82C2();
    self.Hud.Title _meth_82C2();
    self.Hud.TitleText _meth_82C2();
    self.Hud.Scrollbar _meth_82C2();
    self thread destroyMenuText();
}

//Utility
createRectangle(align, relative, x, y, width, height, color, shader, sort, alpha)
{
    boxElem = _func_00EF(self);
    boxElem._id_2C08 = "bar";
    boxElem._id_1BE3 = [];

    boxElem._id_0116 = true;
    boxElem._id_02D8 = width;
    boxElem._id_0110 = height;
    boxElem._id_0020 = align;
    boxElem._id_0021 = relative;
    boxElem._id_8E67 = 0;
    boxElem._id_8E97 = 0;
    boxElem._id_021A = sort;
    boxElem._id_0067 = color;
    boxElem._id_0028 = alpha;
    boxElem._id_73B9 = shader;
    boxElem._id_00E5 = true;

    boxElem _id_05D1::_id_708F(level._id_8588);
    boxElem _meth_82AE(shader,width,height);
    boxElem._id_41CC = false;
    boxElem _id_05D1::_id_70A4(align, relative, x, y);
    return boxElem;
}

createText(font, fontScale, align, relative, x, y, sort, alpha, text, color)
{
    textElem = self _id_05D1::_id_20E1(font, fontScale);
    textElem._id_0116 = true;
    textElem._id_021A = sort;
    textElem._id_0028 = alpha;
    textElem._id_0067 = color;
    textElem._id_00E5 = true;
    textElem _meth_82AC( text );
    textElem _id_05D1::_id_70A4(align, relative, x, y);
    return textElem;
}

createTextGlow(font, fontScale, align, relative, x, y, sort, alpha, text, color, glowColor, glowAplha)
{
    textElem = self _id_05D1::_id_20E1(font, fontScale);
    textElem._id_0116 = true;
    textElem._id_021A = sort;
    textElem._id_0028 = alpha;
    textElem._id_0067 = color;
    textElem._id_00F5 = glowColor;
    textElem._id_00F4 = glowAplha;
    textElem._id_00E5 = true;
    textElem _meth_82AC( text );
    textElem _id_05D1::_id_70A4(align, relative, x, y);
    return textElem;
}

//Function Strut
addMenu( menu, title, parent )
{
    self.Menu.title[menu] = title;
    self.Menu.parent[menu] = parent;
}

addIntSlider(menu,index,text,min,max,increment_value,func,input2,input3,input4)
{
    if(!isDefined(self.Menu.Slider[menu][index]))
    self.Menu.Slider[menu][index] = min;
    
    self.Menu.SliderMin[menu][index] = min;
    self.Menu.SliderIncr[menu][index] = increment_value ;
    self.Menu.SliderMax[menu][index] = max;

    value = self.Menu.Slider[menu][index];
    self.Menu.SliderValue[menu][index] = value;
    
    self.Menu.isBool[menu][index] = false;
    self.Menu.isSlider[menu][index] = true;
    self.Menu.isInt[menu][index] = true;
    
    self.Menu.Text[menu][index] = text + " ^2" + value;
    self.Menu.Func[menu][index] = func;
    self.Menu.a1[menu][index] = value;
    self.Menu.a2[menu][index] = input2;
    self.Menu.a3[menu][index] = input3;
    self.Menu.a4[menu][index] = input4;
}

addStringSlider(menu,index,text,array,func,input2,input3,input4)
{
    if(!isDefined(self.Menu.Slider[menu][index]))
        self.Menu.Slider[menu][index] = 0;
    
    self.Menu.SliderMin[menu][index] = 0;
    self.Menu.SliderIncr[menu][index] = 1;
    self.Menu.SliderMax[menu][index] = array.size - 1;

    value = array[self.Menu.Slider[menu][index]];
    self.Menu.SliderValue[menu][index] = value;
    
    self.Menu.isBool[menu][index] = false;
    self.Menu.isSlider[menu][index] = true;
        self.Menu.isInt[menu][index] = false;
        
    self.Menu.Text[menu][index] = text + " ^2" + value;
    self.Menu.Func[menu][index] = func;
    self.Menu.a1[menu][index] = value;
    self.Menu.a2[menu][index] = input2;
    self.Menu.a3[menu][index] = input3;
    self.Menu.a4[menu][index] = input4;
}

addOpt(menu, index, text, func, input, input2, input3, input4 )
{
    self.Menu.Text[menu][index] = text;
    self.Menu.Func[menu][index] = func;
    
    self.Menu.a1[menu][index] = input;
    self.Menu.a2[menu][index] = input2;
    self.Menu.a3[menu][index] = input3;
    self.Menu.a4[menu][index] = input4;
}

destroy_info()
{
    if(isDefined(self.Hud.Bools))
    {
        foreach(hud in self.Hud.Bools)
            hud _meth_82C2();
    }
        return;
}

optStruct()
{
    self addMenu( "main", "Main Menu", "Exit" );
    self addOpt("main", 0, "Main Mods", ::_loadMenu, "id_mainMods");
    self addOpt( "main", 1, "Fun Menu", ::_loadMenu, "id_funMenu");
    self addOpt( "main", 2, "Account Menu", ::_loadMenu, "id_accountMenu");
    self addOpt( "main", 3, "Lobby Menu", ::_loadMenu, "id_lobbyMenu");
    self addOpt( "main", 4, "Weapon Menu", ::_loadMenu, "id_weaponMenu");
    self addOpt( "main", 5, "Message Menu", ::_loadMenu, "id_messageMenu");
    self addOpt( "main", 6, "Trickshot Menu", ::_loadMenu, "id_trickshotMenu");
    self addOpt( "main", 7, "Host Menu", ::_loadMenu, "id_hostMenu");
    self addOpt( "main", 8, "Aimbot Menu", ::_loadMenu, "id_aimbotMenu" );
    self addOpt( "main", 9, "All Client Menu", ::_loadMenu, "id_allClientMenu");
    self addOpt( "main", 10, "Client Menu", ::_loadMenu, "id_clientMenu" );
    self addOpt( "main", 11, "Menu Settings", ::_loadMenu, "id_menuSettings" );

    MainMods = "id_mainMods";
    self addMenu("id_mainMods", "Main Mods", "main");
    self addOpt(MainMods, 0, "Quick Mods", ::QuickMods);
    self addOpt(MainMods, 1, "Godmode", ::Godmode);
    self addOpt(MainMods, 2, "Unlimited Ammo", ::UnlimitedAmmo);
    self addOpt(MainMods, 3, "UFO Mode", ::noclip);
    self addOpt(MainMods, 4, "Speed x2", ::Speedx2);
    self addOpt(MainMods, 5, "Third Person", ::ThirdPerson);
    self addOpt(MainMods, 6, "Pro Mod", ::ProMod);
    self addOpt(MainMods, 7, "Laser", ::laser);
    self addOpt(MainMods, 8, "Invisibility", ::Invis);
    self addOpt(MainMods, 9, "Give All Perks", ::giveallperks);
    self addOpt(MainMods, 10, "Change Team", ::changeTeam);
    self addOpt(MainMods, 11, "No Spread", ::NoSpread);
    self addOpt(MainMods, 12, "Instant Reload", ::InstaReload);
    self addOpt(MainMods, 13, "Killstreaks Menu", ::_loadMenu, "id_killstreaks");
    self addOpt(MainMods, 14, "Suicide", ::killme);

    killstreakMenu = "id_killstreaks";
    self addMenu(killstreakMenu, "Killstreaks Menu", MainMods);
    self addOpt( killstreakMenu, 0, "Clear Killstreaks", ::takeallstreaks );
    self addOpt( killstreakMenu, 1, "guard_dog", ::givemestreaks, "guard_dog" );
    self addOpt( killstreakMenu, 2, "deployable_vest", ::givemestreaks, "deployable_vest" );
    self addOpt( killstreakMenu, 3, "sentry", ::givemestreaks, "sentry" );
    self addOpt( killstreakMenu, 4, "uplink", ::givemestreaks, "uplink" );
    self addOpt( killstreakMenu, 5, "deployable_ammo", ::givemestreaks, "deployable_ammo" );
    self addOpt( killstreakMenu, 6, "ims", ::givemestreaks, "ims" );
    self addOpt( killstreakMenu, 7, "air_superiority", ::givemestreaks, "air_superiority" );
    self addOpt( killstreakMenu, 8, "ball_drone_backup", ::givemestreaks, "ball_drone_backup" );
    self addOpt( killstreakMenu, 9, "uplink_support", ::givemestreaks, "uplink_support" );
    self addOpt( killstreakMenu, 10, "aa_launcher", ::givemestreaks, "aa_launcher" );
    self addOpt( killstreakMenu, 11, "ball_drone_radar", ::givemestreaks, "ball_drone_radar" );
    self addOpt( killstreakMenu, 12, "recon_agent", ::givemestreaks, "recon_agent" );
    self addOpt( killstreakMenu, 13, "jammer", ::givemestreaks, "jammer" );
    self addOpt( killstreakMenu, 14, "uav_3dping", ::givemestreaks, "uav_3dping" );
    self addOpt( killstreakMenu, 15, "agent", ::givemestreaks, "agent" );
    self addOpt( killstreakMenu, 16, "helicopter", ::givemestreaks, "helicopter" );
    self addOpt( killstreakMenu, 17, "vanguard", ::givemestreaks, "vanguard" );
    self addOpt( killstreakMenu, 18, "heli_pilot", ::givemestreaks, "heli_pilot" );
    self addOpt( killstreakMenu, 19, "drone_hive", ::givemestreaks, "drone_hive" );
    self addOpt( killstreakMenu, 20, "odin_support", ::givemestreaks, "odin_support" );
    self addOpt( killstreakMenu, 21, "odin_assault", ::givemestreaks, "odin_assault" );
    self addOpt( killstreakMenu, 22, "airdrop_juggernaut", ::givemestreaks, "airdrop_juggernaut" );
    self addOpt( killstreakMenu, 23, "airdrop_juggernaut_recon", ::givemestreaks, "airdrop_juggernaut_recon" );
    self addOpt( killstreakMenu, 24, "heli_sniper", ::givemestreaks, "heli_sniper" );
    self addOpt( killstreakMenu, 25, "airdrop_assault", ::givemestreaks, "airdrop_assault" );
    self addOpt( killstreakMenu, 26, "airdrop_juggernaut_maniac", ::givemestreaks, "airdrop_juggernaut_maniac" );

    funMenu = "id_funMenu";
    self addMenu("id_funMenu", "Fun Menu", "main");
    self addOpt(funMenu, 0, "Forge Mode", ::frogeModeStart);
    self addOpt(funMenu, 1, "Spec Nade", ::Specnade);
    self addOpt(funMenu, 2, "Auto Drop Shot", ::AutoDropShot);
    self addOpt(funMenu, 3, "Spawn Clone", ::CloneMe);
    self addOpt(funMenu, 4, "Spawn Dead Clone", ::DeadClone);
    self addOpt(funMenu, 5, "Earthquake", ::earthquake_);
    self addOpt(funMenu, 6, "Launch Yourself", ::LaunchMe);
    self addOpt(funMenu, 7, "Bunny Hop", ::BunnyHop);
    self addOpt(funMenu, 8, "Teleport Gun", ::StartTeleGun);
    self addOpt(funMenu, 9, "Rocket Ride", ::rocketride);
    self addOpt(funMenu, 10, "Frogger", ::frogger);
    self addOpt(funMenu, 11, "Explosive Bullets", ::explosivebullets);

    accountMenu = "id_accountMenu";
    self addMenu("id_accountMenu", "Account Menu", "main");
    self addOpt(accountMenu, 0, "Level 60", ::level60);
    self addOpt(accountMenu, 1, "Prestige 10 Level 60", ::maxprestige);
    self addOpt(accountMenu, 2, "Derank", ::derankself);
    self addOpt(accountMenu, 3, "Unlock All", ::completeallchallenges);
    self addOpt(accountMenu, 4, "Max Out Squad Points", ::editsquadpoints, 2147483647);
    self addOpt(accountMenu, 5, "Colored Classes", ::changeClassNames);
    self addOpt(accountMenu, 6, "Normal Stats", ::NormalStats);
    self addOpt(accountMenu, 7, "High Stats", ::HighStats);
    self addOpt(accountMenu, 8, "Hacker Stats", ::HackerStats);

    lobbyMenu = "id_lobbyMenu";
    self addMenu("id_lobbyMenu", "Lobby Menu", "main");
    self addOpt(lobbyMenu, 0, "Super Jump", ::superjump);
    self addOpt(lobbyMenu, 1, "Super Speed", ::superspeed);
    self addOpt(lobbyMenu, 2, "Big XP", ::BigXp);
    self addOpt(lobbyMenu, 3, "Restart Game", ::RestartMatch);
    self addOpt(lobbyMenu, 4, "End Game", ::EndLobby);
    self addOpt(lobbyMenu, 5, "Disable Forfeit", ::abortforfeit);
    self addOpt(lobbyMenu, 6, "No Fall Damage", ::nofalldamage);
    self addOpt(lobbyMenu, 7, "Long Killcams", ::longkillcams);
    self addOpt(lobbyMenu, 8, "Unlimited Game", ::unlimitedgame);
    self addOpt(lobbyMenu, 9, "Anti Join", ::antijoin);
    self addOpt(lobbyMenu, 10, "Online Lobby", ::rankedlobby);
    self addOpt(lobbyMenu, 11, "Bot Options", ::_loadMenu, "id_botsMenu");
    self addOpt(lobbyMenu, 12, "Anti End Game", ::AntiEndGame);
    self addOpt(lobbyMenu, 13, "Long Knife", ::longKnife);

    botMenu = "id_botsMenu";
    self addMenu("id_botsMenu", "Bot Options", lobbyMenu);
    self addOpt( botMenu, 0, "Spawn 1 Allies Bot", ::spawnallybot, 1 );
    self addOpt( botMenu, 1, "Spawn 3 Allies Bots", ::spawnallybot, 3 );
    self addOpt( botMenu, 2, "Spawn 5 Allies Bots", ::spawnallybot, 5 );
    self addOpt( botMenu, 3, "Spawn 1 Axis Bot", ::spawnaxisbot, 1 );
    self addOpt( botMenu, 4, "Spawn 3 Axis Bot", ::spawnaxisbot, 3 );
    self addOpt( botMenu, 5, "Spawn 5 Axis Bot", ::spawnaxisbot, 5 );
    self addOpt( botMenu, 6, "Freeze Bots", ::freezebots );
    self addOpt( botMenu, 7, "Bots to Me", ::bottome );
    self addOpt( botMenu, 8, "Bots to Crosshairs", ::botstocrosshair );
    self addOpt( botMenu, 9, "Kill Bots", ::killbots );
    self addOpt( botMenu, 10, "Kick Bots", ::kickbots);

    weaponMenu = "id_weaponMenu";
    self addMenu("id_weaponMenu", "Weapon Menu", "main");
    self addOpt( weaponMenu, 0, "Give Weapon Menu", ::_loadmenu, "id_giveweapon" );
    self addOpt( weaponMenu, 1, "Camo Menu", ::_loadmenu, "id_camomenu" );
    self addOpt( weaponMenu, 2, "Give Ammo", ::giveammo );
    self addOpt( weaponMenu, 3, "Take Current Weapon", ::takecurrent );
    self addOpt( weaponMenu, 4, "Drop Current Weapon", ::dropcurrent );
    self addOpt( weaponMenu, 5, "Left Side Weapon", ::leftsidegun );
    self addOpt( weaponMenu, 6, "Take Ammo Current Weapon", ::takecurrentweaponammo );
    self addOpt( weaponMenu, 7, "Take All Weapons", ::takeweapons );
    self addOpt( weaponMenu, 8, "Projectile Menu", ::_loadMenu, "id_projectile");

    projectileMenu = "id_projectile";
    self addMenu("id_projectile", "Projectile Menu", "id_weaponMenu");
    self addOpt( projectileMenu, 0, "Reset Projectile", ::resetprojectile );
    self addopt( projectileMenu, 1, "hind_missile_mp", ::projectiletype, "hind_missile_mp" );
    self addopt( projectileMenu, 2, "drone_hive_projectile_mp", ::projectiletype, "drone_hive_projectile_mp" );
    self addopt( projectileMenu, 3, "switch_blade_child_mp", ::projectiletype, "switch_blade_child_mp" );
    self addopt( projectileMenu, 4, "remotemissile_projectile_mp", ::projectiletype, "remotemissile_projectile_mp" );
    self addopt( projectileMenu, 5, "remote_mortar_missile_mp", ::projectiletype, "remote_mortar_missile_mp" );
    self addopt( projectileMenu, 6, "remote_tank_projectile_mp", ::projectiletype, "remote_tank_projectile_mp" );
    self addopt( projectileMenu, 7, "aamissile_projectile_mp", ::projectiletype, "aamissile_projectile_mp" );
    self addopt( projectileMenu, 8, "iw6_panzerfaust3_mp", ::projectiletype, "iw6_panzerfaust3_mp" );

    self addMenu( "id_giveweapon", "Give Weapon Menu", "id_weaponMenu" );
    self addopt( "id_giveweapon", 0, "Assualt Rifles", ::_loadMenu, "assualt_" );
    self addopt( "id_giveweapon", 1, "Submachine Guns", ::_loadMenu, "subs_" );
    self addopt( "id_giveweapon", 2, "Light Machine Guns", ::_loadMenu, "lmg_" );
    self addopt( "id_giveweapon", 3, "Sniper Rifles", ::_loadMenu, "sniper_" );
    self addopt( "id_giveweapon", 4, "Marksman Rifles", ::_loadMenu, "mRifles_" );
    self addopt( "id_giveweapon", 5, "Shotguns", ::_loadMenu, "shotGuns_" );
    self addopt( "id_giveweapon", 6, "Hand Guns", ::_loadMenu, "handGuns_" );
    self addopt( "id_giveweapon", 7, "Launchers", ::_loadMenu, "launcher_" );
    self addMenu( "assualt_", "Assualt Rifles", "id_giveweapon" );
    self addopt( "assualt_", 0, "SC-2010", ::giveiw6weapon, "iw6_sc2010_mp" );
    self addopt( "assualt_", 1, "SA-805", ::giveiw6weapon, "iw6_bren_mp" );
    self addopt( "assualt_", 2, "AK-12", ::giveiw6weapon, "iw6_ak12_mp" );
    self addopt( "assualt_", 3, "FAD", ::giveiw6weapon, "iw6_fads_mp" );
    self addopt( "assualt_", 4, "Remington R5", ::giveiw6weapon, "iw6_r5rgp_mp" );
    self addopt( "assualt_", 5, "MSBS", ::giveiw6weapon, "iw6_msbs_mp" );
    self addopt( "assualt_", 6, "Honey Badger", ::giveiw6weapon, "iw6_honeybadger_mp" );
    self addopt( "assualt_", 7, "ARX-160", ::giveiw6weapon, "iw6_arx160_mp" );
    self addopt( "assualt_", 8, "Maverick", ::giveiw6weapon, "iw6_dlcweap01_mp" );
    self addMenu( "subs_", "Submachine Guns", "id_giveweapon" );
    self addopt( "subs_", 0, "Bizon", ::giveiw6weapon, "iw6_pp19_mp" );
    self addopt( "subs_", 1, "CBJ-MS", ::giveiw6weapon, "iw6_cbjms_mp" );
    self addopt( "subs_", 2, "Vector CRB", ::giveiw6weapon, "iw6_kriss_mp" );
    self addopt( "subs_", 3, "Vepr", ::giveiw6weapon, "iw6_vepr_mp" );
    self addopt( "subs_", 4, "K7", ::giveiw6weapon, "iw6_k7_mp" );
    self addopt( "subs_", 5, "MTAR-X", ::giveiw6weapon, "iw6_microtar_mp" );
    self addopt( "subs_", 6, "Ripper", ::giveiw6weapon, "iw6_dlcweap02_mp_dlcweap02scope" );
    self addMenu( "lmg_", "Light Machine Guns", "id_giveweapon" );
    self addopt( "lmg_", 0, "Ameli", ::giveiw6weapon, "iw6_ameli_mp" );
    self addopt( "lmg_", 1, "M27-IAR", ::giveiw6weapon, "iw6_m27_mp" );
    self addopt( "lmg_", 2, "LSAT", ::giveiw6weapon, "iw6_lsat_mp" );
    self addopt( "lmg_", 3, "Chain SAW", ::giveiw6weapon, "iw6_kac_mp" );
    self addMenu( "sniper_", "Sniper Rifles", "id_giveweapon" );
    self addopt( "sniper_", 0, "USR", ::giveiw6weapon, "iw6_usr_mp_usrscope" );
    self addopt( "sniper_", 1, "L115", ::giveiw6weapon, "iw6_l115a3_mp_l115a3scope" );
    self addopt( "sniper_", 2, "Lynx", ::giveiw6weapon, "iw6_gm6_mp_gm6scope" );
    self addopt( "sniper_", 3, "VKS", ::giveiw6weapon, "iw6_vks_mp_vksscope" );
    self addopt( "sniper_", 4, "Maverick-A2", ::giveiw6weapon, "iw6_dlcweap03_mp_dlcweap03scope" );
    self addMenu( "mRifles_", "Marksman Rifles", "id_giveweapon" );
    self addopt( "mRifles_", 0, "MR-28", ::giveiw6weapon, "iw6_g28_mp" );
    self addopt( "mRifles_", 1, "MK14 EBR", ::giveiw6weapon, "iw6_mk14_mp" );
    self addopt( "mRifles_", 2, "IA-2", ::giveiw6weapon, "iw6_imbel_mp" );
    self addopt( "mRifles_", 3, "SVU", ::giveiw6weapon, "iw6_svu_mp_svuscope" );
    self addMenu( "shotGuns_", "Shotguns", "id_giveweapon" );
    self addopt( "shotGuns_", 0, "Bulldog", ::giveiw6weapon, "iw6_maul_mp" );
    self addopt( "shotGuns_", 1, "FP6", ::giveiw6weapon, "iw6_fb6_mp" );
    self addopt( "shotGuns_", 2, "MTS-255", ::giveiw6weapon, "iw6_mts255_mp" );
    self addopt( "shotGuns_", 3, "Tac 12", ::giveiw6weapon, "iw6_uts15_mp" );
    self addMenu( "handGuns_", "Handguns", "id_giveweapon" );
    self addopt( "handGuns_", 0, "M9A1", ::giveiw6weapon, "iw6_m9a1_mp" );
    self addopt( "handGuns_", 1, "MP-443 Grach", ::giveiw6weapon, "iw6_mp443_mp" );
    self addopt( "handGuns_", 2, "P226", ::giveiw6weapon, "iw6_p226_mp" );
    self addopt( "handGuns_", 3, ".44 Magnum", ::giveiw6weapon, "iw6_magnum_mp" );
    self addopt( "handGuns_", 4, "PDW", ::giveiw6weapon, "iw6_pdw_mp" );
    self addMenu( "launcher_", "Launchers", "id_giveweapon" );
    self addopt( "launcher_", 0, "Kastet", ::giveiw6weapon, "iw6_rgm_mp" );
    self addopt( "launcher_", 1, "Panzerfaust", ::giveiw6weapon, "iw6_panzerfaust3_mp" );
    self addopt( "launcher_", 2, "MK32", ::giveiw6weapon, "iw6_mk32_mp" );

    self addmenu( "id_camomenu", "Camo Menu", "id_weaponMenu" );
    self addopt( "id_camomenu", 0, "None", ::giveiw6camo, 0 );
    self addopt( "id_camomenu", 1, "Snow", ::giveiw6camo, 27 );
    self addopt( "id_camomenu", 2, "Brush", ::giveiw6camo, 20 );
    self addopt( "id_camomenu", 3, "Autumn", ::giveiw6camo, 19 );
    self addopt( "id_camomenu", 4, "Ocean", ::giveiw6camo, 25 );
    self addopt( "id_camomenu", 5, "Scale", ::giveiw6camo, 28 );
    self addopt( "id_camomenu", 6, "Red", ::giveiw6camo, 26 );
    self addopt( "id_camomenu", 7, "Caustic", ::giveiw6camo, 21 );
    self addopt( "id_camomenu", 8, "Crocodile", ::giveiw6camo, 22 );
    self addopt( "id_camomenu", 9, "Green", ::giveiw6camo, 23 );
    self addopt( "id_camomenu", 10, "Net", ::giveiw6camo, 24 );
    self addopt( "id_camomenu", 11, "Trail", ::giveiw6camo, 29 );
    self addopt( "id_camomenu", 12, "Woodland", ::giveiw6camo, 30 );
    self addopt( "id_camomenu", 13, "Gold", ::giveiw6camo, 1 );
    self addopt( "id_camomenu", 14, "Leopard", ::giveiw6camo, 36 );
    self addopt( "id_camomenu", 15, "Abstract", ::giveiw6camo, 42 );
    self addopt( "id_camomenu", 16, "Hydra", ::giveiw6camo, 43 );
    self addopt( "id_camomenu", 17, "Skulls", ::giveiw6camo, 44 );
    self addopt( "id_camomenu", 18, "Tatto", ::giveiw6camo, 45 );
    self addopt( "id_camomenu", 19, "Nebula", ::giveiw6camo, 46 );
    self addopt( "id_camomenu", 20, "Flags", ::giveiw6camo, 41 );
    self addopt( "id_camomenu", 21, "Unicorn", ::giveiw6camo, 39 );
    self addopt( "id_camomenu", 22, "Heavy Metal", ::giveiw6camo, 38 );
    self addopt( "id_camomenu", 23, "Koi", ::giveiw6camo, 35 );
    self addopt( "id_camomenu", 24, "Fitness", ::giveiw6camo, 34 );
    self addopt( "id_camomenu", 25, "Extinction", ::giveiw6camo, 11 );
    self addopt( "id_camomenu", 26, "Bling", ::giveiw6camo, 8 );
    self addopt( "id_camomenu", 27, "Soap", ::giveiw6camo, 15 );
    self addopt( "id_camomenu", 28, "Blunt Force", ::giveiw6camo, 33 );
    self addopt( "id_camomenu", 29, "Hex", ::giveiw6camo, 9 );
    self addopt( "id_camomenu", 30, "Eyeballs", ::giveiw6camo, 32 );
    self addopt( "id_camomenu", 31, "1987", ::giveiw6camo, 16 );
    self addopt( "id_camomenu", 32, "Heartlands", ::giveiw6camo, 17 );
    self addopt( "id_camomenu", 33, "Molten", ::giveiw6camo, 14 );
    self addopt( "id_camomenu", 34, "Makarov", ::giveiw6camo, 13 );
    self addopt( "id_camomenu", 35, "Circuit", ::giveiw6camo, 31 );
    self addopt( "id_camomenu", 36, "Space Cats", ::giveiw6camo, 10 );
    self addopt( "id_camomenu", 37, "Cpt. Price", ::giveiw6camo, 37 );
    self addopt( "id_camomenu", 38, "Ducky", ::giveiw6camo, 40 );
    self addopt( "id_camomenu", 39, "Inferno", ::giveiw6camo, 7 );
    self addopt( "id_camomenu", 40, "Body Count", ::giveiw6camo, 18 );
    self addopt( "id_camomenu", 41, "Kiss of Death", ::giveiw6camo, 2 );
    self addopt( "id_camomenu", 42, "War Cry", ::giveiw6camo, 3 );
    self addopt( "id_camomenu", 43, "Festive", ::giveiw6camo, 12 );
    self addopt( "id_camomenu", 44, "Advanced Warfare", ::giveiw6camo, 6 );
    self addopt( "id_camomenu", 45, "Spector", ::giveiw6camo, 4 );
    self addopt( "id_camomenu", 46, "Ice", ::giveiw6camo, 5 );

    messageMenu = "id_messageMenu";
    self addMenu("id_messageMenu", "Message Menu", "main");
    self addOpt(messageMenu, 0, "Welcome", ::messageAllFunc, "^1Welcome to the modded lobby.");
    self addOpt(messageMenu, 1, "xbFlamzy", ::messageAllFunc, "^6xbFlamzy is the leading stealth service.");
    self addOpt(messageMenu, 2, "Xbox Shield Who?", ::messageAllFunc, "^2Xbox Shield Who?");
    self addOpt(messageMenu, 3, "xbCore Who?", ::messageAllFunc, "^4xbCore Who?");
    self addOpt(messageMenu, 4, "Fuck Off M8", ::messageAllFunc, "^6Fuck ^1Off ^1M8");
    self addOpt(messageMenu, 5, "Yes", ::messageAllFunc, "^9Yes");
    self addOpt(messageMenu, 6, "No", ::messageAllFunc, "^1No");
    self addOpt(messageMenu, 7, "Maybe", ::messageAllFunc, "^5Maybe");
    self addOpt(messageMenu, 8, "Trickshot Last", ::messageAllFunc, "^1Trickshot Last^7!");
    self addOpt(messageMenu, 9, "Max Level?", ::messageAllFunc, "^6Want Max Level Faggot");

    trickshotMenu = "id_trickshotMenu";
    self addMenu("id_trickshotMenu", "Trickshot Menu", "main");
    self addOpt(trickshotMenu, 0, "Save Location", ::savelocation);
    self addOpt(trickshotMenu, 1, "Load Location", ::loadlocation);
    self addOpt(trickshotMenu, 2, "Save / Load Bind", ::saveLoad);
    self addOpt(trickshotMenu, 3, "TDM Fast Last", ::tdmfastlast);
    self addOpt(trickshotMenu, 4, "FFA Fast Last", ::ffafastlast);
    self addOpt(trickshotMenu, 5, "SND Fast Last", ::sndLast);
    self addOpt(trickshotMenu, 6, "Nac Mod", ::ToggleNac);
    self addOpt(trickshotMenu, 7, "Reset Nac", ::resetNac);
    self addOpt(trickshotMenu, 8, "Drop Canswap", ::dropcanswap);
    self addOpt(trickshotMenu, 9, "Unlimited Equipment", ::UnlimitedEquipment);
    self addOpt(trickshotMenu, 10, "Mala Options", ::_loadMenu, "id_mala");

    malaMenu = "id_mala";
    self addMenu("id_mala", "Mala Options", "id_trickshotMenu");
    self addOpt(malaMenu, 0, "Stop Mala", ::stopMala);
    self addOpt(malaMenu, 1, "Flare", ::MalaShit, "flare_mp");
    self addOpt(malaMenu, 2, "Flash Grenade", ::MalaShit, "flash_grenade_mp");
    self addOpt(malaMenu, 3, "Concussion Grenade", ::MalaShit, "concussion_grenade_mp");
    self addOpt(malaMenu, 4, "Trophy System", ::MalaShit, "trophy_mp");
    self addOpt(malaMenu, 5, "EMP Grenade", ::MalaShit, "emp_grenade_mp");
    self addOpt(malaMenu, 6, "Motion Sensor", ::MalaShit, "motion_sensor_mp");
    self addOpt(malaMenu, 7, "Thermobaric Grenade", ::MalaShit, "thermobaric_grenade_mp");

    hostMenu = "id_hostMenu";
    self addMenu("id_hostMenu", "Host Menu", "main");
    //self addOpt(hostMenu, 0, "Force Host");//wait for slopp
    self addOpt(hostMenu, 0, "Print Angles", ::PrintAngles);
    self addOpt(hostMenu, 1, "Print Origins", ::PrintOrigin);

    allClientMenu = "id_allClientMenu";
    self addMenu("id_allClientMenu", "All Client Menu", "main");
    self addOpt(allClientMenu, 0, "All Client Main Mods", ::_loadMenu, "id_allClientMainMods");
    self addOpt(allClientMenu, 1, "All Client Stats", ::_loadMenu, "id_allClientStats");

    allClientMainMods = "id_allClientMainMods";
    self addMenu("id_allClientMainMods", "All Client Main Mods", "id_allClientMenu");
    self addOpt(allClientMainMods, 0, "All Godmode", ::allclientsgodmode);
    self addOpt(allClientMainMods, 1, "All Unlimited Ammo", ::AllClientUnlimitedAmmo);
    self addOpt(allClientMainMods, 2, "Kill All", ::KillAllClients);
    self addOpt(allClientMainMods, 3, "All Pro Mod", ::AllClientProMod);

    allClientStats = "id_allClientStats";
    self addMenu("id_allClientStats", "All Client Stats", "id_allClientMenu");
    self addOpt(allClientStats, 0, "All Level 60", ::AllClientLevel60);
    self addOpt(allClientStats, 1, "All Prestige 10 + Level 60", ::AllClientMaxPrestigeLevel);
    self addOpt(allClientStats, 2, "All Unlock All", ::AllClientUnlockAll);
    self addOpt(allClientStats, 3, "All Quick Derank", ::AllClientDerank);
    self addOpt(allClientStats, 4, "All Fuck Account", ::AllClientFuckAccount);
    self addOpt(allClientStats, 5, "All Max Squad Points", ::AllClientMaxSquadPoints, 2147483647);

    MenuSettings = "id_menuSettings";
    self addMenu(MenuSettings, "Menu Settings", "main");
    self addOpt(MenuSettings, 0, "Enable Spawn Text", ::SpawnTextEnable);
    self addOpt(MenuSettings, 1, "Background Color", ::_loadMenu, "id_bgColor");
    self addOpt(MenuSettings, 2, "Scrollbar Color", ::_loadMenu, "id_scrollColor");
    self addOpt(MenuSettings, 3, "Text Color", ::_loadMenu, "id_textColor");
    self addOpt(MenuSettings, 4, "Freeze In Menu", ::FreezeInMenu);
    self addOpt(MenuSettings, 5, "Disable Weapons In Menu", ::WeaponInMenu);

    bgColor = "id_bgColor";
    self addMenu("id_bgColor", "Background Color", "id_menuSettings");
    self addOpt(bgColor, 0, "Default Color", ::SetMenuColor, self.MenuColor["Black"]);
    self addOpt(bgColor, 1, "Red", ::SetMenuColor, self.MenuColor["Red"]);
    self addOpt(bgColor, 2, "Green", ::SetMenuColor, self.MenuColor["Green"]);
    self addOpt(bgColor, 3, "Blue", ::SetMenuColor, self.MenuColor["Blue"]);
    self addOpt(bgColor, 4, "Cyan", ::SetMenuColor, self.MenuColor["Cyan"]);
    self addOpt(bgColor, 5, "Yellow", ::SetMenuColor, self.MenuColor["Yellow"]);
    self addOpt(bgColor, 6, "Megenta", ::SetMenuColor, self.MenuColor["Megenta"]);

    scrollColor = "id_scrollColor";
    self addMenu("id_scrollColor", "Scrollbar Color", "id_menuSettings");
    self addOpt(scrollColor, 0, "Default Color", ::SetMenuColor, self.MenuColor["DarkPurple"]);
    self addOpt(scrollColor, 1, "Red", ::SetMenuColor, self.MenuColor["Red"]);
    self addOpt(scrollColor, 2, "Green", ::SetMenuColor, self.MenuColor["Green"]);
    self addOpt(scrollColor, 3, "Blue", ::SetMenuColor, self.MenuColor["Blue"]);
    self addOpt(scrollColor, 4, "Cyan", ::SetMenuColor, self.MenuColor["Cyan"]);
    self addOpt(scrollColor, 5, "Yellow", ::SetMenuColor, self.MenuColor["Yellow"]);
    self addOpt(scrollColor, 6, "Megenta", ::SetMenuColor, self.MenuColor["Megenta"]);

    textColor = "id_textColor";
    self addMenu("id_textColor", "Text Color", "id_menuSettings");
    self addOpt(textColor, 0, "Default", ::SetMenuColor, self.MenuColor["White"]);
    self addOpt(textColor, 1, "Red", ::SetMenuColor, self.MenuColor["Red"]);
    self addOpt(textColor, 2, "Green", ::SetMenuColor, self.MenuColor["Green"]);
    self addOpt(textColor, 3, "Blue", ::SetMenuColor, self.MenuColor["Blue"]);
    self addOpt(textColor, 4, "Cyan", ::SetMenuColor, self.MenuColor["Cyan"]);
    self addOpt(textColor, 5, "Yellow", ::SetMenuColor, self.MenuColor["Yellow"]);
    self addOpt(textColor, 6, "Megenta", ::SetMenuColor, self.MenuColor["Megenta"]);

    aimbotMenu = "id_aimbotMenu";
    self addMenu("id_aimbotMenu", "Aimbot Menu", "main");
    self addOpt(aimbotMenu, 0, "Lock On Aimbot", ::togglelockonaimbot);

    clientMenu = "id_clientMenu";
    self addMenu("id_clientMenu", "Client Menu", "main");
    for ( i = 0; i < level._id_5FD0.size; i++ )
    {
        player = level._id_5FD0[i];
        self addOpt(clientMenu, i, player._id_018C, ::_loadMenu, "playerMenu" + player._id_018C);

        mainClientMenu = "playerMenu" + player._id_018C;
        self addMenu(mainClientMenu, player._id_018C, "id_clientMenu");
        self addOpt(mainClientMenu, 0, player._id_018C + "'s Main Mods", ::_loadMenu, player._id_018C + "mainmods");
        self addOpt(mainClientMenu, 1, "Edit " + player._id_018C + "'s Stats", ::_loadMenu, player._id_018C + "stats");
        self addOpt(mainClientMenu, 2, player._id_018C + "'s Weapon Options", ::_loadMenu, player._id_018C + "weapon");
        self addOpt(mainClientMenu, 3, "Troll " + player._id_018C, ::_loadMenu, player._id_018C + "troll");
        self addOpt(mainClientMenu, 4, player._id_018C + " Trickshot Options", ::_loadMenu, player._id_018C + "trickshot");
        self addOpt(mainClientMenu, 5, player._id_018C + "'s Menu Access", ::_loadMenu, player._id_018C + "menuacess");

        clientMenuTS = player._id_018C + "trickshot";
        self addMenu(player._id_018C + "trickshot", player._id_018C + " Trickshot Options", "playerMenu" + player._id_018C);
        self addOpt(clientMenuTS, 0, "Give FFA Fast Last", ::GiveClientFFALast, player);
        self addOpt(clientMenuTS, 1, "Give TDM Fast Last", ::GiveClientTeamFastLast, player);

        clientMenuTroll = player._id_018C + "troll";
        self addMenu(player._id_018C + "troll", "Troll " + player._id_018C, "playerMenu" + player._id_018C);
        self addOpt(clientMenuTroll, 0, "Kill Player", ::KillPlayer, player);
        self addOpt(clientMenuTroll, 1, "Kick Player", ::KickPlayer, player);
        self addOpt(clientMenuTroll, 2, "Send Player To Space", ::SendPlayerToSpace, player);
        self addOpt(clientMenuTroll, 3, "Freeze Player", ::FreezeClient, player);
        self addOpt(clientMenuTroll, 4, "Teleport To You", ::TeleportClientToMe, player);
        self addOpt(clientMenuTroll, 5, "Launch Client", ::LaunchClient, player);

        clientWeaponOptions = player._id_018C + "weapon";
        self addMenu(clientWeaponOptions, player._id_018C + "'s Weapon Options", "playerMenu" + player._id_018C);
        self addOpt(clientWeaponOptions, 0, "Give " + player._id_018C + " A Weapon", ::_loadMenu, player._id_018C + "giveweapons");
        self addOpt(clientWeaponOptions, 1, "Change " + player._id_018C + "'s Camo", ::_loadMenu, player._id_018C + "camooptions");
        self addOpt(clientWeaponOptions, 2, "Take Clients Weapons", ::TakeClientsWeapons, player);

        clientGiveWeapon = player._id_018C + "giveweapons";
        self addMenu(player._id_018C + "giveweapons", "Give " + player._id_018C + " A Weapon", player._id_018C + "weapon");
        self addOpt(clientGiveWeapon, 0, "Give A Assault Rifle", ::_loadMenu, player._id_018C + "id_assualt");
        self addOpt(clientGiveWeapon, 1, "Give A Submachine Gun", ::_loadMenu, player._id_018C + "id_sub");
        self addOpt(clientGiveWeapon, 2, "Give A Lightmachine Gun", ::_loadMenu, player._id_018C + "id_light");
        self addOpt(clientGiveWeapon, 3, "Give A Sniper Rifle", ::_loadMenu, player._id_018C + "id_sniper");
        self addOpt(clientGiveWeapon, 4, "Give A Shotgun", ::_loadMenu, player._id_018C + "id_shotgun");
        self addOpt(clientGiveWeapon, 5, "Give A Marksman Rifles", ::_loadMenu, player._id_018C + "id_machine");
        self addOpt(clientGiveWeapon, 6, "Give A Handgun", ::_loadMenu, player._id_018C + "id_handgun");
        self addOpt(clientGiveWeapon, 7, "Give A Launcher", ::_loadMenu, player._id_018C + "id_launcher");

        clientAssualt =  player._id_018C + "id_assualt";
        self addMenu( player._id_018C + "id_assualt", "Give " +  player._id_018C + " A Assault Rifle",  player._id_018C + "giveweapons");
        self addopt( clientAssualt, 0, "SC-2010", ::GiveClientWeapon, player, "iw6_sc2010_mp" );
        self addopt( clientAssualt, 1, "SA-805", ::GiveClientWeapon, player, "iw6_bren_mp" );
        self addopt( clientAssualt, 2, "AK-12", ::GiveClientWeapon, player, "iw6_ak12_mp" );
        self addopt( clientAssualt, 3, "FAD", ::GiveClientWeapon, player, "iw6_fads_mp" );
        self addopt( clientAssualt, 4, "Remington R5", ::GiveClientWeapon, player, "iw6_r5rgp_mp" );
        self addopt( clientAssualt, 5, "MSBS", ::GiveClientWeapon, player, "iw6_msbs_mp" );
        self addopt( clientAssualt, 6, "Honey Badger", ::GiveClientWeapon, player, "iw6_honeybadger_mp" );
        self addopt( clientAssualt, 7, "ARX-160", ::GiveClientWeapon, player, "iw6_arx160_mp" );
        self addopt( clientAssualt, 8, "Maverick", ::GiveClientWeapon, player, "iw6_dlcweap01_mp" );

        clientSub = player._id_018C + "id_sub";
        self addMenu( player._id_018C +"id_sub", "Give " + player._id_018C + " A Submachine Gun", player._id_018C + "giveweapons");
        self addopt( clientSub, 0, "Bizon", ::GiveClientWeapon, player, "iw6_pp19_mp" );
        self addopt( clientSub, 1, "CBJ-MS", ::GiveClientWeapon, player, "iw6_cbjms_mp" );
        self addopt( clientSub, 2, "Vector CRB", ::GiveClientWeapon, player, "iw6_kriss_mp" );
        self addopt( clientSub, 3, "Vepr", ::GiveClientWeapon, player, "iw6_vepr_mp" );
        self addopt( clientSub, 4, "K7", ::GiveClientWeapon, player, "iw6_k7_mp" );
        self addopt( clientSub, 5, "MTAR-X", ::GiveClientWeapon, player, "iw6_microtar_mp" );
        self addopt( clientSub, 6, "Ripper", ::GiveClientWeapon, player, "iw6_dlcweap02_mp_dlcweap02scope" );

        clientLight = player._id_018C + "id_light";
        self addMenu( player._id_018C +"id_light", "Give " + player._id_018C + " A Lightmachine Gun", player._id_018C + "giveweapons");
        self addopt( clientLight, 0, "Ameli", ::GiveClientWeapon, player, "iw6_ameli_mp" );
        self addopt( clientLight, 1, "M27-IAR", ::GiveClientWeapon, player, "iw6_m27_mp" );
        self addopt( clientLight, 2, "LSAT", ::GiveClientWeapon, player, "iw6_lsat_mp" );
        self addopt( clientLight, 3, "Chain SAW", ::GiveClientWeapon, player, "iw6_kac_mp" );

        clientSniper = player._id_018C + "id_sniper";
        self addMenu( player._id_018C +"id_sniper", "Give " + player._id_018C + " A Sniper Rifle", player._id_018C + "giveweapons");
        self addopt( clientSniper, 0, "USR", ::GiveClientWeapon, player, "iw6_usr_mp_usrscope" );
        self addopt( clientSniper, 1, "L115", ::GiveClientWeapon, player, "iw6_l115a3_mp_l115a3scope" );
        self addopt( clientSniper, 2, "Lynx", ::GiveClientWeapon, player, "iw6_gm6_mp_gm6scope" );
        self addopt( clientSniper, 3, "VKS", ::GiveClientWeapon, player, "iw6_vks_mp_vksscope" );
        self addopt( clientSniper, 4, "Maverick-A2", ::GiveClientWeapon, player, "iw6_dlcweap03_mp_dlcweap03scope" );

        clientShotguns = player._id_018C + "id_shotgun";
        self addMenu( player._id_018C +"id_shotgun", "Give " + player._id_018C + " A Shotgun", player._id_018C + "giveweapons");
        self addopt( clientShotguns, 0, "Bulldog", ::GiveClientWeapon, player, "iw6_maul_mp" );
        self addopt( clientShotguns, 1, "FP6", ::GiveClientWeapon, player, "iw6_fb6_mp" );
        self addopt( clientShotguns, 2, "MTS-255", ::GiveClientWeapon, player, "iw6_mts255_mp" );
        self addopt( clientShotguns, 3, "Tac 12", ::GiveClientWeapon, player, "iw6_uts15_mp" );

        clientMachine = player._id_018C + "id_machine";
        self addMenu( player._id_018C +"id_machine", "Give " + player._id_018C + " A Machine Pistol", player._id_018C + "giveweapons");
        self addopt( clientMachine, 0, "MR-28", ::GiveClientWeapon, player, "iw6_g28_mp" );
        self addopt( clientMachine, 1, "MK14 EBR", ::GiveClientWeapon, player, "iw6_mk14_mp" );
        self addopt( clientMachine, 2, "IA-2", ::GiveClientWeapon, player, "iw6_imbel_mp" );
        self addopt( clientMachine, 3, "SVU", ::GiveClientWeapon, player, "iw6_svu_mp_svuscope" );

        clientHandgun = player._id_018C + "id_handgun";
        self addMenu( player._id_018C +"id_handgun", "Give " + player._id_018C + " A Handgun", player._id_018C + "giveweapons");
        self addopt( clientHandgun, 0, "M9A1", ::GiveClientWeapon, player, "iw6_m9a1_mp" );
        self addopt( clientHandgun, 1, "MP-443 Grach", ::GiveClientWeapon, player, "iw6_mp443_mp" );
        self addopt( clientHandgun, 2, "P226", ::GiveClientWeapon, player, "iw6_p226_mp" );
        self addopt( clientHandgun, 3, ".44 Magnum", ::GiveClientWeapon, player, "iw6_magnum_mp" );
        self addopt( clientHandgun, 4, "PDW", ::GiveClientWeapon, player, "iw6_pdw_mp" );

        clientLauchers = player._id_018C + "id_launcher";
        self addMenu( player._id_018C +"id_launcher", "Give " + player._id_018C + " A Launcher", player._id_018C + "giveweapons");
        self addopt( clientLauchers, 0, "Kastet", ::GiveClientWeapon, player, "iw6_rgm_mp" );
        self addopt( clientLauchers, 1, "Panzerfaust", ::GiveClientWeapon, player, "iw6_panzerfaust3_mp" );
        self addopt( clientLauchers, 2, "MK32", ::GiveClientWeapon, player, "iw6_mk32_mp" );

        clientCamoOptions = player._id_018C + "camooptions";
        self addMenu(player._id_018C + "camooptions", "Change " + player._id_018C + "'s Camo", player._id_018C + "weapon");
        self addopt( clientCamoOptions, 0, "None", ::GiveClientCamo, player, 0 );
        self addopt( clientCamoOptions, 1, "Snow", ::GiveClientCamo, player, 27 );
        self addopt( clientCamoOptions, 2, "Brush", ::GiveClientCamo, player, 20 );
        self addopt( clientCamoOptions, 3, "Autumn", ::GiveClientCamo, player, 19 );
        self addopt( clientCamoOptions, 4, "Ocean", ::GiveClientCamo, player, 25 );
        self addopt( clientCamoOptions, 5, "Scale", ::GiveClientCamo, player, 28 );
        self addopt( clientCamoOptions, 6, "Red", ::GiveClientCamo, player, 26 );
        self addopt( clientCamoOptions, 7, "Caustic", ::GiveClientCamo, player, 21 );
        self addopt( clientCamoOptions, 8, "Crocodile", ::GiveClientCamo, player, 22 );
        self addopt( clientCamoOptions, 9, "Green", ::GiveClientCamo, player, 23 );
        self addopt( clientCamoOptions, 10, "Net", ::GiveClientCamo, player, 24 );
        self addopt( clientCamoOptions, 11, "Trail", ::GiveClientCamo, player, 29 );
        self addopt( clientCamoOptions, 12, "Woodland", ::GiveClientCamo, player, 30 );
        self addopt( clientCamoOptions, 13, "Gold", ::GiveClientCamo, player, 1 );
        self addopt( clientCamoOptions, 14, "Leopard", ::GiveClientCamo, player, 36 );
        self addopt( clientCamoOptions, 15, "Abstract", ::GiveClientCamo, player, 42 );
        self addopt( clientCamoOptions, 16, "Hydra", ::GiveClientCamo, player, 43 );
        self addopt( clientCamoOptions, 17, "Skulls", ::GiveClientCamo, player, 44 );
        self addopt( clientCamoOptions, 18, "Tatto", ::GiveClientCamo, player, 45 );
        self addopt( clientCamoOptions, 19, "Nebula", ::GiveClientCamo, player, 46 );
        self addopt( clientCamoOptions, 20, "Flags", ::GiveClientCamo, player, 41 );
        self addopt( clientCamoOptions, 21, "Unicorn", ::GiveClientCamo, player, 39 );
        self addopt( clientCamoOptions, 22, "Heavy Metal", ::GiveClientCamo, player, 38 );
        self addopt( clientCamoOptions, 23, "Koi", ::GiveClientCamo, player, 35 );
        self addopt( clientCamoOptions, 24, "Fitness", ::GiveClientCamo, player, 34 );
        self addopt( clientCamoOptions, 25, "Extinction", ::GiveClientCamo, player, 11 );
        self addopt( clientCamoOptions, 26, "Bling", ::GiveClientCamo, player, 8 );
        self addopt( clientCamoOptions, 27, "Soap", ::GiveClientCamo, player, 15 );
        self addopt( clientCamoOptions, 28, "Blunt Force", ::GiveClientCamo, player, 33 );
        self addopt( clientCamoOptions, 29, "Hex", ::GiveClientCamo, player, 9 );
        self addopt( clientCamoOptions, 30, "Eyeballs", ::GiveClientCamo, player, 32 );
        self addopt( clientCamoOptions, 31, "1987", ::GiveClientCamo, player, 16 );
        self addopt( clientCamoOptions, 32, "Heartlands", ::GiveClientCamo, player, 17 );
        self addopt( clientCamoOptions, 33, "Molten", ::GiveClientCamo, player, 14 );
        self addopt( clientCamoOptions, 34, "Makarov", ::GiveClientCamo, player, 13 );
        self addopt( clientCamoOptions, 35, "Circuit", ::GiveClientCamo, player, 31 );
        self addopt( clientCamoOptions, 36, "Space Cats", ::GiveClientCamo, player, 10 );
        self addopt( clientCamoOptions, 37, "Cpt. Price", ::GiveClientCamo, player, 37 );
        self addopt( clientCamoOptions, 38, "Ducky", ::GiveClientCamo, player, 40 );
        self addopt( clientCamoOptions, 39, "Inferno", ::GiveClientCamo, player, 7 );
        self addopt( clientCamoOptions, 40, "Body Count", ::GiveClientCamo, player, 18 );
        self addopt( clientCamoOptions, 41, "Kiss of Death", ::GiveClientCamo, player, 2 );
        self addopt( clientCamoOptions, 42, "War Cry", ::GiveClientCamo, player, 3 );
        self addopt( clientCamoOptions, 43, "Festive", ::GiveClientCamo, player, 12 );
        self addopt( clientCamoOptions, 44, "Advanced Warfare", ::GiveClientCamo, player, 6 );
        self addopt( clientCamoOptions, 45, "Spector", ::GiveClientCamo, player, 4 );
        self addopt( clientCamoOptions, 46, "Ice", ::GiveClientCamo, player, 5 );

        clientMainMods = player._id_018C + "mainmods";
        self addMenu(clientMainMods, player._id_018C + "'s Main Mods", "playerMenu" + player._id_018C);
        self addOpt(clientMainMods, 0, "Give Godmode", ::GiveClientGodmode, player);
        self addOpt(clientMainMods, 1, "Give Unlimited Ammo", ::GiveClientUA, player);
        self addOpt(clientMainMods, 2, "Give All Perks", ::ClientGiveAllPerks, player);
        self addOpt(clientMainMods, 3, "Give Pro Mod", ::GiveClientProMod, player);
        self addOpt(clientMainMods, 4, "Give Speed x2", ::GiveClientSpeedx2, player);
        self addOpt(clientMainMods, 5, "Give Laser", ::GiveClientLaser, player);
        self addOpt(clientMainMods, 6, "Give Invisibility", ::GiveClientInvis, player);
        self addOpt(clientMainMods, 7, "Give Unlimited Equipment", ::GiveClientUnlimitedEquipment, player);
        self addOpt(clientMainMods, 8, "Change Clients Team", ::ChangeClientsTeam, player);

        clientStats = player._id_018C + "stats";
        self addMenu(clientStats, "Edit " + player._id_018C + "'s Stats", "playerMenu" + player._id_018C);
        self addOpt(clientStats, 0, "Give Level 60", ::GiveClientLevel60, player);
        self addOpt(clientStats, 1, "Give Prestige 10 + Level 60", ::GiveClientMaxPrestige, player);
        self addOpt(clientStats, 2, "Give Unlock All", ::GiveClientUnlockAll, player);
        self addOpt(clientStats, 3, "Give Quick Derank", ::GiveClientDerank, player);
        self addOpt(clientStats, 4, "Give Fuck Account", ::GiveClientFuckedAccount, player);
        self addOpt(clientStats, 5, "Give Max Squad Points", ::GiveClientMaxSquadPoints, player);
        self addOpt(clientStats, 6, "Take All Squad Points", ::TakeAllClientsSquadPoints, player);

        clientMennuAccess = player._id_018C + "menuacess";
        self addMenu(clientMennuAccess, player._id_018C + "'s Menu Access", "playerMenu" + player._id_018C);
        self addOpt(clientMennuAccess, 0, "Give Menu Access", ::set_client_status, player, 1);
        self addOpt(clientMennuAccess, 1, "Take Menu Access", ::set_client_status, player, 0);
    }
}

_scrollUpdate()
{
    if(self.Scroller<0)
    {
        self.Scroller = self.Menu.Text[self.Menu.CurrentMenu].size-1;
    }
    if(self.Scroller>self.Menu.Text[self.Menu.CurrentMenu].size-1)
    {
        self.Scroller = 0;
    }
    if(self.Menu.Slider[self.Menu.CurrentMenu][self.Scroller] > self.Menu.SliderMax[self.Menu.CurrentMenu][self.Scroller] )
    {
        self.Menu.Slider[self.Menu.CurrentMenu][self.Scroller] = self.Menu.SliderMin[self.Menu.CurrentMenu][self.Scroller];
    }
    if(self.Menu.Slider[self.Menu.CurrentMenu][self.Scroller] < self.Menu.SliderMin[self.Menu.CurrentMenu][self.Scroller])
    {
        self.Menu.Slider[self.Menu.CurrentMenu][self.Scroller] = self.Menu.SliderMax[self.Menu.CurrentMenu][self.Scroller];
    }

    self.scrolling_index = 0;
    self optStruct();
    ary = 0;

    if(self.Menu.Text[self.Menu.CurrentMenu].size > 11)
    {
        if(self.Scroller >= 11)
        ary   = self.Scroller - 11  + 1;
        final = "";
        for(e = 0; e < 11; e++ )
        {
            if(isDefined(self.Menu.Text[self.Menu.CurrentMenu][self.Scroller]))
            {
                final += self.Menu.Text[self.Menu.CurrentMenu][ary + e] + "^7\n";
            }
        }
    }
    else
    {
        final = "";
        for( e = 0 ;e < self.Menu.Text[self.Menu.CurrentMenu].size; e++)
        {
            if(isDefined(self.Menu.Text[self.Menu.CurrentMenu][e]))
            {
                final += self.Menu.Text[self.Menu.CurrentMenu][e] + "^7\n";
            }
        } 
    }

    self.Hud.Option _meth_82AC( final );
    self.Hud.Scrollbar._id_02DC = 100 + ( 15.6 * (self.Scroller < 11 ? self.Scroller : 10 ) );

}

_loadMenu(menu)
{
    self destroyMenuText();
    self.Menu.CurrentMenu = menu;
    self.Scroller = 0;
    self.Hud.TitleText _meth_82AC( self.Menu.title[ self.Menu.CurrentMenu ] );
    self createMenuText();
        self _scrollUpdate();

}

destroymenutext()
{
    if ( isdefined( self.Hud.Option ) )
        self.Hud.Option _meth_82C2();
}

QuickMods()
{
    if( !isDefined( self.QuickMods ) )
    {
        self.QuickMods = true;
        self thread Godmode();
        self thread UnlimitedAmmo();
        self thread ProMod();
        self thread GiveAllPerks();
        self thread NoSpread();
        self _meth_80C5( "Quick Mods ^4Enabled" );
    }
    else
    {
        self.QuickMods = undefined;
        self thread Godmode();
        self thread UnlimitedAmmo();
        self thread ProMod();
        self thread GiveAllPerks();
        self thread NoSpread();
        self _meth_80C5( "Quick Mods ^1Disabled" );
    }
}

Godmode()
{
    if( !isDefined( self.Godmode ) )
    {
        self.Godmode = true;
        self _meth_80C5( "Godmode ^4Enabled" );
        self thread _id_0569::_id_3CFB( "specialty_falldamage", 0 );
        while (isDefined( self.Godmode ))
        {
            self._id_0169 = 999999;
            self._id_010F = self._id_0169;
            wait 0.1;
        }
    }
    else
    {
        self.Godmode = undefined;
        self _meth_80C5( "Godmode ^1Disabled" );
        self._id_0169 = 100;
        self._id_010F = self._id_0169;
        self thread _id_0569::_id_0724( "specialty_falldamage" );
    }
}

UnlimitedAmmo()
{
    if( !isDefined( self.UnlimitedAmmo ) )
    {
        self.UnlimitedAmmo = true;
        self _meth_80C5( "Unlimited Ammo ^4Enabled" );
        while(isDefined( self.UnlimitedAmmo ))
        {
            self _meth_812C( self _meth_80F3(), 1337 );
            wait 0.1;
        }
    }
    else
    {
        self.UnlimitedAmmo = undefined;
        self _meth_80C5( "Unlimited Ammo ^1Disabled" );
    }
}

ThirdPerson()
{
    if ( !isDefined( self.ThirdPerson ) )
    {
        self.ThirdPerson = 1;
        _func_0017( "camera_thirdPerson", 1 );
        self _meth_80C5( "Third Person ^4Enabled" );
    }
    else
    {
        self.ThirdPerson = undefined;
        _func_0017( "camera_thirdPerson", 0 );
        self _meth_80C5( "Third Person ^1Disabled" );
    }
}

ProMod()
{
    if ( !isDefined( self.ProMod ) )
    {
        self.ProMod = 1;
        self _meth_8132( "cg_fovscale", 2 );
        self _meth_80C5( "Pro Mod ^4Enabled" );
    }
    else
    {
        self.ProMod = undefined;
        self _meth_8132( "cg_fovscale", 1 );
        self _meth_80C5( "Pro Mod ^1Disabled" );
    }
}

Speedx2()
{
    if ( !isDefined( self.Speedx2 ) )
    {
        self.Speedx2 = true;
        self _meth_80C5( "Speed X2 ^4Enabled" );
        while(isDefined( self.Speedx2 ))
        {
            self _meth_808C( 2 );
            wait .025;
        }
    }
    else
    {
        self.Speedx2 = undefined;
        self _meth_808C( 1 );
        self _meth_80C5( "Speed X2 ^1Disabled" );
    }
}

noclip()
{
    if ( !isdefined( self.noclip ) )
    {
        self.noclip = 1;
        self thread nocliptoggled();
        self _meth_80C5( "UFO Mode ^4Enabled" );
    }
}

nocliptoggled()
{
    self endon( "stop_noClip" );
    var_0 = _func_002D( "script_origin", self._id_01AE );
    self _meth_8014( var_0 );
    self.noclipp = 1;

    self.isMenuOpen = false; 
    self thread menuHudDestroy();

    for (;;)
    {
        var_1 = _func_0066( self _meth_8104() );
        var_2 = ( var_1[0] * 60, var_1[1] * 60, var_1[2] * 60 );

        if ( self _meth_8106() )
            var_0._id_01AE = var_0._id_01AE + var_2;

        if ( self _meth_8107() )
            var_0._id_01AE = var_0._id_01AE - var_2;

        if ( self _meth_8108() )
            break;

        wait 0.05;
    }

    var_0 _meth_802B();
    self.noclipp = undefined;
    self.noclip = undefined;
    self _meth_80C5( "UFO Mode ^1Disabled" );

    foreach ( var_0 in self.menu["Clip"] )
        var_0 _meth_82C2();
}

Invis()
{
    if ( !isDefined( self.Invis ) )
    {
        self.Invis = true;
        self _meth_80C5( "Invisibility ^4Enabled" );
        self _meth_82E9();
    }
    else
    {
        self.Invis = undefined;
        self _meth_80C5( "Invisibility ^1Disabled" );
        self _meth_82E8();
    }
}

changeTeam()
{
    if( self._id_01C2["team"] == "allies" )
    {
        _id_05D5::_id_099C( "axis", true );
        self _meth_80C5( "Team switched to ^4axis" );
    }
    else if( self._id_01C2["team"] == "axis" )
    {
        _id_05D5::_id_099C( "allies", true );
        self _meth_80C5( "Team switched to ^4allies" );
    }
}

NoSpread()
{
    if(!isDefined(self.NoSpread))
    {
       self.NoSpread = true;
       _func_0017( "perk_weapSpreadMultiplier", 0.01 );
       self thread _id_0569::_id_3CFB( "specialty_bulletaccuracy", 0 );
       self _meth_80C5( "No Spread ^4Enabled" );
    }
    else
    {
       self.NoSpread = undefined;
       _func_0017( "perk_weapSpreadMultiplier", 0.65 );
       self _meth_80C5( "No Spread ^1Disabled" );
    }
}

giveallperks()
{
    if( !isDefined( self.allPerks ) )
    {
        self.allPerks = true;
        var_0 = _func_0070( "specialty_fastreload;specialty_falldamage;specialty_marathon;specialty_fastsprintrecovery;specialty_pitcher;specialty_sprintreload;specialty_silentkill;specialty_paint;specialty_extra_equipment;specialty_gambler;specialty_stun_resistance;specialty_hardline;specialty_blindeye;specialty_sharp_focus;specialty_quickswap;specialty_bulletaccuracy;specialty_quieter;specialty_scavenger;specialty_detectexplosive;specialty_selectivehearing;specialty_regenfaster;specialty_blastshield;specialty_extra_deadly;specialty_extraammo;specialty_boom;specialty_incog;specialty_twoprimaries;specialty_extra_attachment;specialty_stalker;specialty_quickdraw;specialty_gpsjammer;specialty_comexp;specialty_explosivedamage;specialty_deadeye", ";" );
        foreach ( var_2 in var_0 )
            self thread _id_0569::_id_3CFB( var_2, 0 );

        self _meth_80C5( "All Perks ^4Given" );
    }
    else
    {
        self.allPerks= undefined;
        var_0 = _func_0070( "specialty_fastreload;specialty_falldamage;specialty_marathon;specialty_fastsprintrecovery;specialty_pitcher;specialty_sprintreload;specialty_silentkill;specialty_paint;specialty_extra_equipment;specialty_gambler;specialty_stun_resistance;specialty_hardline;specialty_blindeye;specialty_sharp_focus;specialty_quickswap;specialty_bulletaccuracy;specialty_quieter;specialty_scavenger;specialty_detectexplosive;specialty_selectivehearing;specialty_regenfaster;specialty_blastshield;specialty_extra_deadly;specialty_extraammo;specialty_boom;specialty_incog;specialty_twoprimaries;specialty_extra_attachment;specialty_stalker;specialty_quickdraw;specialty_gpsjammer;specialty_comexp;specialty_explosivedamage;specialty_deadeye", ";" );

        foreach ( var_2 in var_0 )
            self thread _id_0569::_id_0724( var_2 );

        self _meth_80C5( "All Perks ^1Taken" );
    }
}

killme()
{
    self _meth_80C3();
}

givemestreaks( streak )
{
    _id_060C::_id_3CF2( streak, 0, 0, self );
    self _meth_80C5( streak + " has been ^4given" );
}

takeallstreaks()
{
    _id_060C::_id_1D45();
    self _meth_80C5( "Killstreaks ^4Cleared" );
}

InstaReload()
{
    if(!isDefined( self.InstaReload ))
    {
        self.InstaReload = true;
        _func_0017( "perk_weapReloadMultiplier", .1 );
        self thread _id_0569::_id_3CFB("specialty_fastreload", false );
        self _meth_80C5( "Insta Reload ^4Enabled" );
    }
    else
    {
        self.InstaReload = undefined;
        _func_0017( "perk_weapReloadMultiplier", 1 );
        self _meth_80C5( "Insta Reload ^1Disabled" );
    }
}

laser()
{
    if ( !isdefined( self.laser ) )
    {
        self.laser = 1;
        self _meth_80C5( "Laser ^4Enabled" );
        self _meth_802D();
    }
    else
    {
        self.laser = undefined;
        self _meth_80C5( "Laser ^1Disabled" );
        self _meth_802E();
    }
}

//Fun Menu
frogeModeStart()
{
    if(!isdefined(self.forgeMode))
    {
        self.forgeMode = true;
        self _meth_80C5( "Forge Mode ^4Enabled" );
        self thread forgeMode();
    }
    else 
    {
        self.forgeMode = undefined;
        self _meth_80C5( "Forge Mode ^1Disabled" );
        self notify("stop_forgeMode");
    }
}

forgeMode()
{
    self endon("stop_forgeMode");
    
    for(;;)
    {
        while(self _meth_8107())
        {
            myTrace = _func_0030( self _meth_806D( "j_head" ), self _meth_806D( "j_head" ) + _func_0066( self _meth_8104() ) * 1000000, true, self );
            while(self _meth_8107())
            {
                myTrace["entity"] _meth_8101( self _meth_806D( "j_head" ) + _func_0066( self _meth_8104() ) * 150 );
                myTrace["entity"].origin = self _meth_806D( "j_head" ) + _func_0066( self _meth_8104() ) * 150;
                wait 0.05;
            }
        }
        wait 0.05;
    }
}

Specnade()
{
    if(!isDefined(self.SpecNade))
    {
        self.SpecNade = true;
        self _meth_80C5("Spec Nade ^4Enabled");
        self thread SpecNadeToggled();
    }
    else 
    {
        self.SpecNade = undefined;
        self notify("stop_specnade");
        self _meth_80C5("Spec Nade ^1Disabled");
    }
}

SpecNadeToggled()
{
    self endon("death");
    self endon("stop_specnade");
    for(;;)
    {
        self waittill("grenade_fire", Grenade);
        self._id_0169 = 9999999;
        self._id_010F    = self._id_0169;
        self _meth_8011();
        self _meth_8014( Grenade );
        self _meth_82E9();
        self _meth_8103( _func_0060( Grenade._id_01AE - self._id_01AE ) );
        Grenade waittill("explode");
        self._id_0169 = 100;
        self._id_010F    = self._id_0169;
        self _meth_8011();
        self _meth_82E8();
    }
}

AutoDropShot()
{
    if ( !isdefined( self.AutoDrop ) )
    {
        self.AutoDrop = true;
        self endon( "stop_dropshot" );
        self _meth_80C5( "Auto Dropshot ^4Enabled" );

        while ( isdefined( self.AutoDrop ) )
        {
            self waittill( "weapon_fired" );
            self _meth_806A( "prone" );
            wait 0.01;
        }
    }
    else
    {
        self.AutoDrop = undefined;
        self _meth_80C5( "Auto Dropshot ^1Disabled" );
        self notify( "stop_dropshot" );
    }
}

earthquake_()
{
    _func_008F( 0.6, 10, self._id_01AE, 100000 );
    self _meth_80C5( "^1Its a fucking earthquake" );
}

CloneMe()
{
    self _meth_80C9( 1 );
    self _meth_80C5( "^4Cloned" );
}

DeadClone()
{
    var_0 = self _meth_80C9( 1 );
    var_0 _meth_831B( 999 );
    self _meth_80C5( "Dead Clone ^4Spawned" );
}

LaunchMe()
{
    var_0 = _func_0066( self _meth_8104() );
    self _meth_80EC( _func_0066( self _meth_8104() ) + ( var_0[0], var_0[1], 10000 ) );
    self _meth_80C5( "^4Launched" );
}

StartTeleGun()
{
    if ( !isdefined( self.TeleportGun ) )
    {
        self.TeleportGun = true;
        self thread TeleportGun();
        self _meth_80C5( "Teleport Gun ^4Enabled" );
    }
    else
    {
        self.TeleportGun = undefined;
        self notify( "stop_telgun" );
        self _meth_80C5( "Teleport Gun ^1Disabled" );
    }
}

TeleportGun()
{
    self endon( "stop_telgun" );

    for (;;)
    {
        self waittill( "weapon_fired" );
        self _meth_8101( _func_0030( self _meth_806D( "j_head" ), self _meth_806D( "j_head" ) + _func_0066( self _meth_8104() ) * 1000000, 0, self )["position"] );
        wait 0.1;
    }
}

BunnyHop()
{
    if ( !isdefined( self.Bunny ) )
    {
        self.Bunny = true;
        self _meth_80C5( "Bunny Hop ^4Enabled" );
        self thread jumpbunny();
    }
    else
    {
        self.Bunny = undefined;
        self _meth_80C5( "Bunny Hop ^1Disabled" );
        self notify( "stop_bunny" );
    }
}

JumpBunny()
{
    self endon( "stop_bunny" );

    for (;;)
    {
        while ( self _meth_810A() )
        {
            wait 0.01;
            var_0 = self _meth_8102();
            self _meth_80EC( ( var_0[0], var_0[1], 400 ) );
            wait 0.01;
        }

        while ( !self _meth_810A() )
            wait 0.05;

        wait 0.05;
    }
}

rocketride()
{
    if ( !isdefined( self.rocketride ) )
    {
        self.rocketride = 1;
        self _meth_80C5( "Rocket Ride ^4Enabled" );
        self.storeweapon = self _meth_80F3();
        wait 0.1;
        self _meth_80F0( "iw6_panzerfaust3_mp" );
        self _meth_80F8( "iw6_panzerfaust3_mp" );
        self endon( "stop_rpgRide" );

        while ( isdefined( self.rocketride ) )
        {
            self waittill( "missile_fire", var_0, var_1 );

            if ( var_1 == "iw6_panzerfaust3_mp" )
            {
                self _meth_8005();
                self _meth_8014( var_0 );
            }

            wait 0.01;
        }
    }
    else
    {
        self.rocketride = undefined;
        self notify( "stop_rpgRide" );
        self _meth_80C5( "Rocket Ride ^1Disabled" );
        self _meth_80F1( self _meth_80F3() );
        wait 0.1;
        self _meth_80F0( self.storeweapon );
        self _meth_80F8( self.storeweapon );
    }
}

frogger()
{
    if ( !isdefined( self.frogger ) )
    {
        self.frogger = 1;
        self _meth_80C5( "Frogger ^4Enabled" );
        self thread jumpfrogger();
    }
    else
    {
        self.frogger = undefined;
        self _meth_80C5( "Frogger ^1Disabled" );
        self notify( "stop_frogger" );
    }
}

jumpfrogger()
{
    self endon( "stop_frogger" );

    while ( isdefined( self.frogger ) )
    {
        if ( self _meth_83AB() )
        {
            var_0 = _func_0066( self _meth_8104() );
            self _meth_8101( self._id_01AE + _func_0045( 0, 0, 5 ) );
            self _meth_80EC( ( var_0[0] * 700, var_0[1] * 700, 400 ) );
        }

        wait 0.05;
    }
}

explosivebullets()
{
    if ( !isdefined( self.explosivebullets ) )
    {
        self.explosivebullets = 1;
        self _meth_80C5( "Explosive Bullets ^4Enabled" );
        self endon( "stop_ebDude" );

        while ( isdefined( self.explosivebullets ) )
        {
            self waittill( "weapon_fired" );
            var_0 = self _meth_806D( "J_head" );
            var_1 = _func_0030( var_0, var_0 + _func_0066( self _meth_8104() ) * 100000, 1, self )["position"];
            _func_008F( 0, 0, var_1, 100 );
            _func_008C( var_1, 200, 600, 600, self );
        }
    }
    else
    {
        self.explosivebullets = undefined;
        self notify( "stop_ebDude" );
        self _meth_80C5( "Explosive Bullets ^1Disabled" );
    }
}

//Account Menu
level60()
{
    self _meth_80B5( "squadMembers", 0, "squadMemXP", 1230000 );
    self _meth_80C5( "Level 60 ^4Set" );
}

maxprestige()
{
    for ( var_0 = 0; var_0 < 10; var_0++ )
    {
        self _meth_8420( "squadMembers", var_0, "squadMemXP", 1230000 );
        self _meth_8420( "characterXP", var_0, _func_012D() );
        self _meth_80B5( "experience", 1230000 );
    }
    self _meth_8420( "prestigeLevel", 10 );

    self _meth_80C5( "Max Level ^4Set" );
}

derankself()
{
    for ( var_0 = 0; var_0 < 10; var_0++ )
    {
        self _meth_80B5( "squadMembers", var_0, "squadMemXP", 0 );
        self _meth_80B5( "characterXP", var_0, _func_012D() );
        self _meth_8420( "prestigeLevel", 0 );
    }

    self _meth_80C5( "Derank ^4Set" );
}

completeallchallenges( var_0 )
{
    self _meth_80C5( "Unlcok All ^4Starting" );
    foreach ( var_7, var_2 in level._id_1AC5 )
    {
        var_3 = 0;
        var_4 = 0;

        for ( var_5 = 1; isdefined( var_2["targetval"][var_5] ); var_5++ )
        {
            var_3 = var_2["targetval"][var_5];
            var_4 = var_5 + 1;
        }

        if ( _id_0569::_id_50C1() )
        {
            self _meth_80B5( "challengeProgress", var_7, var_3 + 1 );
            self _meth_80B5( "challengeState", var_7, var_4 + 1 );
        }
        else
        {
            var_6 = _func_00E4();
            var_6.name = var_7;
            var_6.type = _func_00BA( _id_05D0::_id_39BA(), 0, var_7, 11 );
            var_6.optionalnumber = var_4;
            var_6.sound = _func_00BA( _id_05D0::_id_39BA(), 0, var_7, 9 );
        }

        wait 0.05;
    }

    self _meth_80C5( "Unlcok All ^4Done" );
}

editsquadpoints( var_0 )
{
    self _meth_80B5( "unlockPoints", var_0 );
    self _meth_80C5( "Squad points set ^4" + var_0 );
}

changeClassNames()
{
    self _meth_80B5( "squadMembers", 0, "name", "^1xbFlamzy     " );
    self _meth_80B5( "squadMembers", 1, "name", "^2xbFlamzy     " );
    self _meth_80B5( "squadMembers", 2, "name", "^3xbFlamzy     " );
    self _meth_80B5( "squadMembers", 3, "name", "^4xbFlamzy     " );
    self _meth_80B5( "squadMembers", 4, "name", "^5xbFlamzy     " );
    self _meth_80B5( "squadMembers", 5, "name", "^6xbFlamzy     " );
    self _meth_80B5( "squadMembers", 6, "name", "^7xbFlamzy     " );
    self _meth_80B5( "squadMembers", 7, "name", "^8xbFlamzy     " );
    self _meth_80B5( "squadMembers", 8, "name", "^9xbFlamzy     " );
    self _meth_80B5( "squadMembers", 9, "name", "^0xbFlamzy     " );
    self _meth_80C5("Colored Classes ^4Set");
}

NormalStats()
{
    self _meth_80B5("kills", 53821);
    self _meth_80B5("deaths", 39210);
    self _meth_80B5("wins", 2198);
    self _meth_80B5("losses", 1028);
    self _meth_80B5("gamesPlayed", 3236);
    self _meth_80B5("prestigeShopTokens", 7);
    self _meth_80B5("hits", 8755765);
    self _meth_80B5("misses", 765765765);
    self _meth_80B5("score", 1953246);
    self _meth_80B5("ties", 10);
    self _meth_80B5("assists", 80);
    self _meth_80B5("winStreak", 5);
    self _meth_80B5("killStreak", 21);
    self _meth_80B5("headshots", 7921);
    self _meth_80C5("Normal stats ^4Set");
}

HighStats()
{
    self _meth_80B5("kills", 98321);
    self _meth_80B5("deaths", 28712);
    self _meth_80B5("wins", 7212);
    self _meth_80B5("losses", 3243);
    self _meth_80B5("gamesPlayed", 10455);
    self _meth_80B5("prestigeShopTokens", 1000);
    self _meth_80B5("hits", 76465465);
    self _meth_80B5("misses", 65465445);
    self _meth_80B5("score", 575765776);
    self _meth_80B5("ties", 35);
    self _meth_80B5("assists", 4234);
    self _meth_80B5("winStreak", 24);
    self _meth_80B5("killStreak", 41);
    self _meth_80B5("headshots", 39435);
    self _meth_80C5("High stats ^4Set");
}

HackerStats()
{
    self _meth_80B5("kills", 2147483647);
    self _meth_80B5("deaths", 0);
    self _meth_80B5("wins", 2147483647);
    self _meth_80B5("losses", 0);
    self _meth_80B5("gamesPlayed", 2147483647);
    self _meth_80B5("prestigeShopTokens", 2147483647);
    self _meth_80B5("hits", 2147483647);
    self _meth_80B5("misses", 0);
    self _meth_80B5("score", 2147483647);
    self _meth_80B5("ties", 2147483647);
    self _meth_80B5("assists", 2147483647);
    self _meth_80B5("winStreak", 2147483647);
    self _meth_80B5("killStreak", 2147483647);
    self _meth_80B5("headshots", 2147483647);
    self _meth_80C5("Hacker Stats ^4Set");
}

//Lobby Menu
longKnife()
{
    if ( !isdefined( self.longknife ) )
    {
        self.longknife = true;
        _func_0017( "player_meleeHeight", "999" );
        _func_0017( "player_meleeRange", "999" );
        _func_0017( "player_meleeWidth", "999" );
        self _meth_80C5( "Long Knife ^4Enabled" );
    }
    else
    {
        self.longknife = undefined;
        _func_0017( "player_meleeHeight", "10" );
        _func_0017( "player_meleeRange", "64" );
        _func_0017( "player_meleeWidth", "10" );
        self _meth_80C5( "Long Knife ^1Disabled" );
    }
}

AntiEndGame()
{
    if( !isDefined( self.antiEndGame ) )
    {
        self.antiEndGame = true;
        level._id_34D1 = true;
        self _meth_80C5( "Anti End Game ^4Enabled" );
    }
    else 
    {
        self.antiEndGame = undefined;
        level._id_34D1 = false;
        self _meth_80C5( "Anti End Game ^1Disabled" );
    }
}

superspeed()
{
    if ( !isdefined( self.superspeed ) )
    {
        self.superspeed = true;
        self _meth_80C5( "Super Speed ^4Enabled" );

        while(isDefined( self.superspeed ))
        {
            foreach ( player in level._id_5FD0 )
                player _meth_808C( 2 );
            wait .1;
        }
    }
    else
    {
        self.superspeed = undefined;
        self _meth_80C5( "Super Speed ^1Disabled" );

        foreach ( player in level._id_5FD0 )
            player _meth_808C( 1 );
    }
}

superjump()
{
    if ( !isdefined( self.superjump ) )
    {
        self.superjump = 1;
        self _meth_80C5( "Super Jump ^4Enabled" );
        self thread jumpsuper( _func_0045( 6 ) );
    }
    else
    {
        self.superjump = undefined;
        self _meth_80C5( "Super Jump ^1Disabled" );
    }
}

jumpsuper( var_0 )
{
    self endon( "stop_superJump" );
    wait 0.01;

    while ( isdefined( self.superjump ) )
    {
        foreach ( var_2 in level._id_5FD0 )
        {
            if ( var_2 _meth_83AB() && !var_2 _meth_810A() )
            {
                var_2 _meth_80EC( var_2 _meth_8102() + ( 0, 0, 250 * var_0 ) );
                wait 0.05;
            }
        }

        wait 0.01;
    }
}

EndLobby()
{
    thread _id_05C4::_id_2D54( "tie", game["end_reason"]["host_ended_game"] );
}

RestartMatch()
{
    _func_0107( 0 );
}

unlimitedgame()
{
    if ( !isdefined( self.unlimitedgame ) )
    {
        self.unlimitedgame = true;
        _func_0017( "scr_" + level._id_3706 + "_timeLimit", 999999 );
        _func_0017( "scr_" + level._id_3706 + "_scoreLimit", 999999 );
        self _meth_80C5( "Unlimited Game ^4Enabled" );
    }
    else
    {
        self.unlimitedgame = undefined;
        _func_0017( "scr_" + level._id_3706 + "_timeLimit", 10 );
        _func_0017( "scr_" + level._id_3706 + "_scoreLimit", 7500 );
        self _meth_80C5( "Unlimited Game ^1Disabled" );
    }
}

nofalldamage()
{
    if ( !isdefined( self.nofalldamage ) )
    {
        self.nofalldamage = true;
        self _meth_80C5( "No Fall Damge ^4Enabled" );

        while(isDefined( self.nofalldamage ))
        {
            foreach ( var_1 in level._id_5FD0 )
                var_1 thread _id_0569::_id_3CFB( "specialty_falldamage", 0 );
            wait .1;
        }
    }
    else
    {
        self.nofalldamage = undefined;
        self _meth_80C5( "No Fall Damge ^1Disabled" );

        foreach ( var_1 in level._id_5FD0 )
            var_1 thread _id_0569::_id_0724( "specialty_falldamage" );
    }
}

longkillcams()
{
    if ( !isdefined( self.longkillcams ) )
    {
        self.longkillcams = true;
        _func_0017( "scr_killcam_time", 600 );
        self _meth_80C5( "Long Kill Cams ^4Enabled" );
    }
    else
    {
        self.longkillcams = undefined;
        _func_0017( "scr_killcam_time", 5 );
        self _meth_80C5( "Long Kill Cams ^1Disabled" );
    }
}

abortforfeit()
{
    if ( !isdefined( self.abortforfeit ) )
    {
        self.abortforfeit = true;
        self endon( "stop_thisshit" );
        self _meth_80C5( "Disable Forfeit ^4Enabled" );

        for (;;)
        {
            level notify( "abort_forfeit" );
            wait 0.1;
        }
    }
    else
    {
        self.abortforfeit = undefined;
        self notify( "stop_thisshit" );
        self _meth_80C5( "Disable Forfeit ^1Disabled" );
    }
}

antijoin()
{
    if ( !isdefined( self.antijoin ) )
    {
        self.antijoin = true;
        _func_0017( "g_password", "xbFlamzy" );
        self _meth_80C5( "Anti Join ^4Enabled" );
    }
    else
    {
        self.antijoin = undefined;
        _func_0017( "g_password", "" );
        self _meth_80C5( "Anti Join ^1Disabled" );
    }
}

BigXp()
{
    if( !isDefined( self.BigXP ) )
    {
        self.BigXP = true;
        level._id_8E7A = 4;//After 4 will cause exit level
    }
    else 
    {
        self.BigXP = undefined;
        level._id_8E7A = 1;
    }
}
rankedlobby()
{
    if ( !isdefined( self.rankedlobby ) )
    {
        self.rankedlobby = 1;
        _func_0017( "onlinegame", 1 );
        _func_0017( "ui_ranked", 1 );
        _func_0017( "xblive_rankedmatch", 1 );
        _func_0017( "xblive_privatematch", 0 );
        _func_0017( "scr_forcerankedmatch", 1 );
        level._id_594D = 1;
        level._id_634A = 1;
        self _meth_80C5( "Online Lobby ^4Enabled" );

        if ( self.botmon == 0 )
        {
            self.botmon = 1;

            for (;;)
            {
                self notify( "bot_connect_monitor" );
                level notify( "bot_connect_monitor" );
                wait 0.1;
            }
        }
    }
    else
    {
        self.rankedlobby = undefined;
        _func_0017( "onlinegame", 0 );
        _func_0017( "ui_ranked", 0 );
        _func_0017( "xblive_rankedmatch", 0 );
        _func_0017( "xblive_privatematch", 1 );
        _func_0017( "scr_forcerankedmatch", 0 );
        level._id_594D = 0;
        level._id_634A = 0;
        self _meth_80C5( "Online Lobby ^1Disabled" );
    }
}

spawnallybot( var_0 )
{
    thread maps\mp\bots\_bots::_id_778F( var_0, "allies", undefined, undefined, "spawned", _func_024A( 1 ) );
    self _meth_80C5( var_0 + " ^4bots spawned " );

    if ( self.botmon == 0 )
    {
        self.botmon = 1;

        for (;;)
        {
            self notify( "bot_connect_monitor" );
            level notify( "bot_connect_monitor" );
            wait 0.1;
        }
    }
}

spawnaxisbot( var_0 )
{
    thread maps\mp\bots\_bots::_id_778F( var_0, "axis", undefined, undefined, "spawned", _func_024A( 1 ) );
    self _meth_80C5( var_0 + " ^4bots spawned " );

    if ( self.botmon == 0 )
    {
        self.botmon = 1;

        for (;;)
        {
            self notify( "bot_connect_monitor" );
            level notify( "bot_connect_monitor" );
            wait 0.1;
        }
    }
}

freezebots()
{
    if ( !isdefined( self.freezebots ) )
    {
        self.freezebots = 1;
        self _meth_80C5( "Bots ^4Frozen" );

        foreach ( var_1 in level._id_032C )
        {
            if ( isdefined( var_1._id_01C2["isBot"] ) && var_1._id_01C2["isBot"] )
                var_1 _meth_811F( 1 );
        }
    }
    else
    {
        self.freezebots = undefined;
        self _meth_80C5( "Bots ^4Unfrozen" );

        foreach ( var_1 in level._id_032C )
        {
            if ( isdefined( var_1._id_01C2["isBot"] ) && var_1._id_01C2["isBot"] )
                var_1 _meth_811F( 0 );
        }
    }
}

bottome()
{
    self _meth_80C5( "Bots ^4teleported to me" );

    foreach ( var_1 in level._id_5FD0 )
    {
        if ( isdefined( var_1._id_01C2["isBot"] ) && var_1._id_01C2["isBot"] )
            var_1 _meth_8101( self._id_01AE + ( 20, 0, 0 ), 1 );
    }
}

botstocrosshair()
{
    self _meth_80C5( "Bots ^4teleported to crosshairs" );
    var_0 = self _meth_806D( "J_head" );
    var_1 = _func_0030( var_0, var_0 + _func_0066( self _meth_8104() ) * 100000, 1, self )["position"];

    foreach ( var_3 in level._id_5FD0 )
    {
        if ( isdefined( var_3._id_01C2["isBot"] ) && var_3._id_01C2["isBot"] )
            var_3 _meth_8101( var_1 );
    }
}

kickbots()
{
    self _meth_80C5( "Bots ^4Kicked" );

    foreach ( var_1 in level._id_5FD0 )
    {
        if ( isdefined( var_1._id_01C2["isBot"] ) && var_1._id_01C2["isBot"] )
            _func_0130( var_1 _meth_807A(), "EXE_PLAYERKICKED_INACTIVE" );
    }
}

killbots()
{
    self _meth_80C5( "Bots ^4Killed" );

    foreach ( var_1 in level._id_5FD0 )
    {
        if ( isdefined( var_1._id_01C2["isBot"] ) && var_1._id_01C2["isBot"] )
            var_1 _meth_80C3();
    }
}

//Weapon Menu
giveiw6weapon( var_0 )
{
    self _meth_80F1( self _meth_80F3() );
    wait 0.1;
    self _meth_80F0( var_0 );
    self _meth_80F8( var_0 );
    self _meth_80C5( "Given ^4" + var_0 );
}

giveiw6camo( var_0 )
{
    var_1 = _id_0569::_id_3A37( self _meth_80F3() );
    self _meth_80F1( self _meth_80F3() );
    wait 0.1;

    if ( var_0 < 10 )
    {
        self _meth_80F0( var_1 + "_mp_camo0" + var_0 );
        self _meth_80F8( var_1 + "_mp_camo0" + var_0 );
        self _meth_80C5( "Camo ^4Given" );
    }
    else
    {
        self _meth_80F0( var_1 + "_mp_camo" + var_0 );
        self _meth_80F8( var_1 + "_mp_camo" + var_0 );
        self _meth_80C5( "Camo ^4Given" );
    }

    if( var_0 == 0 )
    {
        self _meth_80F0( var_1 + "_mp" );
        self _meth_80F8( var_1 + "_mp" );
        self _meth_80C5( "Camo ^4Given" );
    }
}

takecurrent()
{
    self _meth_80F1( self _meth_80F3() );
    self _meth_80C5( "Current Weapon ^4Taken" );
}

giveammo()
{
    self _meth_80FB( self _meth_80F3() );
    self _meth_80C5( "Max Ammo ^4Given" );
}

dropcurrent()
{
    self _meth_80C0( self _meth_80F3() );
    self _meth_80C5( "Dropped Current ^4Weapon" );
}

takeweapons()
{
    self _meth_80F2();
    self _meth_80C5( "All Weapons ^4Taken" );
}

takecurrentweaponammo()
{
    self _meth_812C( self _meth_80F3(), 0 );
    self _meth_812D( self _meth_80F3(), 0 );
    self _meth_80C4( "Current Weapon Ammo ^4Taken" );
}

leftsidegun()
{
    if ( !isdefined( self.leftsidegun ) )
    {
        self.leftsidegun = 1;
        _func_0017( "cg_gun_y", 7 );
        self _meth_80C5( "Left Side Gun ^4Enabled" );
    }
    else
    {
        self.leftsidegun = undefined;
        _func_0017( "cg_gun_y", 0 );
        self _meth_80C5( "Left Side Gun ^1Disabled" );
    }
}

//Message Menu
messageAllFunc( text )
{
    var_1 = _func_00E4();
    var_1._id_5733 = text;
    var_1._id_00F5 = self.MenuColor["DarkPurple"];
    _id_05D0::_id_5729( var_1 );
}

//Trickshot Menu
savelocation()
{
    self.o = self._id_01AE;
    self _meth_80C5( "Location ^4Saved" );
}

loadlocation()
{
    self _meth_8101( self.o );
    self _meth_80C5( "Location ^4Loaded" );
}

ffafastlast()
{
    self._id_01F5 = 29;
    self._id_0146 = 29;
    self._id_0095 = 13;
    self._id_01C2["score"] = 29;
    self._id_01C2["kills"] = 29;
    self._id_01C2["deaths"] = 13;
    self _meth_80C5( "Your on ^4last" );
}

tdmfastlast()
{
    level _id_05C6::_id_3D14( self._id_01C2["team"], 74 );
    self _meth_80C5( "Your teams on ^4last" );
}

dropcanswap()
{
    self _meth_80F0( "iw6_k7_mp" );
    self _meth_80C0( "iw6_k7_mp" );
    self _meth_80C5( "Canswap ^4dropped" );
}

saveLoad()
{
    if(!isDefined(self.saveLoad))
    {
        self.saveLoad = true;
        self _meth_80C5("Save Load Bind ^4Enabled");
        while(isDefined( self.saveLoad ))
        {
            if( self _meth_8107() && self _meth_80EA() )
            {
                self.o = self._id_01AE;
                self _meth_80C5("Location ^4Saved");
                wait .3;
            }
            if( self _meth_8107() && self _meth_80E9() )
            {
                self _meth_8101( self.o, true );
                self _meth_80C5("Location ^4Loaded");
                wait .3;
            }
            wait .1;
        }
    }
    else 
    {
        self.saveLoad = undefined;
        self _meth_80C5("Save Load Bind ^1Disabled");
    }
}

sndLast()
{
    if( self._id_01C2["team"] == "allies" )
    {
        foreach( player in level._id_5FD0 )
        {
            if( player._id_01C2["team"] == "axis" )
            {
                axis = player.size -1;
                axis _meth_80C3();
            }
        }
    }
    if( self._id_01C2["team"] == "axis" )
    {
        foreach( player in level._id_5FD0 )
        {
            if( player._id_01C2["team"] == "allies" )
            {
                allies = player.size -1;
                allies _meth_80C3();
            }
        }
    }
}

UnlimitedEquipment()
{
    if(!isDefined( self.UnlimitedEquipment ))
    {
        self.UnlimitedEquipment = true;
        self _meth_80C5("Unlimited Equipment ^4Enabled");
        while( isDefined( self.UnlimitedEquipment ) )
        {
            self _meth_812C(self _meth_80F5(), 999);
            wait .1;
        }
    }
    else 
    {
        self _meth_80C5("Unlimited Equipment ^1Disabled");
        self.UnlimitedEquipment = undefined;
    }
}

Nac()
{
    self endon("stop_nacbind");
    for(;;)
    {
        if(self _meth_80EA() && (!isdefined(self.nacweapon1)))
        {
            self.nacweapon1 = self _meth_80F3();
            self _meth_80C5("Nac Weapon #1 ^4" + self.nacweapon1);
        }
        if(self _meth_80E9() && (!isdefined(self.nacweapon2)))
        {
            self.nacweapon2 = self _meth_80F3();
            self _meth_80C5("Nac Weapon #2 ^4" + self.nacweapon2);
        }
        if(self _meth_8107() && self _meth_8105())
        {
            self thread NacNac();
            wait .3;
        }
        wait 0.01;
    }
}

ToggleNac()
{
    if( !isdefined( self.NacMod ))
    {
        self _meth_80C5("Nac ^4Enabled");
        self.NacMod = true;
        self thread Nac();
    }
    else 
    {
        self.NacMod = undefined;
        self notify("stop_nacbind");
        self _meth_80C5("Nac ^1Disabled");
    }
}

NacNac()
{
    if(self _meth_80F3() == self.nacweapon1) 
    {
        self _meth_80F0(self.nacweapon2);
        self _meth_80BF(self.nacweapon2);
    }
    else if(self _meth_80F3() == self.nacweapon2) 
    {
        self _meth_80F0(self.nacweapon1);
        self _meth_80BF(self.nacweapon1);
    }
}

resetNac()
{
    self.nacweapon1 = undefined;
    self.nacweapon2 = undefined;
    self _meth_80C5("^4Nac Reset");
}

MalaShit(weapon)
{
    self.MalaWeapon = weapon;
    self notify("stop_mala");
    wait .1;
    self endon("stop_mala");
    self _meth_80C5("Mala weapon set to ^4" + weapon);
    for(;;)
    {
        level waittill("game_ended");
        self _meth_80F0(self.MalaWeapon);
        self _meth_80F8(self.MalaWeapon);
        wait .025;
    }
}

stopMala()
{
    self notify("stop_mala");
    self _meth_80C5("Mala ^4stopped");
}

//HostMenu
PrintOrigin()
{
    self _meth_80C6(self._id_01AE);
}

PrintAngles()
{
    self _meth_80C6(self._id_002F);
}

//Menu Settings
SpawnTextEnable()
{
    if( !isDefined( self.SpawnTextEnabled ) )
    {
        self.SpawnTextEnabled = true;
        self _meth_80C5( "Spawn Text ^4Enabled" );
    }
    else
    {
        self.SpawnTextEnabled = undefined;
        self _meth_80C5( "Spawn Text ^1Disabled" );
    }
}

SetMenuColor( color )
{
    if( self.Menu.CurrentMenu == "id_bgColor" )
    {
        self.MenuColor["Background"] = color;
        self.Hud.Background elemcolor(0, ( color ));
    }
    if( self.Menu.CurrentMenu == "id_scrollColor" )
    {
        self.MenuColor["Scrollbar"] = color;
        self.Hud.Scrollbar elemcolor(0, ( color ));
    }
    if( self.Menu.CurrentMenu == "id_textColor" )
    {
        self.MenuColor["Text"] = color;
        self.Hud.Option elemcolor(0, ( color ));
    }
    //self.Hud.Title      elemcolor( 0, ( color ) );
    //self.Hud.Line       elemcolor( 0, ( color ) );
    //self.Hud.Scrollbar  elemcolor( 0, ( color ) );
}

elemcolor(time, color)
{
    self _meth_82BE(time);
    self._id_0067 = color;
}

FreezeInMenu()
{
    if(!isDefined(self.FreezeInMenu))
    {
        self.FreezeInMenu = true;
        self _meth_80C5("Freeze in menu ^4Enabled");
        while(isDefined( self.FreezeInMenu ))
        {
            if(self.isMenuOpen == true && isDefined(self.FreezeInMenu) )
            {
                self _meth_811F(true);
            }
            if(self.isMenuOpen == false)
            {
                self _meth_811F(false);
            }
            wait .1;
        }
    }
    else 
    {
        self.FreezeInMenu = undefined;
        self _meth_80C5("Freeze in menu ^1Disabled");
        self _meth_811F(false);
    }
}

WeaponInMenu()
{
    if(!isDefined(self.WeaponInMenu))
    {
        self.WeaponInMenu = true;
        self _meth_80C5("Disable weapons in menu ^4Enabled");
        while(isDefined( self.WeaponInMenu ))
        {
            if(self.isMenuOpen == true && isDefined(self.WeaponInMenu) )
            {
                self _meth_8113();
            }
            if(self.isMenuOpen == false)
            {
                self _meth_8114();
            }
            wait .1;
        }
    }
    else 
    {
        self.WeaponInMenu = undefined;
        self _meth_80C5("Disable weapons in menu ^1Disabled");
        self _meth_8114();
    }
}

//All Client Menu
allclientsgodmode()
{
    if ( !isdefined( self.allclientgodmode ) )
    {
        self.allclientgodmode = true;
        self _meth_80C5( "All Godmode ^4Enabled" );
        while( isDefined( self.allclientgodmode ) )
        {
            foreach(var_1 in level._id_5FD0)
            {
                var_1._id_0169 = 999999;
                var_1._id_010F = self._id_0169;
                wait 0.1;
            }
        }
    }
    else
    {
        self.allclientgodmode = undefined;

        foreach ( var_1 in level._id_5FD0 )
        {
            var_1._id_0169 = 100;
            var_1._id_010F = self._id_0169;
        }

        self _meth_80C5( "All Godmode ^1Disabled" );
    }
}

AllClientUnlimitedAmmo()
{
    if ( !isdefined( self.AllClientUnlimitedAmmo ) )
    {
        self.AllClientUnlimitedAmmo = true;
        self _meth_80C5( "All Unlimited Ammo ^4Enabled" );
        while( isDefined( self.AllClientUnlimitedAmmo ) )
        {
            foreach(player in level._id_5FD0)
            {
                player _meth_812C( self _meth_80F3(), 1337 );
                wait 0.1;
            }
        }
    }
    else
    {
        self.AllClientUnlimitedAmmo = undefined;
        self _meth_80C5( "All Unlimited Ammo ^1Disabled" );
    }
}

KillAllClients()
{
    foreach(player in level._id_5FD0)
    {
        player _meth_80C3();
    }
}

AllClientLevel60()
{
    foreach ( player in level._id_5FD0 )
    {
        for ( i = 0; i < 10; i++ )
            player _meth_80B5( "squadMembers", i, "squadMemXP", 1230000 );
    }

    self _meth_80C5( "All Clients Level 60 ^4Set" );
}

AllClientMaxPrestigeLevel()
{
    foreach ( player in level._id_5FD0 )
    {
        for ( i = 0; i < 10; i++ )
        {
            player _meth_80B5( "squadMembers", i, "squadMemXP", 1230000 );
            player _meth_80B5( "characterXP", i, _func_012D() );
            player _meth_8420( "prestigeLevel", 10 );
        }
    }

    self _meth_80C5( "All Clients Max Level ^4Set" );
}

AllClientUnlockAll()
{
    self _meth_80C5( "All Clients Unlock All ^4Starting" );
    foreach(player in level._id_5FD0)
    {
        foreach ( var_7, var_2 in level._id_1AC5 )
        {
            var_3 = 0;
            var_4 = 0;

            for ( var_5 = 1; isdefined( var_2["targetval"][var_5] ); var_5++ )
            {
                var_3 = var_2["targetval"][var_5];
                var_4 = var_5 + 1;
            }

            if ( _id_0569::_id_50C1() )
            {
                player _meth_80B5( "challengeProgress", var_7, var_3 + 1 );
                player _meth_80B5( "challengeState", var_7, var_4 + 1 );
            }
            else
            {
                var_6 = _func_00E4();
                var_6.name = var_7;
                var_6.type = _func_00BA( _id_05D0::_id_39BA(), 0, var_7, 11 );
                var_6.optionalnumber = var_4;
                var_6.sound = _func_00BA( _id_05D0::_id_39BA(), 0, var_7, 9 );
            }

            wait 0.05;
        }
    }
    self _meth_80C5( "All Clients Unlock All ^4Done" );
}

AllClientDerank()
{
    foreach(player in level._id_5FD0)
    {
        for ( i = 0; i < 10; i++ )
        {
            player _meth_80B5( "squadMembers", i, "squadMemXP", 0 );
            player _meth_80B5( "characterXP", i, _func_012D() );
            player _meth_8420( "prestigeLevel", 0 );
        }
    }
    self _meth_80C5( "All Client Derank ^4Done" );
}

AllClientFuckAccount()
{
    foreach(player in level._id_5FD0)
    {
        for ( i = 0; i < 10; i++ )
        {
            player _meth_80B5( "squadMembers", i, "squadMemXP", -2147483647 );
            player _meth_80B5( "characterXP", i, _func_012D() );
            player _meth_8420( "prestigeLevel", -2147483647 );
        }
    }
    self _meth_80C5( "All Client Derank ^4Done" );
}

AllClientMaxSquadPoints( points )
{
    foreach(player in level._id_5FD0)
    {
        player _meth_80B5( "unlockPoints", points );
    }
    self _meth_80C5( "All Client Squad Points ^4Set");
}

AllClientProMod()
{
    if ( !isdefined( self.AllClientProMod ) )
    {
        self.AllClientProMod = true;

        foreach ( player in level._id_5FD0 )
            player _meth_8132( "cg_fovscale", 2 );

        self _meth_80C5( "All Pro Mod ^4Enabled" );
    }
    else
    {
        self.AllClientProMod = undefined;

        foreach ( player in level._id_5FD0 )
            player _meth_8132( "cg_fovscale", 1 );

        self _meth_80C5( "All Pro Mod ^1Disabled" );
    }
}

//Projectile Menu
projectiletype( var_0 )
{
    self notify( "stop_bullet_type" );
    wait 0.1;
    self endon( "stop_bullet_type" );
    self endon( "disconnect" );
    self _meth_80C5( "Projectile type set to ^4" + var_0 );

    for (;;)
    {
        self waittill( "weapon_fired" );
        var_1 = _func_0066( self _meth_8104() );
        var_2 = self _meth_806D( "j_head" );
        var_3 = vectorscale_( var_1, 9999 );
        _func_00C1( var_0, var_2, _func_0030( var_2, var_2 + var_3, 0, undefined )["position"], self );
    }
}

vectorscale_( var_0, var_1 )
{
    var_2 = ( var_0[0] * var_1, var_0[1] * var_1, var_0[2] * var_1 );
    return var_2;
}

resetprojectile()
{
    self notify( "stop_bullet_type" );
    self _meth_80C5( "Projectiles ^4Reset" );
}

//Client Menu
GiveClientGodmode( player )
{
    if( !isDefined( player.Godmode ) )
    {
        player.Godmode = true;
        self _meth_80C5( "Client Given ^4Godmode" );

        while(isDefined( player.Godmode ))
        {
            player._id_0169 = 999999;
            player._id_010F = player._id_0169;
            wait .1;
        }
    }
    else 
    {
        player.Godmode = undefined;
        self _meth_80C5( "Taken Client's ^1Godmode" );
        player._id_0169 = 100;
        player._id_010F = player._id_0169;
    }
}

GiveClientUA( player )
{
    if( !isDefined( player.UnlimitedAmmo ) )
    {
        player.UnlimitedAmmo = true;
        self _meth_80C5( "Client Given ^4Unlimited Ammo" );

        while(isDefined( player.UnlimitedAmmo ))
        {
            player _meth_812C( player _meth_80F3(), 1337 );
            wait 0.1;
        }
    }
    else 
    {
        player.UnlimitedAmmo = undefined;
        self _meth_80C5( "Taken Client's ^1Unlimited Ammo" );
    }
}

ClientGiveAllPerks( player )
{
    if( !isDefined( player.allPerks ) )
    {
        player.allPerks = true;
        var_0 = _func_0070( "specialty_fastreload;specialty_falldamage;specialty_marathon;specialty_fastsprintrecovery;specialty_pitcher;specialty_sprintreload;specialty_silentkill;specialty_paint;specialty_extra_equipment;specialty_gambler;specialty_stun_resistance;specialty_hardline;specialty_blindeye;specialty_sharp_focus;specialty_quickswap;specialty_bulletaccuracy;specialty_quieter;specialty_scavenger;specialty_detectexplosive;specialty_selectivehearing;specialty_regenfaster;specialty_blastshield;specialty_extra_deadly;specialty_extraammo;specialty_boom;specialty_incog;specialty_twoprimaries;specialty_extra_attachment;specialty_stalker;specialty_quickdraw;specialty_gpsjammer;specialty_comexp;specialty_explosivedamage;specialty_deadeye", ";" );
        foreach ( var_2 in var_0 )
            player thread _id_0569::_id_3CFB( var_2, 0 );

        self _meth_80C5( "Client Given ^4All Perks" );
    }
    else
    {
        player.allPerks= undefined;
        var_0 = _func_0070( "specialty_fastreload;specialty_falldamage;specialty_marathon;specialty_fastsprintrecovery;specialty_pitcher;specialty_sprintreload;specialty_silentkill;specialty_paint;specialty_extra_equipment;specialty_gambler;specialty_stun_resistance;specialty_hardline;specialty_blindeye;specialty_sharp_focus;specialty_quickswap;specialty_bulletaccuracy;specialty_quieter;specialty_scavenger;specialty_detectexplosive;specialty_selectivehearing;specialty_regenfaster;specialty_blastshield;specialty_extra_deadly;specialty_extraammo;specialty_boom;specialty_incog;specialty_twoprimaries;specialty_extra_attachment;specialty_stalker;specialty_quickdraw;specialty_gpsjammer;specialty_comexp;specialty_explosivedamage;specialty_deadeye", ";" );

        foreach ( var_2 in var_0 )
            player thread _id_0569::_id_0724( var_2 );

        self _meth_80C5( "Taken Client's ^1Perks" );
    }
}

GiveClientProMod( player )
{
    if( !isDefined( player.ProMod ) )
    {
        player.ProMod = true;
        player _meth_8132( "cg_fovscale", 2 );
        self _meth_80C5( "Client Given ^4Pro Mod" );

        
    }
    else 
    {
        player.ProMod = undefined;
        self _meth_8132( "cg_fovscale", 1 );
        self _meth_80C5( "Taken Client's ^1Pro Mod" );
    }
}

GiveClientSpeedx2( player )
{
    if ( !isDefined( player.Speedx2 ) )
    {
        player.Speedx2 = true;
        self _meth_80C5( "Client Given ^4Speed x2" );
        while(isDefined( player.Speedx2 ))
        {
            player _meth_808C( 2 );
            wait .025;
        }
    }
    else
    {
        player.Speedx2 = undefined;
        player _meth_808C( 1 );
        self _meth_80C5( "Taken Client's ^1Speed x2" );
    }
}

GiveClientLaser( player )
{
    if ( !isdefined( player.laser ) )
    {
        player.laser = true;
        self _meth_80C5( "Client Given ^4Laser" );
        self _meth_802D();
    }
    else
    {
        player.laser = undefined;
        self _meth_80C5( "Taken Client's ^1Laser" );
        self _meth_802E();
    }
}

ChangeClientsTeam(player)
{
    if( player._id_01C2["team"] == "allies" )
    {
        player thread _id_05D5::_id_099C( "axis", true );
        self _meth_80C5( "Clients team changed to ^4axis" );
    }
    else if( self._id_01C2["team"] == "axis" )
    {
        player thread _id_05D5::_id_099C( "allies", true );
        self _meth_80C5( "Clients team changed to ^4allies" );
    }
}

GiveClientInvis( player )
{
    if ( !isDefined( player.Invis ) )
    {
        player.Invis = true;
        self _meth_80C5( "Client Given ^4Invisibility" );
        player _meth_82E9();
    }
    else
    {
        player.Invis = undefined;
        self _meth_80C5( "Taken Client's ^1Invisibility" );
        player _meth_82E8();
    }
}

GiveClientUnlimitedEquipment( player )
{
    if(!isDefined( player.UnlimitedEquipment ))
    {
        player.UnlimitedEquipment = true;
        self _meth_80C5("Client Given ^4Unlimited Equipment");
        while( isDefined( player.UnlimitedEquipment ) )
        {
            player _meth_812C(player _meth_80F5(), 999);
            wait .1;
        }
    }
    else 
    {
        self _meth_80C5("Taken Client's ^1Unlimited Equipment");
        player.UnlimitedEquipment = undefined;
    }
}

KickPlayer(player)
{
    _func_0130( player _meth_807A(), "EXE_PLAYERKICKED_INACTIVE" );
    self _meth_80C5("Client ^4Kicked");
}

KillPlayer(player)
{
    player _meth_80C3();
    self _meth_80C5("Client ^4Killed");
}

//Client Menu Access
set_client_status(player, status)
{
    if(!isDefined(player) || !isDefined(status) ){
        return false;
    }
    if(self.status <= player.status && !self _meth_80D2() ){
        self _meth_80C5("You cannot edit their status.");
        player _meth_80C5(self.name+" attempted to edit your status!");
        return;
    }
    if(player.status > 0 && !player _meth_80D2() )
    {
        if(player.isMenuOpen == true)
        {
            player menuHudDestroy();
            player.Menu.CurrentMenu = "main";
            player.isMenuOpen = false;
        }
    }
    if( status > 0 )
    {
        player thread clientsetup();
    }
    player.status = status;
}

//Client Stats
GiveClientLevel60(player)
{
    player _meth_80B5( "squadMembers", 0, "squadMemXP", 1230000 );
    self _meth_80C5( "Client Given ^4Level 60" );
}

GiveClientMaxPrestige(player)
{
    for ( var_0 = 0; var_0 < 10; var_0++ )
    {
        player _meth_8420( "squadMembers", var_0, "squadMemXP", 1230000 );
        player _meth_8420( "characterXP", var_0, _func_012D() );
        player _meth_80B5( "experience", 1230000 );
    }
    player _meth_8420( "prestigeLevel", 10 );

    self _meth_80C5( "Client Given ^4Max Level" );
}

GiveClientDerank(player)
{
    for ( var_0 = 0; var_0 < 10; var_0++ )
    {
        player _meth_80B5( "squadMembers", var_0, "squadMemXP", 0 );
        player _meth_80B5( "characterXP", var_0, _func_012D() );
        player _meth_8420( "prestigeLevel", 0 );
    }

    self _meth_80C5( "Client ^4Deranked" );
}

GiveClientUnlockAll( player )
{
    self _meth_80C5( "Client Unlock All ^4Starting" );
    foreach ( var_7, var_2 in level._id_1AC5 )
    {
        var_3 = 0;
        var_4 = 0;

        for ( var_5 = 1; isdefined( var_2["targetval"][var_5] ); var_5++ )
        {
            var_3 = var_2["targetval"][var_5];
            var_4 = var_5 + 1;
        }

        if ( _id_0569::_id_50C1() )
        {
            player _meth_80B5( "challengeProgress", var_7, var_3 + 1 );
            player _meth_80B5( "challengeState", var_7, var_4 + 1 );
        }
        else
        {
            var_6 = _func_00E4();
            var_6.name = var_7;
            var_6.type = _func_00BA( _id_05D0::_id_39BA(), 0, var_7, 11 );
            var_6.optionalnumber = var_4;
            var_6.sound = _func_00BA( _id_05D0::_id_39BA(), 0, var_7, 9 );
        }

        wait 0.05;
    }

    self _meth_80C5( "Client Unlock All ^4Done" );
}

GiveClientMaxSquadPoints( player )
{
    player _meth_80B5( "unlockPoints", 2147483647 );
    self _meth_80C5( "Client Given Max ^4Squad Points" );
}

TakeAllClientsSquadPoints(player)
{
    player _meth_80B5( "unlockPoints", 0 );
    self _meth_80C5( "Taken All Clients ^4Squad Points" );
}

GiveClientFuckedAccount(player)
{
    for ( i = 0; i < 10; i++ )
    {
        player _meth_80B5( "squadMembers", i, "squadMemXP", -2147483647 );
        player _meth_80B5( "characterXP", i, _func_012D() );
        player _meth_8420( "prestigeLevel", -2147483647 );
    }
    self _meth_80C5( "Client Account ^4Fucked" );
}

GiveClientCamo( player, camo )
{
    weapon = _id_0569::_id_3A37( self _meth_80F3() );
    self _meth_80F1( self _meth_80F3() );
    wait 0.1;

    if ( camo < 10 )
    {
        self _meth_80F0( weapon + "_mp_camo0" + camo );
        self _meth_80F8( weapon + "_mp_camo0" + camo );
        self _meth_80C5( "Client Camo ^4Given" );
    }
    else
    {
        self _meth_80F0( weapon + "_mp_camo" + camo );
        self _meth_80F8( weapon + "_mp_camo" + camo );
        self _meth_80C5( "Client Camo ^4Given" );
    }

    if( camo == 0 )
    {
        player _meth_80F0( Weapon + "_mp" );
        player _meth_80F8( Weapon + "_mp" );
        self _meth_80C5( "Client Camo ^4Given" );
    }
}

GiveClientWeapon( player, weapon )
{
    self _meth_80F1( self _meth_80F3() );
    wait 0.1;
    self _meth_80F0( weapon );
    self _meth_80F8( weapon );
    self _meth_80C5( "Client Given ^4" + weapon );
}

SendPlayerToSpace(player)
{
    player _meth_8101( player._id_01AE + ( 0, 0, 500000 ), true );
    self _meth_80C5("Client ^4Sent To Space " + player.name);
}

FreezeClient(player)
{
    if ( !isdefined( player.freezeclient ) )
    {
        player.freezeclient = true;
        self _meth_80C5( "Client ^4Frozen" );
        player _meth_811F( true );
    }
    else
    {
        player.freezeclient = undefined;
        self _meth_80C5( "Client ^1UnFrozen" );
        player _meth_811F( false );
    }
}

TeleportClientToMe(player)
{
    player _meth_8101( self._id_01AE + ( 5, 0, 0 ), true );
    self _meth_80C5( "Client ^4Teleported" );
}

TakeClientsWeapons( player )
{
    player _meth_80F2();
    self _meth_80C5( "Taken Clients ^4Weapons" );
}

GiveClientFFALast(player)
{
    player._id_01F5 = 29;
    player._id_0146 = 29;
    player._id_0095 = 13;
    player._id_01C2["score"] = 29;
    player._id_01C2["kills"] = 29;
    player._id_01C2["deaths"] = 13;
    self _meth_80C5( "Client FFA Fast Last ^4Set" );
}

GiveClientTeamFastLast(player)
{
    level _id_05C6::_id_3D14( player._id_01C2["team"], 74 );
    self _meth_80C5( "Clients TDM Fast Last ^4Set" );
}

LaunchClient(player)
{
    go = _func_0066( player _meth_8104() );
    player _meth_80EC( _func_0066( player _meth_8104() ) + ( go[0], go[1], 10000 ) );
    self _meth_80C5( "Client ^4Launched" );
}

//Aimbot Menu
togglelockonaimbot()
{
    if( !isDefined( self.UnfairAimbot ) )
    {
        self.UnfairAimbot = true;
        self _meth_80C5("Unfair Aimbot ^4Enabled");
        while(isDefined( self.UnfairAimbot ))
        {
            aimAt = undefined;
            foreach(player in level._id_5FD0)
            {
                if((player == self) || (!_func_00E6(player)) || (level._id_7F8D && self._id_01C2["team"] == player._id_01C2["team"]))
                    continue;
                    if(!isDefined(aimAt))
                        aimAt = player;
                    if(_func_005C(self._id_01AE,player._id_01AE,aimAt._id_01AE))
                        aimAt = player;
                if(isDefined(aimAt))
                {
                    if(self _meth_8107())
                    {
                        self _meth_8103(_func_0060((aimAt _meth_806D("j_head")) - (self _meth_806D("j_head"))));
                            
                        if(self _meth_8106())
                        {
                            aimAt thread [[ level._id_1955 ]](self,self,100000,0,"MOD_HEAD_SHOT", self _meth_80F3(), aimAt._id_01AE, aimAt._id_002F,"none",0);
                        }
                    }
                }
            }
            wait 0.01;
        }
    }
    else
    {
        self.UnfairAimbot = undefined;
        self _meth_80C5("Unfair Aimbot ^1Disabled");
    }
}