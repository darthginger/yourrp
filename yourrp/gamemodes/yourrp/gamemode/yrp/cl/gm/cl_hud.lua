--Copyright (C) 2017-2018 Arno Zura ( https://www.gnu.org/licenses/gpl.txt )

CreateConVar( "yrp_cl_hud", 1, {}, "" )
--##############################################################################
--Resolution Change
hook.Add( "Initialize", "Resolution Change", function()
	vgui.CreateFromTable {
		Base = "Panel",
		PerformLayout = function()
			hook.Run( "ResolutionChanged", ScrW(), ScrH() )
		end
	} : ParentToHUD()
end )

hook.Add( "ResolutionChanged", "Resolution Change", function( w, h )
	local rw, rh = getResolutionRatio()
	printGM( "gm", "Changed Resolution to " .. w .. "x" .. h .. " (" .. rw .. ":" .. rh .. ")" )
	changeFontSize()
end )
--##############################################################################

--##############################################################################

function GM:DrawDeathNotice( x, y )
	--No Kill Feed
end

hook.Add( "HUDShouldDraw", "yrp_hidehud", function( name )
	local hide = {
		CHudHealth = true,
		CHudBattery = true,
		CHudAmmo = true,
		CHudSecondaryAmmo = true,
		CHudCrosshair = LocalPlayer():GetNWBool( "bool_yrp_crosshair", false ),
		CHudVoiceStatus = false
	}

	if g_VoicePanelList != nil then
		g_VoicePanelList:SetVisible( false )
	end
	if ( hide[ name ] ) then return false end
end )

--##############################################################################

--##############################################################################
--includes
include( "hud/cl_hud_map.lua" )
include( "hud/cl_hud_player.lua" )
include( "hud/cl_hud_view.lua" )
include( "hud/cl_hud_crosshair.lua" )
--##############################################################################

Material("voice/icntlk_pl"):SetFloat("$alpha", 0)

function IsScreenshotting()
	if input.IsKeyDown(KEY_F12) or input.IsKeyDown(KEY_F5) then
		return true
	else
		return false
	end
end

--##############################################################################
function hudVersion()
	if !version_tested() then
		testVersion()
	elseif IsScreenshotting() then
		local _singleplayer = ""
		if game.SinglePlayer() then
			_singleplayer = "Singleplayer"
		end

		--[[ Version Color ]]--
		local _color1 = version_color() or Color( 0, 0, 0, 255 )
		local _color2 = Color( 0, 0, 0, 255 )
		local _alpha = 50
		_color1.a = _alpha
		_color2.a = _alpha

		local _text = tostring( _singleplayer ) .. " [" .. string.upper( tostring( VERSIONART ) ) .. "] " .. "YourRP Version:" .. " " .. GAMEMODE.Version .. " " .. string.upper( tostring( GAMEMODE.VersionSort ) ) .. " (on " .. GAMEMODE.dedicated .. " Server)"
		draw.SimpleTextOutlined( _text, "HudVersion", ScrW() - ctr( 70 ), ctr( 60 ), _color1, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP, ctr( 1 ), _color2 )
	end
end
--##############################################################################

function hudUpTime()
	local ply = LocalPlayer()
	--UpTime
	local _ut = {}
	_ut.x = anchorW( HudV( "utaw" ) ) + ctr( HudV( "utpx" ) )
	_ut.y = anchorH( HudV( "utah" ) ) + ctr( HudV( "utpy" ) )
	_ut.w = ctr( HudV( "utsw" ) )
	_ut.h = ctr( HudV( "utsh" ) )
	draw.RoundedBox( 0, _ut.x, _ut.y, _ut.w, _ut.h, Color( HudV("colbgr"), HudV("colbgg"), HudV("colbgb"), HudV("colbga") ) )

	draw.SimpleTextOutlined( lang_string( "totaluptime" ) .. ":", "utsf", _ut.x + _ut.w/2, _ut.y + _ut.h/7, Color( 255, 255, 255, 255 ), HudV( "uttx" ), HudV( "utty" ), 1, Color( 0, 0, 0 ) )
	draw.SimpleTextOutlined( string.FormattedTime( ply:GetNWFloat( "uptime_total", 0 ), "%02i:%02i" ), "utsf", _ut.x + _ut.w/2, _ut.y + _ut.h/7 * 2, Color( 255, 255, 255, 255 ), HudV( "uttx" ), HudV( "utty" ), 1, Color( 0, 0, 0 ) )
	draw.SimpleTextOutlined( lang_string( "currentuptime" ) .. ":", "utsf", _ut.x + _ut.w/2, _ut.y + _ut.h/7 * 3, Color( 255, 255, 255, 255 ), HudV( "uttx" ), HudV( "utty" ), 1, Color( 0, 0, 0 ) )
	draw.SimpleTextOutlined( string.FormattedTime( ply:GetNWFloat( "uptime_current", 0 ), "%02i:%02i" ), "utsf", _ut.x + _ut.w/2, _ut.y + _ut.h/7 * 4, Color( 255, 255, 255, 255 ), HudV( "uttx" ), HudV( "utty" ), 1, Color( 0, 0, 0 ) )
	draw.SimpleTextOutlined( lang_string( "serveruptime" ) .. ":", "utsf", _ut.x + _ut.w/2, _ut.y + _ut.h/7 * 5, Color( 255, 255, 255, 255 ), HudV( "uttx" ), HudV( "utty" ), 1, Color( 0, 0, 0 ) )
	draw.SimpleTextOutlined( string.FormattedTime( ply:GetNWFloat( "uptime_server", 0 ), "%02i:%02i" ), "utsf", _ut.x + _ut.w/2, _ut.y + _ut.h/7 * 6, Color( 255, 255, 255, 255 ), HudV( "uttx" ), HudV( "utty" ), 1, Color( 0, 0, 0 ) )

	drawRBoxBr( 0, ctrF( ScrH() ) * anchorW( HudV( "ut" .. "aw" ) ) + HudV( "ut" .. "px" ), ctrF( ScrH() ) * anchorH( HudV( "ut" .. "ah" ) ) + HudV( "ut" .. "py" ), HudV( "ut" .. "sw" ), HudV( "ut" .. "sh" ), Color( HudV("colbrr"), HudV("colbrg"), HudV("colbrb"), HudV("colbra") ), ctr( 4 ) )
end

function GM:PlayerStartVoice( ply )

	if ply == LocalPlayer() then
    _showVoice = true
		net.Start( "yrp_voice_start" )
		net.SendToServer()
  end
	if ply:SteamID() == LocalPlayer():GetNWString( "voice_global_steamid" ) and ply:GetNWInt( "speak_channel", 0 ) == 2 then
		_showGlobalVoice = true
	end
end

function GM:PlayerEndVoice( ply )
	if ply == LocalPlayer() then
    _showVoice = false
		net.Start( "yrp_voice_end" )
		net.SendToServer()
  end
	if ply:SteamID() == LocalPlayer():GetNWString( "voice_global_steamid" ) then
		_showGlobalVoice = false
	end
end

function show_global_voice_info( ply )
	if _showGlobalVoice then
		local _role_name = ply:GetNWString( "voice_global_rolename", "" )
		draw.SimpleTextOutlined( lang_string( "makesanannoucmentpre" ) .. " " .. _role_name .. " " .. lang_string( "makesanannoucmentpos" ) .. "!", "HudBars", ScrW2(), ctr( 400 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
	end
end

function show_voice_info( ply )
	--Voice
	if _showVoice then
		local _voice_text = lang_string( "youarespeaking" ) .. " ("
		if ply:GetNWInt( "speak_channel", -1 ) == 1 then
			_voice_text = _voice_text .. lang_string( "speakgroup" )
		elseif ply:GetNWInt( "speak_channel", -1 ) == 2 then
			_voice_text = _voice_text .. lang_string( "speakglobal" )
		else
			_voice_text = _voice_text .. lang_string( "speaklocal" )
		end
		_voice_text = _voice_text .. ")"

		draw.SimpleTextOutlined( _voice_text, "HudBars", ScrW2(), ctr( 500 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
	end
end

local _yrp_icon = Material( "vgui/yrp/logo100_beta.png" )

function DrawEquipment( ply, name )
	local _tmp = ply:GetNWEntity( name, NULL )
	if ea( _tmp ) then
		if tonumber( ply:GetNWString( "view_range", "0" ) ) <= 0 then
			_tmp:SetNoDraw( true )
		else
			_tmp:SetNoDraw( false )
		end
	end
end

--##############################################################################
hook.Add( "HUDPaint", "yrp_hud", function( )
	local ply = LocalPlayer()

	if ply:GetNWBool( "blinded", false ) then
		surfaceBox( 0, 0, ScrW(), ScrH(), Color( 255, 255, 255, 255 ) )
		surfaceText( lang_string( "blinded" ), "SettingsHeader", ScrW2(), ScrH2() + ctr( 100 ), Color( 255, 255, 0, 255 ), 1, 1 )
	end
	if ply:IsFlagSet( FL_FROZEN ) then
		surfaceText( lang_string( "frozen" ), "SettingsHeader", ScrW2(), ScrH2() + ctr( 150 ), Color( 255, 255, 0, 255 ), 1, 1 )
	end
	if ply:GetNWBool( "cloaked", false ) then
		surfaceText( lang_string( "cloaked" ), "SettingsHeader", ScrW2(), ScrH2() - ctr( 400 ), Color( 255, 255, 0, 255 ), 1, 1 )
	end

	DrawEquipment( ply, "backpack" )
	DrawEquipment( ply, "weaponprimary1" )
	DrawEquipment( ply, "weaponprimary2" )
	DrawEquipment( ply, "weaponsecondary1" )
	DrawEquipment( ply, "weaponsecondary2" )
	DrawEquipment( ply, "weapongadget" )

	if !ply:InVehicle() then
		HudPlayer( ply )
		HudView()
		HudCrosshair()
	end

	show_voice_info( ply )
	show_global_voice_info( ply )

	if tobool( get_tutorial( "tut_hudhelp" ) ) then
		draw.SimpleTextOutlined( "[YourRP] " .. lang_string( "helppre" ) .. " [F1] " .. lang_string( "helppos" ), "HudBars", ScrW2(), ctr( 300 ), Color( 255, 255, 0, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, Color( 0, 0, 0 ) )
	end

	if game.SinglePlayer() then
		draw.SimpleTextOutlined( "[YourRP] " .. lang_string( "donotusesingleplayer" ) .. "!", "72", ScrW2(), ScrH2(), Color( 255, 0, 0, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, ctr( 1 ), Color( 0, 0, 0, 255 ) )
	elseif ply:GetNWBool( "warning_dedicated", false ) then
		surfaceText( "[YourRP] PLEASE USE A DEDICATED SERVER, FOR THE BEST EXPERIENCE!", "SettingsHeader", ScrW()/2, ScrH()/4, Color( 255, 255, 0, 255 ), 1, 1 )
	end

	if tobool( HudV( "utto" ) ) then
		hudUpTime()
	end

	local _target = LocalPlayer():GetNWString( "hittargetName", "" )
	if _target != "" then
		surfaceText( lang_string( "target" ) .. ": " .. LocalPlayer():GetNWString( "hittargetName", "" ), "HudBars", ctr( 10 ), ctr( 10 ), Color( 255, 0, 0, 255 ), 0, 0 )
		LocalPlayer():drawHitInfo()
	end

	if IsSpVisible() then
		local _br = {}
		_br.y = 50
		_br.x = 10

		local _r = 60

		local _sp = GetSpTable()

		draw.RoundedBox( ctrb( _r ), _sp.x - _br.x, _sp.y - _br.y, _sp.w + 2*_br.x, _sp.h + 2*_br.y, getSpCaseColor() )

		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetMaterial( _yrp_icon	)
		surface.DrawTexturedRect( _sp.x + _sp.w/2 - ctrb( 246 )/2, _sp.y - ctrb( 80 + 10 ), ctrb( 246 ), ctrb( 80 ) )
	end

	hudVersion()
end)
--##############################################################################
