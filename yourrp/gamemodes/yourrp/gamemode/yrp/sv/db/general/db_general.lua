--Copyright (C) 2017-2018 Arno Zura ( https://www.gnu.org/licenses/gpl.txt )

-- DO NOT TOUCH THE DATABASE FILES! If you have errors, report them here:
-- https://discord.gg/sEgNZxg

local DATABASE_NAME = "yrp_general"

--db_drop_table( DATABASE_NAME )
--db_is_empty( DATABASE_NAME )

--[[ Server Settings ]]--
SQL_ADD_COLUMN( DATABASE_NAME, "bool_server_reload", "INT DEFAULT 1" )

SQL_ADD_COLUMN( DATABASE_NAME, "bool_noclip_model", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_noclip_stealth", "INT DEFAULT 0" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_noclip_tags", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_noclip_effect", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "text_noclip_mdl", "TEXT DEFAULT 'models/crow.mdl'" )

SQL_ADD_COLUMN( DATABASE_NAME, "text_server_collectionid", "INT DEFAULT 0" )

SQL_ADD_COLUMN( DATABASE_NAME, "text_community_servers", "TEXT DEFAULT ''" )

SQL_ADD_COLUMN( DATABASE_NAME, "text_server_logo", "TEXT DEFAULT ''" )

SQL_ADD_COLUMN( DATABASE_NAME, "text_server_rules", "TEXT DEFAULT ''" )

SQL_ADD_COLUMN( DATABASE_NAME, "text_server_welcome_message", "TEXT DEFAULT 'Welcome'" )
SQL_ADD_COLUMN( DATABASE_NAME, "text_server_message_of_the_day", "TEXT DEFAULT 'Today'" )

--[[ Gamemode Settings ]]--
SQL_ADD_COLUMN( DATABASE_NAME, "text_gamemode_name", "TEXT DEFAULT 'YourRP'" )

SQL_ADD_COLUMN( DATABASE_NAME, "bool_graffiti_disabled", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_anti_bhop", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_suicide_disabled", "INT DEFAULT 1" )

SQL_ADD_COLUMN( DATABASE_NAME, "bool_drop_items_on_death", "INT DEFAULT 1" )

SQL_ADD_COLUMN( DATABASE_NAME, "bool_players_can_drop_weapons", "INT DEFAULT 1" )

SQL_ADD_COLUMN( DATABASE_NAME, "bool_dealers_can_take_damage", "INT DEFAULT 1" )

SQL_ADD_COLUMN( DATABASE_NAME, "text_view_distance", "TEXT DEFAULT '200'" )

SQL_ADD_COLUMN( DATABASE_NAME, "text_chat_advert", "TEXT DEFAULT 'Advert'" )

--[[ Gamemode Systems ]]--
SQL_ADD_COLUMN( DATABASE_NAME, "bool_hunger", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "text_hunger_health_regeneration_tickrate", "TEXT DEFAULT '10'" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_thirst", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_stamina", "INT DEFAULT 1" )

SQL_ADD_COLUMN( DATABASE_NAME, "bool_building_system", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_inventory_system", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_appearance_system", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_smartphone_system", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_realistic_system", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_weapon_lowering_system", "INT DEFAULT 1" )

SQL_ADD_COLUMN( DATABASE_NAME, "bool_players_can_switch_role", "INT DEFAULT 1" )

SQL_ADD_COLUMN( DATABASE_NAME, "bool_3d_voice", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_voice_channels", "INT DEFAULT 1" )

--[[ Gamemode Visuals ]]--
SQL_ADD_COLUMN( DATABASE_NAME, "bool_yrp_chat", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_yrp_chat_show_rolename", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_yrp_chat_show_groupname", "INT DEFAULT 1" )

SQL_ADD_COLUMN( DATABASE_NAME, "bool_yrp_crosshair", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_yrp_hud", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_yrp_scoreboard", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_yrp_scoreboard_show_rolename", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_yrp_scoreboard_show_groupname", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_yrp_scoreboard_show_usergroup", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_yrp_scoreboard_show_language", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_yrp_scoreboard_show_frags", "INT DEFAULT 0" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_yrp_scoreboard_show_deaths", "INT DEFAULT 0" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_yrp_scoreboard_show_playtime", "INT DEFAULT 1" )

SQL_ADD_COLUMN( DATABASE_NAME, "bool_tag_on_head", "INT DEFAULT 0" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_tag_on_head_clan", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_tag_on_head_name", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_tag_on_head_rolename", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_tag_on_head_groupname", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_tag_on_head_health", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_tag_on_head_armor", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_tag_on_head_usergroup", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_tag_on_head_voice", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_tag_on_head_chat", "INT DEFAULT 1" )

SQL_ADD_COLUMN( DATABASE_NAME, "bool_tag_on_side", "INT DEFAULT 0" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_tag_on_side_name", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_tag_on_side_clan", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_tag_on_side_rolename", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_tag_on_side_groupname", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_tag_on_side_health", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_tag_on_side_armor", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "bool_tag_on_side_usergroup", "INT DEFAULT 1" )

--[[ Money Settings ]]--
SQL_ADD_COLUMN( DATABASE_NAME, "bool_drop_money_on_death", "INT DEFAULT 1" )
SQL_ADD_COLUMN( DATABASE_NAME, "text_money_max_amount_of_dropped_money", "TEXT DEFAULT '1000'" )
SQL_ADD_COLUMN( DATABASE_NAME, "text_money_pre", "TEXT DEFAULT '$'" )
SQL_ADD_COLUMN( DATABASE_NAME, "text_money_pos", "TEXT DEFAULT ''" )

--[[ Social Settings ]]--
SQL_ADD_COLUMN( DATABASE_NAME, "text_social_website", "TEXT DEFAULT ''" )
SQL_ADD_COLUMN( DATABASE_NAME, "text_social_forum", "TEXT DEFAULT ''" )
SQL_ADD_COLUMN( DATABASE_NAME, "text_social_discord", "TEXT DEFAULT ''" )
SQL_ADD_COLUMN( DATABASE_NAME, "text_social_teamspeak_ip", "TEXT DEFAULT ''" )
SQL_ADD_COLUMN( DATABASE_NAME, "text_social_teamspeak_port", "TEXT DEFAULT ''" )
SQL_ADD_COLUMN( DATABASE_NAME, "text_social_teamspeak_query_port", "TEXT DEFAULT ''" )
SQL_ADD_COLUMN( DATABASE_NAME, "text_social_twitter", "TEXT DEFAULT ''" )
SQL_ADD_COLUMN( DATABASE_NAME, "text_social_facebook", "TEXT DEFAULT ''" )
SQL_ADD_COLUMN( DATABASE_NAME, "text_social_youtube", "TEXT DEFAULT ''" )
SQL_ADD_COLUMN( DATABASE_NAME, "text_social_steamgroup", "TEXT DEFAULT ''" )

--[[ OLD ]]--
SQL_ADD_COLUMN( DATABASE_NAME, "access_jail", "TEXT DEFAULT -1" )



local HANDLER_GENERAL = {}

function RemFromHandler_General( ply )
  table.RemoveByValue( HANDLER_GENERAL, ply )
  printGM( "gm", ply:YRPName() .. " disconnected from General" )
end

function AddToHandler_General( ply )
  if !table.HasValue( HANDLER_GENERAL, ply ) then
    table.insert( HANDLER_GENERAL, ply )
    printGM( "gm", ply:YRPName() .. " connected to General" )
  else
    printGM( "gm", ply:YRPName() .. " already connected to General" )
  end
end

util.AddNetworkString( "Connect_Settings_General" )
net.Receive( "Connect_Settings_General", function( len, ply )
  if ply:CanAccess( "general" ) then
    AddToHandler_General( ply )

    local _yrp_general = SQL_SELECT( DATABASE_NAME, "*", nil )
    if wk( _yrp_general ) then
      _yrp_general = _yrp_general[1]
    else
      _yrp_general = {}
    end
    net.Start( "Connect_Settings_General" )
      net.WriteTable( _yrp_general )
    net.Send( ply )
  end
end)

util.AddNetworkString( "Disconnect_Settings_General" )
net.Receive( "Disconnect_Settings_General", function( len, ply )
  RemFromHandler_General( ply )
end)



local yrp_general = {}

if SQL_SELECT( DATABASE_NAME, "*", "uniqueID = 1" ) == nil then
  SQL_INSERT_INTO_DEFAULTVALUES( DATABASE_NAME )
end

local _init_general = SQL_SELECT( DATABASE_NAME, "*", "uniqueID = '1'" )
if _init_general != false and _init_general != nil then
  yrp_general = _init_general[1]
end



--[[ GETTER ]]--
function YRPIsAutomaticServerReloadingEnabled()
  return tobool( yrp_general.bool_server_reload )
end


function IsNoClipEffectEnabled()
  return tobool( yrp_general.bool_noclip_effect )
end

function IsNoClipStealthEnabled()
  return tobool( yrp_general.bool_noclip_stealth )
end

function IsNoClipTagsEnabled()
  return tobool( yrp_general.bool_noclip_tags )
end

function IsNoClipModelEnabled()
  return tobool( yrp_general.bool_noclip_model )
end


function YRPCollectionID()
  return yrp_general.server_collectionid
end


function YRPServerLogo()
  return yrp_general.text_server_logo
end


function YRPServerRules()
  return yrp_general.server_rules
end



function IsDropItemsOnDeathEnabled()
  return tobool( yrp_general.bool_drop_items_on_death )
end

function IsWeaponLoweringEnabled()
  return tobool( yrp_general.bool_weapon_lowering_system )
end

function IsDealerImmortal()
  return tobool( yrp_general.bool_dealers_can_take_damage )
end

function IsRealisticEnabled()
  return tobool( yrp_general.bool_realistic )
end

function PlayersCanDropWeapons()
  return tobool( yrp_general.bool_players_can_drop_weapons )
end

function IsSuicideDisabled()
  return tobool( yrp_general.bool_suicide_disabled )
end

function IsDropMoneyOnDeathEnabled()
  return tobool( yrp_general.bool_drop_money_on_death )
end


function Is3DVoiceEnabled()
  return tobool( yrp_general.bool_3d_voice )
end

function IsVoiceChannelsEnabled()
  return tobool( yrp_general.bool_voice_channels )
end


function GetMaxAmountOfDroppedMoney()
  return tonumber( yrp_general.text_money_max_amount_of_dropped_money )
end



--[[ LOADOUT ]]--
local Player = FindMetaTable( "Player" )
function Player:GeneralLoadout()
  printGM( "gm", "[GeneralLoadout] " .. self:YRPName() )
  for i, set in pairs( yrp_general ) do
    if string.StartWith( i, "text_" ) then
      self:SetNWString( i, set )
    elseif string.StartWith( i, "bool_" ) then
      self:SetNWBool( i, tobool( set ) )
    end
  end
end



--[[ UPDATES ]]--
function GeneralSendToOther( ply, netstr, str )
  for i, pl in pairs( HANDLER_GENERAL ) do
    if ply != pl then
      net.Start( netstr )
        net.WriteString( str )
      net.Send( pl )
    end
  end
end

function GeneralUpdateValue( ply, netstr, str, value )
  yrp_general[str] = value
  SQL_UPDATE( DATABASE_NAME, str .. " = '" .. yrp_general[str] .. "'", "uniqueID = '1'" )
  GeneralSendToOther( ply, netstr, yrp_general[str] )
end

function GeneralUpdateBool( ply, netstr, str, value )
  printGM( "db", ply:YRPName() .. " updated " .. str .. " to: " .. tostring( tobool( value ) ) )
  GeneralUpdateValue( ply, netstr, str, value )
  for i, pl in pairs( player.GetAll() ) do
    pl:SetNWBool( str, tobool( value ) )
  end
end

function GeneralUpdateString( ply, netstr, str, value )
  printGM( "db", ply:YRPName() .. " updated " .. str .. " to: " .. tostring( value ) )
  GeneralUpdateValue( ply, netstr, str, value )
  for i, pl in pairs( player.GetAll() ) do
    pl:SetNWString( str, value )
  end
end



--[[ SERVER SETTINGS ]]--
util.AddNetworkString( "update_bool_server_reload" )
net.Receive( "update_bool_server_reload", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_server_reload", "bool_server_reload", b )
end)

util.AddNetworkString( "update_bool_noclip_effect" )
net.Receive( "update_bool_noclip_effect", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_noclip_effect", "bool_noclip_effect", b )
end)

util.AddNetworkString( "update_bool_noclip_model" )
net.Receive( "update_bool_noclip_model", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_noclip_model", "bool_noclip_model", b )
end)

util.AddNetworkString( "update_text_noclip_mdl" )
net.Receive( "update_text_noclip_mdl", function( len, ply )
  local str = net.ReadString()
  GeneralUpdateString( ply, "update_text_noclip_mdl", "text_noclip_mdl", str )
end)

util.AddNetworkString( "update_bool_noclip_tags" )
net.Receive( "update_bool_noclip_tags", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_noclip_tags", "bool_noclip_tags", b )
end)

util.AddNetworkString( "update_bool_noclip_stealth" )
net.Receive( "update_bool_noclip_stealth", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_noclip_stealth", "bool_noclip_stealth", b )
end)


util.AddNetworkString( "update_text_server_collectionid" )
net.Receive( "update_text_server_collectionid", function( len, ply )
  local str = net.ReadString()
  GeneralUpdateString( ply, "update_text_server_collectionid", "text_server_collectionid", str )
end)


util.AddNetworkString( "update_text_server_logo" )
net.Receive( "update_text_server_logo", function( len, ply )
  local str = net.ReadString()
  GeneralUpdateString( ply, "update_text_server_logo", "text_server_logo", str )
end)


util.AddNetworkString( "update_text_server_rules" )
net.Receive( "update_text_server_rules", function( len, ply )
  local str = net.ReadString()
  GeneralUpdateString( ply, "update_text_server_rules", "text_server_rules", str )
end)



--[[ GAMEMODE SETTINGS ]]--
util.AddNetworkString( "update_text_gamemode_name" )
net.Receive( "update_text_gamemode_name", function( len, ply )
  local str = net.ReadString()
  GeneralUpdateString( ply, "update_text_gamemode_name", "text_gamemode_name", str )
  GAMEMODE.BaseName = str
end)

util.AddNetworkString( "update_bool_graffiti_disabled" )
net.Receive( "update_bool_graffiti_disabled", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_graffiti_disabled", "bool_graffiti_disabled", b )
end)

util.AddNetworkString( "update_bool_anti_bhop" )
net.Receive( "update_bool_anti_bhop", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_anti_bhop", "bool_anti_bhop", b )
end)

util.AddNetworkString( "update_bool_suicide_disabled" )
net.Receive( "update_bool_suicide_disabled", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_suicide_disabled", "bool_suicide_disabled", b )
end)


util.AddNetworkString( "update_bool_drop_items_on_death" )
net.Receive( "update_bool_drop_items_on_death", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_drop_items_on_death", "bool_drop_items_on_death", b )
end)


util.AddNetworkString( "update_bool_players_can_drop_weapons" )
net.Receive( "update_bool_players_can_drop_weapons", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_players_can_drop_weapons", "bool_players_can_drop_weapons", b )
end)


util.AddNetworkString( "update_bool_dealers_can_take_damage" )
net.Receive( "update_bool_dealers_can_take_damage", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_dealers_can_take_damage", "bool_dealers_can_take_damage", b )
end)


util.AddNetworkString( "update_text_view_distance" )
net.Receive( "update_text_view_distance", function( len, ply )
  local str = net.ReadString()
  GeneralUpdateString( ply, "update_text_view_distance", "text_view_distance", str )
end)


util.AddNetworkString( "update_text_chat_advert" )
net.Receive( "update_text_chat_advert", function( len, ply )
  local str = net.ReadString()
  GeneralUpdateString( ply, "update_text_chat_advert", "text_chat_advert", str )
end)



--[[ GAMEMODE SYSTEMS ]]--
util.AddNetworkString( "update_bool_hunger" )
net.Receive( "update_bool_hunger", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_hunger", "bool_hunger", b )
end)

util.AddNetworkString( "update_text_hunger_health_regeneration_tickrate" )
net.Receive( "update_text_hunger_health_regeneration_tickrate", function( len, ply )
  local str = net.ReadString()
  GeneralUpdateString( ply, "update_text_hunger_health_regeneration_tickrate", "text_hunger_health_regeneration_tickrate", str )
end)

util.AddNetworkString( "update_bool_thirst" )
net.Receive( "update_bool_thirst", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_thirst", "bool_thirst", b )
end)

util.AddNetworkString( "update_bool_stamina" )
net.Receive( "update_bool_stamina", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_stamina", "bool_stamina", b )
end)


util.AddNetworkString( "update_bool_building_system" )
net.Receive( "update_bool_building_system", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_building_system", "bool_building_system", b )
end)

util.AddNetworkString( "update_bool_inventory_system" )
net.Receive( "update_bool_inventory_system", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_inventory_system", "bool_inventory_system", b )
end)

util.AddNetworkString( "update_bool_realistic_system" )
net.Receive( "update_bool_realistic_system", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_realistic_system", "bool_realistic_system", b )
end)


util.AddNetworkString( "update_bool_appearance_system" )
net.Receive( "update_bool_appearance_system", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_appearance_system", "bool_appearance_system", b )
end)

util.AddNetworkString( "update_bool_smartphone_system" )
net.Receive( "update_bool_smartphone_system", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_smartphone_system", "bool_smartphone_system", b )
end)

util.AddNetworkString( "update_bool_weapon_lowering_system" )
net.Receive( "update_bool_weapon_lowering_system", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_weapon_lowering_system", "bool_weapon_lowering_system", b )
end)


util.AddNetworkString( "update_bool_players_can_switch_role" )
net.Receive( "update_bool_players_can_switch_role", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_players_can_switch_role", "bool_players_can_switch_role", b )
end)


util.AddNetworkString( "update_bool_3d_voice" )
net.Receive( "update_bool_3d_voice", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_3d_voice", "bool_3d_voice", b )
end)

util.AddNetworkString( "update_bool_voice_channels" )
net.Receive( "update_bool_voice_channels", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_voice_channels", "bool_voice_channels", b )
end)



--[[ GAMEMODE VISUALS ]]--
util.AddNetworkString( "update_bool_yrp_chat" )
net.Receive( "update_bool_yrp_chat", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_yrp_chat", "bool_yrp_chat", b )
end)

util.AddNetworkString( "update_bool_yrp_chat_show_rolename" )
net.Receive( "update_bool_yrp_chat_show_rolename", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_yrp_chat_show_rolename", "bool_yrp_chat_show_rolename", b )
end)

util.AddNetworkString( "update_bool_yrp_chat_show_groupname" )
net.Receive( "update_bool_yrp_chat_show_groupname", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_yrp_chat_show_groupname", "bool_yrp_chat_show_groupname", b )
end)


util.AddNetworkString( "update_bool_yrp_crosshair" )
net.Receive( "update_bool_yrp_crosshair", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_yrp_crosshair", "bool_yrp_crosshair", b )
end)


util.AddNetworkString( "update_bool_yrp_hud" )
net.Receive( "update_bool_yrp_hud", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_yrp_hud", "bool_yrp_hud", b )
end)


util.AddNetworkString( "update_bool_yrp_scoreboard" )
net.Receive( "update_bool_yrp_scoreboard", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_yrp_scoreboard", "bool_yrp_scoreboard", b )
end)

util.AddNetworkString( "update_bool_yrp_scoreboard_show_usergroup" )
net.Receive( "update_bool_yrp_scoreboard_show_usergroup", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_yrp_scoreboard_show_usergroup", "bool_yrp_scoreboard_show_usergroup", b )
end)

util.AddNetworkString( "update_bool_yrp_scoreboard_show_rolename" )
net.Receive( "update_bool_yrp_scoreboard_show_rolename", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_yrp_scoreboard_show_rolename", "bool_yrp_scoreboard_show_rolename", b )
end)

util.AddNetworkString( "update_bool_yrp_scoreboard_show_groupname" )
net.Receive( "update_bool_yrp_scoreboard_show_groupname", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_yrp_scoreboard_show_groupname", "bool_yrp_scoreboard_show_groupname", b )
end)

util.AddNetworkString( "update_bool_yrp_scoreboard_show_language" )
net.Receive( "update_bool_yrp_scoreboard_show_language", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_yrp_scoreboard_show_language", "bool_yrp_scoreboard_show_language", b )
end)

util.AddNetworkString( "update_bool_yrp_scoreboard_show_playtime" )
net.Receive( "update_bool_yrp_scoreboard_show_playtime", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_yrp_scoreboard_show_playtime", "bool_yrp_scoreboard_show_playtime", b )
end)

util.AddNetworkString( "update_bool_yrp_scoreboard_show_frags" )
net.Receive( "update_bool_yrp_scoreboard_show_frags", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_yrp_scoreboard_show_frags", "bool_yrp_scoreboard_show_frags", b )
end)

util.AddNetworkString( "update_bool_yrp_scoreboard_show_deaths" )
net.Receive( "update_bool_yrp_scoreboard_show_deaths", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_yrp_scoreboard_show_deaths", "bool_yrp_scoreboard_show_deaths", b )
end)


util.AddNetworkString( "update_bool_tag_on_head" )
net.Receive( "update_bool_tag_on_head", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_tag_on_head", "bool_tag_on_head", b )
end)

util.AddNetworkString( "update_bool_tag_on_head_name" )
net.Receive( "update_bool_tag_on_head_name", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_tag_on_head_name", "bool_tag_on_head_name", b )
end)

util.AddNetworkString( "update_bool_tag_on_head_clan" )
net.Receive( "update_bool_tag_on_head_clan", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_tag_on_head_clan", "bool_tag_on_head_clan", b )
end)

util.AddNetworkString( "update_bool_tag_on_head_rolename" )
net.Receive( "update_bool_tag_on_head_rolename", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_tag_on_head_rolename", "bool_tag_on_head_rolename", b )
end)

util.AddNetworkString( "update_bool_tag_on_head_groupname" )
net.Receive( "update_bool_tag_on_head_groupname", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_tag_on_head_groupname", "bool_tag_on_head_groupname", b )
end)

util.AddNetworkString( "update_bool_tag_on_head_health" )
net.Receive( "update_bool_tag_on_head_health", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_tag_on_head_health", "bool_tag_on_head_health", b )
end)

util.AddNetworkString( "update_bool_tag_on_head_armor" )
net.Receive( "update_bool_tag_on_head_armor", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_tag_on_head_armor", "bool_tag_on_head_armor", b )
end)

util.AddNetworkString( "update_bool_tag_on_head_usergroup" )
net.Receive( "update_bool_tag_on_head_usergroup", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_tag_on_head_usergroup", "bool_tag_on_head_usergroup", b )
end)

util.AddNetworkString( "update_bool_tag_on_head_voice" )
net.Receive( "update_bool_tag_on_head_voice", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_tag_on_head_voice", "bool_tag_on_head_voice", b )
end)

util.AddNetworkString( "update_bool_tag_on_head_chat" )
net.Receive( "update_bool_tag_on_head_chat", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_tag_on_head_chat", "bool_tag_on_head_chat", b )
end)


util.AddNetworkString( "update_bool_tag_on_side" )
net.Receive( "update_bool_tag_on_side", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_tag_on_side", "bool_tag_on_side", b )
end)

util.AddNetworkString( "update_bool_tag_on_side_name" )
net.Receive( "update_bool_tag_on_side_name", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_tag_on_side_name", "bool_tag_on_side_name", b )
end)

util.AddNetworkString( "update_bool_tag_on_side_clan" )
net.Receive( "update_bool_tag_on_side_clan", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_tag_on_side_clan", "bool_tag_on_side_clan", b )
end)

util.AddNetworkString( "update_bool_tag_on_side_rolename" )
net.Receive( "update_bool_tag_on_side_rolename", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_tag_on_side_rolename", "bool_tag_on_side_rolename", b )
end)

util.AddNetworkString( "update_bool_tag_on_side_groupname" )
net.Receive( "update_bool_tag_on_side_groupname", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_tag_on_side_groupname", "bool_tag_on_side_groupname", b )
end)

util.AddNetworkString( "update_bool_tag_on_side_health" )
net.Receive( "update_bool_tag_on_side_health", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_tag_on_side_health", "bool_tag_on_side_health", b )
end)

util.AddNetworkString( "update_bool_tag_on_side_armor" )
net.Receive( "update_bool_tag_on_side_armor", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_tag_on_side_armor", "bool_tag_on_side_armor", b )
end)

util.AddNetworkString( "update_bool_tag_on_side_usergroup" )
net.Receive( "update_bool_tag_on_side_usergroup", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_tag_on_side_usergroup", "bool_tag_on_side_usergroup", b )
end)



--[[ MONEY SETTINGS ]]--
util.AddNetworkString( "update_bool_drop_money_on_death" )
net.Receive( "update_bool_drop_money_on_death", function( len, ply )
  local b = btn( net.ReadBool() )
  GeneralUpdateBool( ply, "update_bool_drop_money_on_death", "bool_drop_money_on_death", b )
end)

util.AddNetworkString( "update_text_money_max_amount_of_dropped_money" )
net.Receive( "update_text_money_max_amount_of_dropped_money", function( len, ply )
  local str = net.ReadString()
  GeneralUpdateString( ply, "update_text_money_max_amount_of_dropped_money", "text_money_max_amount_of_dropped_money", str )
end)


util.AddNetworkString( "update_text_money_pre" )
net.Receive( "update_text_money_pre", function( len, ply )
  local str = net.ReadString()
  GeneralUpdateString( ply, "update_text_money_pre", "text_money_pre", str )
end)

util.AddNetworkString( "update_text_money_pos" )
net.Receive( "update_text_money_pos", function( len, ply )
  local str = net.ReadString()
  GeneralUpdateString( ply, "update_text_money_pos", "text_money_pos", str )
end)



--[[ SOCIAL SETTINGS ]]--
util.AddNetworkString( "update_text_social_website" )
net.Receive( "update_text_social_website", function( len, ply )
  local str = net.ReadString()
  GeneralUpdateString( ply, "update_text_social_website", "text_social_website", str )
end)

util.AddNetworkString( "update_text_social_forum" )
net.Receive( "update_text_social_forum", function( len, ply )
  local str = net.ReadString()
  GeneralUpdateString( ply, "update_text_social_forum", "text_social_forum", str )
end)

util.AddNetworkString( "update_text_social_discord" )
net.Receive( "update_text_social_discord", function( len, ply )
  local str = net.ReadString()
  GeneralUpdateString( ply, "update_text_social_discord", "text_social_discord", str )
end)

util.AddNetworkString( "update_text_social_teamspeak" )
net.Receive( "update_text_social_teamspeak", function( len, ply )
  local str = net.ReadString()
  GeneralUpdateString( ply, "update_text_social_teamspeak", "text_social_teamspeak", str )
end)

util.AddNetworkString( "update_text_social_youtube" )
net.Receive( "update_text_social_youtube", function( len, ply )
  local str = net.ReadString()
  GeneralUpdateString( ply, "update_text_social_youtube", "text_social_youtube", str )
end)

util.AddNetworkString( "update_text_social_twitter" )
net.Receive( "update_text_social_twitter", function( len, ply )
  local str = net.ReadString()
  GeneralUpdateString( ply, "update_text_social_twitter", "text_social_twitter", str )
end)

util.AddNetworkString( "update_text_social_facebook" )
net.Receive( "update_text_social_facebook", function( len, ply )
  local str = net.ReadString()
  GeneralUpdateString( ply, "update_text_social_facebook", "text_social_facebook", str )
end)

util.AddNetworkString( "update_text_social_steamgroup" )
net.Receive( "update_text_social_steamgroup", function( len, ply )
  local str = net.ReadString()
  GeneralUpdateString( ply, "update_text_social_steamgroup", "text_social_steamgroup", str )
end)



--[[ OLD GETTER BELOW ]]--
util.AddNetworkString( "db_jailaccess" )
net.Receive( "db_jailaccess", function( len, ply )
  local _dbTable = net.ReadString()
  local _dbSets = net.ReadString()

  local _result = SQL_UPDATE( _dbTable, _dbSets, "uniqueID = 1" )
  if _result != nil then
    printGM( "error", "access_jail failed! " .. tostring( _dbTable ) .. " | " .. tostring( _dbSets ) )
  end
end)

util.AddNetworkString( "dbUpdate" )
net.Receive( "dbUpdate", function( len, ply )
  local _dbTable = net.ReadString()
  local _dbSets = net.ReadString()
  local _dbWhile = net.ReadString()
  local _result = SQL_UPDATE( _dbTable, _dbSets, _dbWhile )
  local _usergroup_ = string.Explode( " ", _dbWhile )
  local _restriction_ = string.Explode( " ", SQL_STR_IN( _dbSets ) )
  printGM( "note", "[OLD DBUPDATE] " .. ply:SteamName() .. " SETS " .. _dbSets .. " WHERE " .. _dbWhile )
end)



-- Scoreboard Commands
util.AddNetworkString( "ply_kick" )
net.Receive( "ply_kick", function( len, ply )
  if ply:HasAccess() then
    local _target = net.ReadEntity()
    if _target:IsPlayer() then
      _target:Kick( "You get kicked by " .. ply:YRPName() )
    end
  end
end)
util.AddNetworkString( "ply_ban" )
net.Receive( "ply_ban", function( len, ply )
  if ply:HasAccess() then
    local _target = net.ReadEntity()
    if ea( _target ) then
      if _target:IsPlayer() then
        _target:Ban( 24*60, false )
        _target:Kick( "You get banned for 24 hours by " .. ply:YRPName() )
      end
    else
      printGM( "note", "ply_ban " .. tostring( _target ) .. " IS NIL => NOT AVAILABLE" )
    end
  end
end)

util.AddNetworkString( "tp_tpto" )
net.Receive( "tp_tpto", function( len, ply )
  if ply:HasAccess() then
    local _target = net.ReadEntity()
    teleportToPoint( ply, _target:GetPos() )
  end
end)
util.AddNetworkString( "tp_bring" )
net.Receive( "tp_bring", function( len, ply )
  if ply:HasAccess() then
    local _target = net.ReadEntity()
    teleportToPoint( _target, ply:GetPos() )
  end
end)
util.AddNetworkString( "tp_jail" )
net.Receive( "tp_jail", function( len, ply )
  if ply:HasAccess() then
    local _target = net.ReadEntity()
    teleportToJailpoint( _target )
    _target:SetNWBool( "injail", true )
    _target:SetNWInt( "jailtime", 5*60 )
  end
end)
util.AddNetworkString( "tp_unjail" )
net.Receive( "tp_unjail", function( len, ply )
  if ply:HasAccess() then
    local _target = net.ReadEntity()
    teleportToReleasepoint( _target )
    _target:SetNWBool( "injail", false )
  end
end)

function DoRagdoll( ply )
  ply:SetNWBool( "ragdolled", true )

  local tmp = ents.Create( "prop_ragdoll" )
  tmp:SetModel( ply:GetModel() )
  tmp:SetModelScale( ply:GetModelScale(), 0 )
  tmp:SetPos( ply:GetPos() + Vector( 0, 0, 0 ) )
  tmp:Spawn()

  ply:SetParent( tmp )
  ply:SetNWEntity( "ragdoll", tmp )

  RenderCloaked( ply )
end

function DoUnRagdoll( ply )
  ply:SetNWBool( "ragdolled", false )
  ply:SetParent( nil )

  local ragdoll = ply:GetNWEntity( "ragdoll" )
  if ea( ragdoll ) then
    ply:SetPos( ragdoll:GetPos() )
    ragdoll:Remove()
  end

  RenderNormal( ply )
end

util.AddNetworkString( "ragdoll" )
net.Receive( "ragdoll", function( len, ply )
  if ply:HasAccess() then
    local _target = net.ReadEntity()
    DoRagdoll( _target )
  end
end)
util.AddNetworkString( "unragdoll" )
net.Receive( "unragdoll", function( len, ply )
  if ply:HasAccess() then
    local _target = net.ReadEntity()
    DoUnRagdoll( _target )
  end
end)
util.AddNetworkString( "freeze" )
net.Receive( "freeze", function( len, ply )
  if ply:HasAccess() then
    local _target = net.ReadEntity()
    if _target:IsPlayer() then
      _target:Freeze( true )
      RenderFrozen( _target )
    end
  end
end)
util.AddNetworkString( "unfreeze" )
net.Receive( "unfreeze", function( len, ply )
  if ply:HasAccess() then
    local _target = net.ReadEntity()
    if _target:IsPlayer() then
      _target:Freeze( false )
      RenderNormal( _target )
    end
  end
end)
util.AddNetworkString( "god" )
net.Receive( "god", function( len, ply )
  if ply:HasAccess() then
    local _target = net.ReadEntity()
    _target:GodEnable()
    _target:AddFlags( FL_GODMODE )
    _target:SetNWBool( "godmode", true )
  end
end)
util.AddNetworkString( "ungod" )
net.Receive( "ungod", function( len, ply )
  if ply:HasAccess() then
    local _target = net.ReadEntity()
    _target:GodDisable()
    _target:RemoveFlags( FL_GODMODE )
    _target:SetNWBool( "godmode", false )
  end
end)
util.AddNetworkString( "cloak" )
net.Receive( "cloak", function( len, ply )
  if ply:HasAccess() then
    local _target = net.ReadEntity()
    if _target:IsPlayer() then
      _target:SetNWBool( "cloaked", true )
      RenderCloaked( _target )
    end
  end
end)
util.AddNetworkString( "uncloak" )
net.Receive( "uncloak", function( len, ply )
  if ply:HasAccess() then
    local _target = net.ReadEntity()
    if _target:IsPlayer() then
      _target:SetNWBool( "cloaked", false )
      RenderNormal( _target )
    end
  end
end)
util.AddNetworkString( "blind" )
net.Receive( "blind", function( len, ply )
  if ply:HasAccess() then
    local _target = net.ReadEntity()
    _target:SetNWBool( "blinded", true )
  end
end)
util.AddNetworkString( "unblind" )
net.Receive( "unblind", function( len, ply )
  if ply:HasAccess() then
    local _target = net.ReadEntity()
    _target:SetNWBool( "blinded", false )
  end
end)
util.AddNetworkString( "ignite" )
net.Receive( "ignite", function( len, ply )
  if ply:HasAccess() then
    local _target = net.ReadEntity()
    _target:Ignite( 10, 10 )
  end
end)
util.AddNetworkString( "extinguish" )
net.Receive( "extinguish", function( len, ply )
  if ply:HasAccess() then
    local _target = net.ReadEntity()
    _target:Extinguish()
  end
end)
util.AddNetworkString( "slay" )
net.Receive( "slay", function( len, ply )
  if ply:HasAccess() then
    local _target = net.ReadEntity()
    _target:Kill()
  end
end)
util.AddNetworkString( "slap" )
net.Receive( "slap", function( len, ply )
  if ply:HasAccess() then
    local _target = net.ReadEntity()
    _target:SetVelocity( Vector( 0, 0, 600 ) )
  end
end)
