--Copyright (C) 2017 Arno Zura ( https://www.gnu.org/licenses/gpl.txt )

local testingversion = false
local serverVersion = "-1.-1.-1"
function testVersion()
  if !testingversion then
    testingversion = true
    net.Start( "getServerVersion" )
    net.SendToServer()
  end
end

timer.Create( "check_yrp_version", 3600, 0, function()
  testVersion()
end)


function showVersion()
  local ply = LocalPlayer()

  http.Fetch( "https://docs.google.com/document/d/1mvyVK5OzHajMuq6Od74-RFaaRV7flbR2pYBiyuWVGxA/edit?usp=sharing",
    function( body, len, headers, code )
      local StartPos = string.find( body, "#", 1, false )
      local EndPos = string.find( body, "*", 1, false )
      local versionOnline = string.sub( body, StartPos+1, EndPos-1 )

      --Client
      local cur2num = string.Replace( GAMEMODE.Version, ".", "" )
      local new2num = string.Replace( versionOnline, ".", "" )
      local verart = "Up-To-Date"
      g_yrp.versionCol = Color( 0, 255, 0, 255 )
      if cur2num < new2num then
        verart = lang_string( "versionnewpre" ) .. " " .. GAMEMODE.Name .. " " .. lang_string( "versionnewpos" )
        g_yrp.versionCol = Color( 255, 0, 0, 255 )
      elseif cur2num > new2num then
        verart = lang_string( "versionoldpre" ) .. " " .. GAMEMODE.Name .. " " .. lang_string( "versionoldpos" )
        g_yrp.versionCol = Color( 100, 100, 255, 255 )
      end

      --Server
      local cur2num2 = string.Replace( GAMEMODE.Version, ".", "" )
      local new2num2 = string.Replace( versionOnline, ".", "" )
      local verart2 = "Up-To-Date"
      local outcol2 = Color( 0, 255, 0, 255 )
      if cur2num2 < new2num2 then
        verart2 = lang_string( "versionnewpre" ) .. " " .. GAMEMODE.Name .. " " .. lang_string( "versionnewpos" )
        outcol2 = Color( 255, 0, 0, 255 )
      elseif cur2num2 > new2num2 then
        verart2 = lang_string( "versionoldpre" ) .. " " .. GAMEMODE.Name .. " " .. lang_string( "versionoldpos" )
        outcol2 = Color( 100, 100, 255, 255 )
      end

      local _serverSort = ""
      if serverIsDedicated then
        GAMEMODE.dedicated = "Dedicated"
        _serverSort = lang_string( "serverdedicated" )
      else
        GAMEMODE.dedicated = "Local"
        _serverSort = lang_string( "serverlocal" )
      end

      local _versionsort = ""
      if GAMEMODE.VersionSort == "unstable" then
        _versionsort = lang_string( "unstable" )
      elseif GAMEMODE.VersionSort == "stable" then
        _versionsort = lang_string( "stable" )
      end

      if versionOnline != GAMEMODE.Version then
        g_yrp.outdated = true
        local frame = createVGUI( "DFrame", nil, 1000, 570, 0, 0 )
        frame:Center()
        frame:SetTitle( "" )
        function frame:Paint( pw, ph )
          --draw.RoundedBox( 0, 0, 0, pw, ph, Color( 0, 0, 0, 200 ) )

					paintWindow( self, pw, ph, lang_string( "about" ) )

          draw.SimpleTextOutlined( "Language:", "HudBars", ctr( 300 ), ctr( 50+30 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
          draw.SimpleTextOutlined( verart .. "! (" .. _versionsort .. ")", "HudBars", pw/2, ctr( 140 ), Color( 255, 255, 0, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
          draw.SimpleTextOutlined( lang_string( "currentversion" ) .. ":", "HudBars", pw/2, ctr( 215 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )

          draw.SimpleTextOutlined( lang_string( "client" ) .. ": ", "HudBars", pw/2, ctr( 265 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
          draw.SimpleTextOutlined( GAMEMODE.Version, "HudBars", pw/2, ctr( 265 ), g_yrp.versionCol, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )

          draw.SimpleTextOutlined( "(" .. _serverSort .. ") " .. lang_string( "server" ) .. ": ", "HudBars", pw/2, ctr( 315 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
          draw.SimpleTextOutlined( serverVersion, "HudBars", pw/2, ctr( 315 ), outcol2, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )

          draw.SimpleTextOutlined( lang_string( "workshopversion" ) .. ": ", "HudBars", pw/2, ctr( 415 ), Color( 255, 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
          draw.SimpleTextOutlined( versionOnline .. " (" .. _versionsort .. ")", "HudBars", pw/2, ctr( 415 ), Color( 0, 255, 0, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
        end

        local _langu = derma_change_language( frame, ctr( 400 ), ctr( 50 ), ctr( 310 ), ctr( 60 ) )

        local showChanges = createVGUI( "DButton", frame, 460, 80, 0, 0 )
        showChanges:SetText( "" )
        function showChanges:DoClick()
          gui.OpenURL( "http://steamcommunity.com/sharedfiles/filedetails/changelog/1114204152" )
        end
        function showChanges:Paint( pw, ph )
          paintButton( self, pw, ph, lang_string( "showchanges" ) )
          --draw.SimpleTextOutlined( lang_string( "showchanges" ), "HudBars", pw/2, ph/2, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0 ) )
        end

        if ply:IsAdmin() or ply:IsSuperAdmin() then
          local restartServer = createVGUI( "DButton", frame, 460, 80, 0, 0 )
          restartServer:SetText( "" )
          function restartServer:DoClick()
            net.Start( "restartServer" )
            net.SendToServer()
          end
          function restartServer:Paint( pw, ph )
						paintButton( self, pw, ph, lang_string( "updateserver" ) )
          end

          showChanges:SetPos( ctr( 500-460-10 ), ctr( 460 ) )
          restartServer:SetPos( ctr( 500+10 ), ctr( 460 ) )
        else
          showChanges:SetPos( ctr( 500-230 ), ctr( 460 ) )
        end

        frame:MakePopup()
      else
        g_yrp.outdated = false
        printGM( "note", "YourRP is on the newest version (unstable)")
      end
      testingversion = false
    end,
    function( error )
      -- We failed. =(
    end
   )
end

net.Receive( "getServerVersion", function( len )
  serverVersion = net.ReadString()
  serverIsDedicated = net.ReadBool()
  showVersion()
end)