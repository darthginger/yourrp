--Copyright (C) 2017-2018 Arno Zura ( https://www.gnu.org/licenses/gpl.txt )

local _advertname = "NULL"
local _restartTime = 0

net.Receive( "dbGetGeneral", function()
  local _center = 800

  local sv_generalName = vgui.Create( "DTextEntry", settingsWindow.window.site )
  local sv_generalAdvert = vgui.Create( "DTextEntry", settingsWindow.window.site )
  local sv_generalHunger = createVGUI( "DCheckBox", settingsWindow.window.site, 30, 30, _center, 315 )
  local sv_generalThirst = createVGUI( "DCheckBox", settingsWindow.window.site, 30, 30, _center, 375 )
  local sv_generalStamina = createVGUI( "DCheckBox", settingsWindow.window.site, 30, 30, _center, 435 )
  local sv_generalBuilding = createVGUI( "DCheckBox", settingsWindow.window.site, 30, 30, _center, 495 )
  local sv_generalHud = createVGUI( "DCheckBox", settingsWindow.window.site, 30, 30, _center, 555 )
  local sv_generalInventory = createVGUI( "DCheckBox", settingsWindow.window.site, 30, 30, _center, 615 )
  local sv_generalDropItemsOnDeath = createVGUI( "DCheckBox", settingsWindow.window.site, 30, 30, _center, 675 )
  local sv_generalGraffiti = createVGUI( "DCheckBox", settingsWindow.window.site, 30, 30, _center, 735 )
  local sv_generalRestartTime = vgui.Create( "DNumberWang", settingsWindow.window.site )
  local sv_generalViewDistance = vgui.Create( "DNumberWang", settingsWindow.window.site )
  local sv_generalRealisticDamage = createVGUI( "DCheckBox", settingsWindow.window.site, 30, 30, _center, 855 )
  local sv_generalRealisticFalldamage = createVGUI( "DCheckBox", settingsWindow.window.site, 30, 30, _center, 915 )
  local sv_generalSmartphone = createVGUI( "DCheckBox", settingsWindow.window.site, 30, 30, _center, 975 )
  local sv_generalDealerImmortal = createVGUI( "DCheckBox", settingsWindow.window.site, 30, 30, _center, 1035 )

  local sv_generalWeaponLowering = createVGUI( "DCheckBox", settingsWindow.window.site, 30, 30, _center, 1095 )
  local sv_generalCrosshair = createVGUI( "DCheckBox", settingsWindow.window.site, 30, 30, _center, 1155 )
  local sv_generalAntibhop = createVGUI( "DCheckBox", settingsWindow.window.site, 30, 30, _center, 1215 )

  local sv_generalNoClipCrow = createVGUI( "DCheckBox", settingsWindow.window.site, 30, 30, _center, 1380 )
  local sv_generalNoClipTags = createVGUI( "DCheckBox", settingsWindow.window.site, 30, 30, _center, 1440 )
  local sv_generalNoClipStealth = createVGUI( "DCheckBox", settingsWindow.window.site, 30, 30, _center, 1500 )
  local sv_generalNoClipEffect = createVGUI( "DCheckBox", settingsWindow.window.site, 30, 30, _center, 1560 )

  local sv_generalTagInfo = createD( "DCheckBox", settingsWindow.window.site, ctr( 30 ), ctr( 30 ), BScrW()/2, ctr( 315 ) )
  local sv_generalTagName = createD( "DCheckBox", settingsWindow.window.site, ctr( 30 ), ctr( 30 ), BScrW()/2, ctr( 375 ) )
  local sv_generalTagRole = createD( "DCheckBox", settingsWindow.window.site, ctr( 30 ), ctr( 30 ), BScrW()/2, ctr( 435 ) )
  local sv_generalTagGroup = createD( "DCheckBox", settingsWindow.window.site, ctr( 30 ), ctr( 30 ), BScrW()/2, ctr( 495 ) )
  local sv_generalTagHP = createD( "DCheckBox", settingsWindow.window.site, ctr( 30 ), ctr( 30 ), BScrW()/2, ctr( 555 ) )
  local sv_generalTagAR = createD( "DCheckBox", settingsWindow.window.site, ctr( 30 ), ctr( 30 ), BScrW()/2, ctr( 615 ) )

  local sv_generalServerChangelevel = createD( "DCheckBox", settingsWindow.window.site, ctr( 30 ), ctr( 30 ), BScrW()/2, ctr( 730 ) )
  local sv_generalPlayersCanDropWeapons = createD( "DCheckBox", settingsWindow.window.site, ctr( 30 ), ctr( 30 ), BScrW()/2, ctr( 790 ) )
  local sv_generalAppearanceMenu = createD( "DCheckBox", settingsWindow.window.site, ctr( 30 ), ctr( 30 ), BScrW()/2, ctr( 850 ) )

  local sv_generalShowGroup = createD( "DCheckBox", settingsWindow.window.site, ctr( 30 ), ctr( 30 ), BScrW()/2, ctr( 950 ) )
  local sv_generalShowRole = createD( "DCheckBox", settingsWindow.window.site, ctr( 30 ), ctr( 30 ), BScrW()/2, ctr( 1010 ) )

  local sv_generalSuicideDisabled = createD( "DCheckBox", settingsWindow.window.site, ctr( 30 ), ctr( 30 ), BScrW()/2, ctr( 1100 ) )

  local sv_generalDropMoneyOnDeath = createD( "DCheckBox", settingsWindow.window.site, ctr( 30 ), ctr( 30 ), BScrW()/2, ctr( 1200 ) )
  local sv_generalYrpChat = createD( "DCheckBox", settingsWindow.window.site, ctr( 30 ), ctr( 30 ), BScrW()/2, ctr( 1300 ) )
  local sv_generalYrpVoiceChat = createD( "DCheckBox", settingsWindow.window.site, ctr( 30 ), ctr( 30 ), BScrW()/2, ctr( 1360 ) )

  local sv_generalCollection = createVGUI( "DNumberWang", settingsWindow.window.site, 400, 50, _center, 1700 )
  sv_generalCollection:SetMin( 0 )
  sv_generalCollection:SetMax( 99999999999999 )
  local sv_generalCollectionButton = createVGUI( "DButton", settingsWindow.window.site, 1000, 50, _center, 1760 )

  local oldGamemodename = ""
  function settingsWindow.window.site:Paint( pw, ph )
    surfaceBox( 0, 0, pw, ph, Color( 0, 0, 0, 254 ) )
    --draw.RoundedBox( 0, 0, 0, settingsWindow.window.site:GetWide(), settingsWindow.window.site:GetTall(), _yrp.colors.panel )
    draw.SimpleTextOutlined( "*" .. lang_string( "gamemodename" ) .. ":", "sef", ctr( _center - 10 ), ctr( 5 + 25 ), Color( 255, 0, 0, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    if oldGamemodename != sv_generalName:GetText() then
      draw.SimpleTextOutlined( "you need to update Server!", "sef", ctr( _center + 400 + 10 ), ctr( 5 + 25 ), Color( 255, 0, 0, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    end

    draw.SimpleTextOutlined( lang_string( "advertname" ) .. ":", "sef", ctr( _center - 10 ), ctr( 90 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( lang_string( "updatecountdown" ) .. ":", "sef", ctr( _center - 10 ), ctr( 150 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( lang_string( "hunger" ) .. ":", "sef", ctr( _center - 10 ), ctr( 330 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( lang_string( "thirst" ) .. ":", "sef", ctr( _center - 10 ), ctr( 390 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( lang_string( "stamina" ) .. ":", "sef", ctr( _center - 10 ), ctr( 450 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( lang_string( "building" ) .. ":", "sef", ctr( _center - 10 ), ctr( 510 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( lang_string( "server_hud" ) .. ":", "sef", ctr( _center - 10 ), ctr( 570 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )

    draw.SimpleTextOutlined( "*" .. lang_string( "inventory" ) .. ":", "sef", ctr( _center - 10 ), ctr( 630 ), Color( 255, 0, 0, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( "*" .. lang_string( "dropitemsondeath" ) .. ":", "sef", ctr( _center - 10 ), ctr( 690 ), Color( 255, 0, 0, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( lang_string( "graffiti" ) .. ":", "sef", ctr( _center - 10 ), ctr( 750 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( lang_string( "thirdpersonviewdistance" ) .. ":", "sef", ctr( _center - 10 ), ctr( 810 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )

    draw.SimpleTextOutlined( lang_string( "realisticdamage" ) .. ":", "sef", ctr( _center - 10 ), ctr( 870 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( lang_string( "realisticfalldamage" ) .. ":", "sef", ctr( _center - 10 ), ctr( 930 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )

    draw.SimpleTextOutlined( lang_string( "smartphone" ) .. ":", "sef", ctr( _center - 10 ), ctr( 990 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( lang_string( "dealers" ) .. " [" .. lang_string("immortal") .. "]" .. ":", "sef", ctr( _center - 10 ), ctr( 1050 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( lang_string( "weaponlowering" ) .. ":", "sef", ctr( _center - 10 ), ctr( 1110 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( "[YourRP] " .. lang_string( "crosshair" ) .. ":", "sef", ctr( _center - 10 ), ctr( 1170 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( lang_string( "disablebhop" ) .. ":", "sef", ctr( _center - 10 ), ctr( 1230 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )

    draw.SimpleTextOutlined( lang_string( "noclip" ) .. " [" .. lang_string( "crow" ) .. "]" .. ":", "sef", ctr( _center - 10 ), ctr( 1390 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( lang_string( "noclip" ) .. " [" .. lang_string( "usergroup" ) .. "]" .. ":", "sef", ctr( _center - 10 ), ctr( 1450 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( lang_string( "noclip" ) .. " [" .. lang_string( "stealth" ) .. "]" .. ":", "sef", ctr( _center - 10 ), ctr( 1510 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( lang_string( "noclip" ) .. " [" .. lang_string( "effect" ) .. "]" .. ":", "sef", ctr( _center - 10 ), ctr( 1570 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )

    draw.SimpleTextOutlined( lang_string( "collectionid" ) .. ":", "sef", ctr( _center - 10 ), ctr( 1725 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )

    draw.SimpleTextOutlined( lang_string( "playerinfo" ) .. ":", "sef", BScrW()/2 - ctr( 10 ), ctr( 330 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( lang_string( "name" ) .. ":", "sef", BScrW()/2 - ctr( 10 ), ctr( 390 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( lang_string( "role" ) .. ":", "sef", BScrW()/2 - ctr( 10 ), ctr( 450 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( lang_string( "group" ) .. ":", "sef", BScrW()/2 - ctr( 10 ), ctr( 510 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( lang_string( "health" ) .. ":", "sef", BScrW()/2 - ctr( 10 ), ctr( 570 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( lang_string( "armor" ) .. ":", "sef", BScrW()/2 - ctr( 10 ), ctr( 630 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )

    draw.SimpleTextOutlined( lang_string( "autoserverreload" ) .. ":", "sef", BScrW()/2 - ctr( 10 ), ctr( 740 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( lang_string( "playerscandropweapons" ) .. ":", "sef", BScrW()/2 - ctr( 10 ), ctr( 800 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( lang_string( "appearance" ) .. " - " .. lang_string( "menu" ) .. ":", "sef", BScrW()/2 - ctr( 10 ), ctr( 860 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )

    draw.SimpleTextOutlined( lang_string( "showgroup" ) .. ":", "sef", BScrW()/2 - ctr( 10 ), ctr( 960 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( lang_string( "showrole" ) .. ":", "sef", BScrW()/2 - ctr( 10 ), ctr( 1020 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )

    draw.SimpleTextOutlined( lang_string( "suicidedisabled" ) .. ":", "sef", BScrW()/2 - ctr( 10 ), ctr( 1110 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )

    draw.SimpleTextOutlined( lang_string( "dropmoneyondeath" ) .. ":", "sef", BScrW()/2 - ctr( 10 ), ctr( 1210 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )

    draw.SimpleTextOutlined( "*" .. "[YourRP] " .. lang_string( "chat" ) .. ":", "sef", BScrW()/2 - ctr( 10 ), ctr( 1310 ), Color( 255, 0, 0, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
    draw.SimpleTextOutlined( "[YourRP] " .. lang_string( "voicechat" ) .. ":", "sef", BScrW()/2 - ctr( 10 ), ctr( 1370 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )

    draw.SimpleTextOutlined( "*" .. lang_string( "requiresserverrestart" ) .. "/" .. lang_string( "requireschangelevel" ), "sef", BScrW()/2 - ctr( 10 ), ScrH() - ctr( 200 ), Color( 255, 0, 0, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
  end

  sv_generalName:SetPos( ctr( _center ), ctr( 5 ) )
  sv_generalName:SetSize( ctr( 400 ), ctr( 50 ) )
  sv_generalName:SetText( GAMEMODE.BaseName )

  local _yrp_general = net.ReadTable()

  GAMEMODE.BaseName = SQL_STR_OUT( _yrp_general.name_gamemode ) or "FAILED"
  oldGamemodename = GAMEMODE.BaseName or ""
  sv_generalName:SetText( oldGamemodename )
  _advertname = _yrp_general.name_advert or "FAILED"
  sv_generalAdvert:SetText( tostring( _advertname ) )
  sv_generalHunger:SetChecked( tobool( _yrp_general.toggle_hunger ) )
  sv_generalThirst:SetChecked( tobool( _yrp_general.toggle_thirst ) )
  sv_generalStamina:SetChecked( tobool( _yrp_general.toggle_stamina ) )
  sv_generalBuilding:SetChecked( tobool( _yrp_general.toggle_building ) )
  sv_generalHud:SetValue( tonumber( _yrp_general.toggle_hud ) )
  sv_generalInventory:SetValue( tonumber( _yrp_general.toggle_inventory ) )
  sv_generalDropItemsOnDeath:SetValue( tonumber( _yrp_general.toggle_dropitemsondeath ) )
  sv_generalGraffiti:SetValue( tonumber( _yrp_general.toggle_graffiti ) )
  sv_generalRestartTime:SetValue( tonumber( _yrp_general.time_restart ) )
  sv_generalViewDistance:SetValue( tonumber( _yrp_general.view_distance ) )
  sv_generalRealisticDamage:SetValue( tonumber( _yrp_general.toggle_realistic_damage ) )
  sv_generalRealisticFalldamage:SetValue( tonumber( _yrp_general.toggle_realistic_falldamage ) )
  sv_generalSmartphone:SetValue( tonumber( _yrp_general.toggle_smartphone ) )
  sv_generalDealerImmortal:SetValue( tonumber( _yrp_general.toggle_dealer_immortal ) )
  sv_generalWeaponLowering:SetValue( tonumber( _yrp_general.toggle_weapon_lowering ) )
  sv_generalCrosshair:SetValue( tonumber( _yrp_general.toggle_crosshair ) )
  sv_generalAntibhop:SetValue( tonumber( _yrp_general.toggle_anti_bhop ) )

  sv_generalNoClipCrow:SetValue( tonumber( _yrp_general.toggle_noclip_crow ) )
  sv_generalNoClipTags:SetValue( tonumber( _yrp_general.toggle_noclip_tags ) )
  sv_generalNoClipStealth:SetValue( tonumber( _yrp_general.toggle_noclip_stealth ) )
  sv_generalNoClipEffect:SetValue( tonumber( _yrp_general.toggle_noclip_effect ) )

  sv_generalCollection:SetValue( tonumber( _yrp_general.collection ) )

  sv_generalTagInfo:SetValue( tonumber( _yrp_general.tag_info ) )
  sv_generalTagName:SetValue( tonumber( _yrp_general.tag_name ) )
  sv_generalTagRole:SetValue( tonumber( _yrp_general.tag_role ) )
  sv_generalTagGroup:SetValue( tonumber( _yrp_general.tag_group ) )
  sv_generalTagHP:SetValue( tonumber( _yrp_general.tag_hp ) )
  sv_generalTagAR:SetValue( tonumber( _yrp_general.tag_ar ) )

  sv_generalServerChangelevel:SetValue( tonumber( _yrp_general.server_changelevel ) )
  sv_generalPlayersCanDropWeapons:SetValue( tonumber( _yrp_general.playerscandropweapons ) )
  sv_generalAppearanceMenu:SetValue( tonumber( _yrp_general.appearancemenu ) )

  sv_generalShowGroup:SetValue( tonumber( _yrp_general.showgroup ) )
  sv_generalShowRole:SetValue( tonumber( _yrp_general.showrole ) )

  sv_generalSuicideDisabled:SetValue( tonumber( _yrp_general.suicidedisabled ) )

  sv_generalDropMoneyOnDeath:SetValue( tonumber( _yrp_general.toggle_dropmoneyondeath ) )
  sv_generalYrpChat:SetValue( tonumber( _yrp_general.yrp_chat ) )
  sv_generalYrpVoiceChat:SetValue( tonumber( _yrp_general.yrp_voice_chat ) )

  sv_generalAdvert:SetPos( ctr( _center ), ctr( 5 + 50 + 10 ) )
  sv_generalAdvert:SetSize( ctr( 400 ), ctr( 50 ) )
  sv_generalAdvert:SetText( _advertname )
  function sv_generalAdvert:OnChange()
    net.Start( "updateAdvert" )
      net.WriteString( sv_generalAdvert:GetText() )
    net.SendToServer()
  end

  sv_generalRestartTime:SetPos( ctr( _center ), ctr( 5 + 50 + 10 + 50 + 10 ) )
  sv_generalRestartTime:SetSize( ctr( 400 ), ctr( 50 ) )
  sv_generalRestartTime:SetMin( 3 )
  sv_generalRestartTime:SetMax( 240 )
  sv_generalRestartTime:SetDecimals( 0 )
  function sv_generalRestartTime:OnValueChanged( value )
    net.Start( "updateGeneral" )
      net.WriteString( tostring( math.Round( value ) ) )
    net.SendToServer()
  end

  local sv_generalSQL = createD( "DButton", settingsWindow.window.site, ctr( 500 ), ctr( 50 ), BScrW()/2, ctr( 10 ) )
  sv_generalSQL:SetText( "" )
  function sv_generalSQL:Paint( pw, ph )
    surfaceButton( self, pw, ph, lang_string( "database" ) )
  end
  function sv_generalSQL:DoClick()
    net.Start( "get_sql_info" )
    net.SendToServer()
  end
  net.Receive( "get_sql_info", function( len )
    local _sv_sql = net.ReadTable()

    local _win = createD( "DFrame", nil, ctr( 600 ), ctr( 820 ), 0, 0 )
    _win:SetTitle( "" )
    _win:MakePopup()
    _win:Center()
    function _win:Paint( pw, ph )
      surfaceBox( 0, 0, pw, ph, Color( 0, 0, 100, 200 ) )
    end

    local _sql_host = createD( "DYRPPanelPlus", _win, ctr( 580 ), ctr( 100 ), ctr( 10 ), ctr( 50 + 100 + 10 ) )
    _sql_host:INITPanel( "DTextEntry" )
    _sql_host:SetHeader( lang_string( "host" ) )
    _sql_host.plus:SetText( _sv_sql.host )
    function _sql_host.plus:OnChange()
      net.Start( "set_host" )
        net.WriteString( _sql_host.plus:GetText() )
      net.SendToServer()
    end

    local _sql_port = createD( "DYRPPanelPlus", _win, ctr( 580 ), ctr( 100 ), ctr( 10 ), ctr( 50 + 100 + 10 + 100 + 10 ) )
    _sql_port:INITPanel( "DTextEntry" )
    _sql_port:SetHeader( lang_string( "port" ) )
    _sql_port.plus:SetText( _sv_sql.port )
    function _sql_port.plus:OnChange()
      net.Start( "set_port" )
        net.WriteString( _sql_port.plus:GetText() )
      net.SendToServer()
    end

    local _sql_database = createD( "DYRPPanelPlus", _win, ctr( 580 ), ctr( 100 ), ctr( 10 ), ctr( 50 + 100 + 10 + 100 + 10 + 100 + 10 ) )
    _sql_database:INITPanel( "DTextEntry" )
    _sql_database:SetHeader( lang_string( "database" ) )
    _sql_database.plus:SetText( _sv_sql.database )
    function _sql_database.plus:OnChange()
      net.Start( "set_database" )
        net.WriteString( _sql_database.plus:GetText() )
      net.SendToServer()
    end

    local _sql_username = createD( "DYRPPanelPlus", _win, ctr( 580 ), ctr( 100 ), ctr( 10 ), ctr( 50 + 100 + 10 + 100 + 10 + 100 + 10 + 100 + 10 ) )
    _sql_username:INITPanel( "DTextEntry" )
    _sql_username:SetHeader( lang_string( "username" ) )
    _sql_username.plus:SetText( _sv_sql.username )
    function _sql_username.plus:OnChange()
      net.Start( "set_username" )
        net.WriteString( _sql_username.plus:GetText() )
      net.SendToServer()
    end

    local _sql_password = createD( "DYRPPanelPlus", _win, ctr( 580 ), ctr( 100 ), ctr( 10 ), ctr( 50 + 100 + 10 + 100 + 10 + 100 + 10 + 100 + 10 + 100 + 10 ) )
    _sql_password:INITPanel( "DTextEntry" )
    _sql_password:SetHeader( lang_string( "password" ) )
    _sql_password.plus:SetText( _sv_sql.password )
    function _sql_password.plus:OnChange()
      net.Start( "set_password" )
        net.WriteString( _sql_password.plus:GetText() )
      net.SendToServer()
    end

    local _sqlmode = createD( "DYRPPanelPlus", _win, ctr( 580 ), ctr( 100 ), ctr( 10 ), ctr( 50 ) )
    _sqlmode:INITPanel( "DComboBox" )
    _sqlmode:SetHeader( lang_string( "sqlmode" ) )
    _sqlmode.plus.mode = GetSQLMode()
    if tonumber( _sv_sql.mode ) == 0 then
      _sql_host:SetVisible( false )
      _sql_port:SetVisible( false )
      _sql_database:SetVisible( false )
      _sql_username:SetVisible( false )
      _sql_password:SetVisible( false )
      _sqlmode.plus:AddChoice( "SQLite (" .. lang_string( "internal" ).. ")", 0, true )
      _sqlmode.plus.choice = "SQLite"
    else
      _sqlmode.plus:AddChoice( "SQLite (" .. lang_string( "internal" ).. ")", 0, false )
    end
    if tonumber( _sv_sql.mode ) == 1 then
      _sqlmode.plus:AddChoice( "MYSQL (" .. lang_string( "external" ).. ")", 1, true )
      _sqlmode.plus.choice = "MYSQL"
    else
      _sqlmode.plus:AddChoice( "MYSQL (" .. lang_string( "external" ).. ")", 1, false )
    end
    function _sqlmode.plus:OnSelect( index, value, data )
      self.choice = value
      if data == 0 then
        _sql_host:SetVisible( false )
        _sql_port:SetVisible( false )
        _sql_database:SetVisible( false )
        _sql_username:SetVisible( false )
        _sql_password:SetVisible( false )
      else
        _sql_host:SetVisible( true )
        _sql_port:SetVisible( true )
        _sql_database:SetVisible( true )
        _sql_username:SetVisible( true )
        _sql_password:SetVisible( true )
      end
      self.mode = data
    end

    local _sql_change_to = createD( "DButton", _win, ctr( 580 ), ctr( 100 ), ctr( 10 ), ctr( 50 + 100 + 10 + 100 + 10 + 100 + 10 + 100 + 10 + 100 + 10 + 100 + 10 ) )
    function _sql_change_to:Paint( pw, ph )
      surfaceBox( 0, 0, pw, ph, Color( 255, 255, 255, 200 ) )
      _sql_change_to:SetText( lang_string( "changetopre" ) .. " " .. tostring( _sqlmode.plus.choice ) .. " " .. lang_string( "changetopos" ) )
    end
    function _sql_change_to:DoClick()
      net.Start( "change_to_sql_mode" )
        net.WriteString( _sqlmode.plus.mode )
      net.SendToServer()
      _win:Close()
    end
  end)

  local sv_generalRestartServer = vgui.Create( "DButton", settingsWindow.window.site )
  sv_generalRestartServer:SetSize( ctr( 400 ), ctr( 50 ) )
  sv_generalRestartServer:SetPos( ctr( 5 ), ctr( 5 + 50 + 10 + 50 + 10 + 50 + 10 ) )
  sv_generalRestartServer:SetText( lang_string( "updateserver" ) )
  function sv_generalRestartServer:Paint()
    local color = Color( 255, 0, 0, 200 )
    if sv_generalRestartServer:IsHovered() then
      color = Color( 255, 255, 0, 200 )
    end
    draw.RoundedBox( ctr( 10 ), 0, 0, sv_generalRestartServer:GetWide(), sv_generalRestartServer:GetTall(), color )
  end
  function sv_generalRestartServer:DoClick()
    if sv_generalName != nil then
      net.Start( "updateServer" )
        GAMEMODE.BaseName = sv_generalName:GetText()
        net.WriteString( GAMEMODE.BaseName )
        net.WriteInt( math.Round( sv_generalRestartTime:GetValue() ), 16 )
      net.SendToServer()
    end
    settingsWindow.window:Close()
  end

  local sv_generalRestartServerCancel = vgui.Create( "DButton", settingsWindow.window.site )
  sv_generalRestartServerCancel:SetSize( ctr( 400 ), ctr( 50 ) )
  sv_generalRestartServerCancel:SetPos( ctr( 5 + 400 + 10 ), ctr( 5 + 50 + 10 + 50 + 10 + 50 + 10 ) )
  sv_generalRestartServerCancel:SetText( lang_string( "cancelupdateserver" ) )
  function sv_generalRestartServerCancel:Paint()
    local color = Color( 0, 255, 0, 200 )
    if sv_generalRestartServerCancel:IsHovered() then
      color = Color( 255, 255, 0, 200 )
    end
    draw.RoundedBox( ctr( 10 ), 0, 0, sv_generalRestartServerCancel:GetWide(), sv_generalRestartServerCancel:GetTall(), color )
  end
  function sv_generalRestartServerCancel:DoClick()
    net.Start( "cancelRestartServer" )
    net.SendToServer()
    settingsWindow.window:Close()
  end

  local sv_generalHardReset = vgui.Create( "DButton", settingsWindow.window.site )
  sv_generalHardReset:SetSize( ctr( 400 ), ctr( 50 ) )
  sv_generalHardReset:SetPos( ctr( 5 ), ctr( 5 + 50 + 10 + 50 + 10 + 50 + 10 + 50 + 10 ) )
  sv_generalHardReset:SetText( lang_string( "hardresetdatabase" ) )
  function sv_generalHardReset:Paint( pw, ph )
    local color = Color( 255, 0, 0, 200 )
    if sv_generalHardReset:IsHovered() then
      color = Color( 255, 255, 0, 200 )
    end
    draw.RoundedBox( ctr( 10 ), 0, 0, pw, ph, color )
  end
  function sv_generalHardReset:DoClick()
    local _tmpFrame = createVGUI( "DFrame", nil, 630, 110, 0, 0 )
    _tmpFrame:Center()
    _tmpFrame:SetTitle( lang_string( "areyousure" ) )
    function _tmpFrame:Paint( pw, ph )
      local color = Color( 0, 0, 0, 200 )
      draw.RoundedBox( ctr( 10 ), 0, 0, pw, ph, color )
    end

    local sv_generalHardResetSure = vgui.Create( "DButton", _tmpFrame )
    sv_generalHardResetSure:SetSize( ctr( 300 ), ctr( 50 ) )
    sv_generalHardResetSure:SetPos( ctr( 10 ), ctr( 50 ) )
    sv_generalHardResetSure:SetText( lang_string( "yes" ) .. ": " .. lang_string( "hardresetdatabase" ) )
    function sv_generalHardResetSure:DoClick()
      net.Start( "hardresetdatabase" )
      net.SendToServer()
      _tmpFrame:Close()
    end
    function sv_generalHardResetSure:Paint( pw, ph )
      local color = Color( 255, 0, 0, 200 )
      if sv_generalHardResetSure:IsHovered() then
        color = Color( 255, 255, 0, 200 )
      end
      draw.RoundedBox( ctr( 10 ), 0, 0, pw, ph, color )
    end

    local sv_generalHardResetNot = vgui.Create( "DButton", _tmpFrame )
    sv_generalHardResetNot:SetSize( ctr( 300 ), ctr( 50 ) )
    sv_generalHardResetNot:SetPos( ctr( 10 + 300 + 10 ), ctr( 50 ) )
    sv_generalHardResetNot:SetText( lang_string( "no" ) .. ": do nothing" )
    function sv_generalHardResetNot:DoClick()
      _tmpFrame:Close()
    end
    function sv_generalHardResetNot:Paint( pw, ph )
      local color = Color( 0, 255, 0, 200 )
      if sv_generalHardResetNot:IsHovered() then
        color = Color( 255, 255, 0, 200 )
      end
      draw.RoundedBox( ctr( 10 ), 0, 0, pw, ph, color )
    end
    settingsWindow.window:Close()
    _tmpFrame:MakePopup()
  end

  local sv_generalMoneyReset = createD( "DButton", settingsWindow.window.site, ctr( 400 ), ctr( 50 ), ctr( 5 + 400 + 10 ), ctr( 5 + 50 + 10 + 50 + 10 + 50 + 10 + 50 + 10 ) )
  sv_generalMoneyReset:SetText( "" )
  function sv_generalMoneyReset:Paint( pw, ph )
    surfaceButton( self, pw, ph, lang_string( "moneyreset" ) )
  end
  function sv_generalMoneyReset:DoClick()
    local _tmpFrame = createVGUI( "DFrame", nil, 630, 110, 0, 0 )
    _tmpFrame:Center()
    _tmpFrame:SetTitle( lang_string( "areyousure" ) )
    function _tmpFrame:Paint( pw, ph )
      local color = Color( 0, 0, 0, 200 )
      draw.RoundedBox( ctr( 10 ), 0, 0, pw, ph, color )
    end

    local sv_generalMoneyResetSure = vgui.Create( "DButton", _tmpFrame )
    sv_generalMoneyResetSure:SetSize( ctr( 300 ), ctr( 50 ) )
    sv_generalMoneyResetSure:SetPos( ctr( 10 ), ctr( 50 ) )
    sv_generalMoneyResetSure:SetText( "" )
    function sv_generalMoneyResetSure:DoClick()
      net.Start( "moneyreset" )
      net.SendToServer()
      _tmpFrame:Close()
    end
    function sv_generalMoneyResetSure:Paint( pw, ph )
      surfaceButton( self, pw, ph, lang_string( "yes" ) .. ": " .. lang_string( "moneyreset" ) )
    end

    local sv_generalMoneyResetNot = vgui.Create( "DButton", _tmpFrame )
    sv_generalMoneyResetNot:SetSize( ctr( 300 ), ctr( 50 ) )
    sv_generalMoneyResetNot:SetPos( ctr( 10 + 300 + 10 ), ctr( 50 ) )
    sv_generalMoneyResetNot:SetText( "" )
    function sv_generalMoneyResetNot:DoClick()
      _tmpFrame:Close()
    end
    function sv_generalMoneyResetNot:Paint( pw, ph )
      surfaceButton( self, pw, ph, lang_string( "no" ) .. ": do nothing" )
    end
    settingsWindow.window:Close()
    _tmpFrame:MakePopup()
  end

  function sv_generalHunger:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_hunger" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalThirst:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_thirst" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalStamina:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_stamina" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalBuilding:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "dbUpdateNWBool2" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalHud:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_hud" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalInventory:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_inventory" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalDropItemsOnDeath:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_dropitemsondeath" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalGraffiti:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_graffiti" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  sv_generalViewDistance:SetPos( ctr( _center ), ctr( 785 ) )
  sv_generalViewDistance:SetSize( ctr( 200 ), ctr( 50 ) )
  sv_generalViewDistance:SetMin( 0 )
  sv_generalViewDistance:SetMax( 800 )
  sv_generalViewDistance:SetDecimals( 0 )
  function sv_generalViewDistance:OnValueChanged( value )
    if tonumber( value ) > tonumber( self:GetMax() ) then
      value = tonumber( self:GetMax() )
      self:SetValue( value )
    end
    net.Start( "db_update_view_distance" )
      net.WriteInt( tostring( math.Round( value ) ), 16 )
    net.SendToServer()
  end

  function sv_generalRealisticDamage:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_realistic_damage" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalRealisticFalldamage:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_realistic_falldamage" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalSmartphone:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_smartphone" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalNoClipCrow:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_noclip_crow" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalNoClipTags:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_noclip_tags" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalNoClipStealth:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_noclip_stealth" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalNoClipEffect:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_noclip_effect" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalDealerImmortal:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_dealer_immortal" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalWeaponLowering:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_weapon_lowering" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalCrosshair:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_crosshair" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  sv_generalCollectionButton:SetText( "" )
  function sv_generalCollectionButton:Paint( pw, ph )
    surfaceButton( self, pw, ph, lang_string( "howtoworkshopcollection" ) )
  end
  function sv_generalCollectionButton:DoClick()
    gui.OpenURL( "https://wiki.garrysmod.com/page/Workshop_for_Dedicated_Servers" )
  end

  function sv_generalCollection:OnValueChanged( Val )
    net.Start( "db_update_collection" )
      net.WriteString( Val )
    net.SendToServer()
  end

  function sv_generalAntibhop:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_anti_bhop" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalTagInfo:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_tag_info" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalTagName:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_tag_name" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalTagRole:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_tag_role" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalTagGroup:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_tag_group" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalTagHP:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_tag_hp" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalTagAR:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_tag_ar" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalServerChangelevel:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_server_changelevel" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalPlayersCanDropWeapons:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_playerscandropweapons" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalAppearanceMenu:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_appearancemenu" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalShowGroup:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_showgroup" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalShowRole:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_showrole" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalSuicideDisabled:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_suicidedisabled" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalDropMoneyOnDeath:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_dropmoneyondeath" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalYrpChat:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_yrp_chat" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end

  function sv_generalYrpVoiceChat:OnChange( bVal )
    local _tonumber = 0
    if bVal then
      _tonumber = 1
    end
    net.Start( "db_update_yrp_voice_chat" )
      net.WriteInt( _tonumber, 4 )
    net.SendToServer()
  end
end)

hook.Add( "open_server_general_old", "open_server_general_old", function()
  SaveLastSite()
  local ply = LocalPlayer()

  local w = settingsWindow.window.sitepanel:GetWide()
  local h = settingsWindow.window.sitepanel:GetTall()

  settingsWindow.window.site = createD( "DPanel", settingsWindow.window.sitepanel, w, h, 0, 0 )

  net.Start("dbGetGeneral")
  net.SendToServer()
end)
