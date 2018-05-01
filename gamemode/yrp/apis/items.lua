--Copyright (C) 2017-2018 Arno Zura ( https://www.gnu.org/licenses/gpl.txt )

--[[ GLOBAL ]]--
ITEM_MAXH = 3
ITEM_MAXW = 8
INV_MAXW = ITEM_MAXW

--[[ SHARED ]]--

function PrintStorage( tab )
  printGM( "db", tostring( tab ) )
  for y=1, #tab do
    local _row = ""
    for x=1, INV_MAXW do
      local _item = tab[y][x].value
      if tostring( _item ) == "" then
        _item = "[EMPTY]"
      end
      _row = _row .. tostring( _item ) .. "\t"
    end
    printGM( "db", _row )
  end
  printGM( "db", "________________________________")
end

function distance( num1, num2 )
  return math.abs( num1 ) + math.abs( num2 )
end

function AddItemToTable( tab, item )
  local x = item.posx
  local y = item.posy
  local w = item.sizew
  local h = item.sizeh
  for _y = y, y+h-1 do
    for _x = x, x+w-1 do
      tab[_y][_x].value = item.uniqueID
    end
  end
  return tab
end

function AddTableAxis( tab, axis, value )
  local _tmp = {}
  _tmp.axis = axis
  _tmp.value = value
  table.insert( tab, _tmp )
end

function GetEntityItemSize( ent )
  if ent:ItemSizeW() == nil and ent:ItemSizeH() == nil then
    local _maxs = ent:OBBMaxs()
    local _mins = ent:OBBMins()
    local _axis = {}
    AddTableAxis( _axis, "x", distance( _mins.x, _maxs.x ) )
    AddTableAxis( _axis, "y", distance( _mins.y, _maxs.y ) )
    AddTableAxis( _axis, "z", distance( _mins.z, _maxs.z ) )
    table.SortByMember( _axis, "value" )

    local _result = {}
    local _scale = 6
    _result.sizew = _axis[1].value/_scale - _axis[1].value/_scale%1
    _result.sizeh = _axis[2].value/_scale - _axis[2].value/_scale%1

    if _result.sizew < 1 then
      _result.sizew = 1
    end
    if _result.sizeh < 1 then
      _result.sizeh = 1
    end
    if _result.sizew > INV_MAXW then
      _result.sizew = INV_MAXW
    end
    if _result.sizeh > ITEM_MAXH then
      _result.sizeh = ITEM_MAXH
    end
    return _result
  else
    local _result = {}
    _result.sizew = ent:ItemSizeW()
    _result.sizeh = ent:ItemSizeH()
    return _result
  end
  return false
end

function GetSurroundingEntities( ply )
  local _ents = ents.FindInSphere( ply:GetPos(), 60 )
  local _tab = {}
  for i, ent in pairs( _ents ) do
    if ent:GetModel() != nil and ent:GetModel() != "" then
      if !ent:IsPlayer() and !ent:IsNPC() and !ent:IsRagdoll() and !ent:IsVehicle() then
        if !ent:IsWorld() then
          if !ent:GetPersistent() then
            if ent:GetParent() != ply then
              if !ent:GetParent():IsVehicle() and !string.find( ent:GetClass(), "wheel" ) then
                if !ent:IsWorldStorage() then
                  table.insert( _tab, ent )
                end
              end
            end
          end
        end
      end
    end
  end
  return _tab
end

function FormatEntityToItem( ent )
  local _item = {}
  _item.ClassName = ent:GetClass()
  if ent.GetPrintName then
    _item.PrintName = ent:GetPrintName() or ent.PrintName or "UNNAMED"
  else
    _item.PrintName = ent.PrintName or ent:GetClass() or "UNNAMED"
  end
  _item.WorldModel = ent:GetModel()
  _item.storageID = 0
  _item.entity = ent
  local _size = GetEntityItemSize( ent )
  _item.sizew = _size.sizew
  _item.sizeh = _size.sizeh
  _item.posx = 0
  _item.posy = 0
  _item.uniqueID = ent:EntIndex()
  return _item
end

function GetSurroundingItems( ply )
  local _ents = GetSurroundingEntities( ply )
  local _items = {}
  for i, ent in pairs( _ents ) do
    table.insert( _items, FormatEntityToItem( ent ) )
  end
  return _items
end

function IsEnoughSpace( stor, w, h, x, y, uid )
  for _y = y, y+h-1 do
    for _x = x, x+w-1 do
      if stor[_y][_x] != nil then
        if stor[_y][_x].value != "" and stor[_y][_x].value != tostring( uid ) then
          return false
        end
      else
        return false
      end
    end
  end
  return true
end

function FindPlace( stor, w, h )
  for y = 1, #stor do
    for x = 1, #stor[y] do
      if stor[y][x].value == "" then
        if IsEnoughSpace( stor, w, h, x, y, "" ) then
          return true, x, y
        end
      end
    end
  end
  return false
end

function AddToStorage( stor, item )
  local _w = item.sizew
  local _h = item.sizeh

  for y = 1, #stor do
    for x = 1, #stor[y] do
      if stor[y][x].value == "" then
        if IsEnoughSpace( stor, _w, _h, x, y, "" ) then
          item.posx = x
          item.posy = y
          --[[ Add to stor ]]--
          for _y = y, y+_h-1 do
            for _x = x, x+_w-1 do
              stor[_y][_x].value = item.uniqueID
            end
          end
          return stor
        end
      end
    end
  end
  return stor
end

function GetSurroundingStorageSize( tab )
  local _size = {}
  _size.sizew = INV_MAXW
  _size.sizeh = 1

  local _arr = {}
  for y=1, #tab*ITEM_MAXH do
    _arr[y] = {}
    for x=1, INV_MAXW do
      _arr[y][x] = {}
      _arr[y][x].value = ""
    end
  end

  for i, item in pairs( tab ) do
    _arr = AddToStorage( _arr, item )
  end

  local _h = 1
  for y = 1, #_arr do
    for x = 1, INV_MAXW do
      if _arr[y][x].value != "" then
        _size.sizeh = y
      end
    end
  end
  return _size
end

function GetSurroundingStorage( ply )
  local _sur = {}
  _sur.ClassName = "WORLD"
  _sur.ParentID = ply:SteamID()
  _sur.name = "NearbyItems"
  _sur.posx = ply:GetPos().x
  _sur.posy = ply:GetPos().y
  _sur.posz = ply:GetPos().z
  _sur.uniqueID = 0
  _sur.map = GetMapNameDB()

  local _items = GetSurroundingItems( ply )
  local _size = GetSurroundingStorageSize( _items )
  _sur.sizew = _size.sizew
  _sur.sizeh = _size.sizeh + ITEM_MAXH
  return _sur
end

--[[ CLIENT ]]--
if CLIENT then

  local item_handler = {}

  function getItemHandler()
    return item_handler
  end

  function RemoveStorage( pnl, uid )
    if uid != nil then
      if item_handler[tonumber(uid)] != nil then
        for y = 1, #item_handler[tonumber(uid)] do
          for x = 1, #item_handler[tonumber(uid)][y] do
            item_handler[tonumber(uid)][y][x].slot:Remove()
            local _item = item_handler[tonumber(uid)][y][x].item
            if pa( _item ) then
              _item:Remove()
              local _parent = _item:GetParent()
              if pa( _parent ) then
                _parent:Remove()
              end
            end
          end
        end
      end
    end
  end

  function AddStorage( pnl, uid, w, h, typ )
    if pa( pnl ) then
      item_handler[tonumber(uid)] = {}
      item_handler[tonumber(uid)].pnl = pnl
      pnl.uid = uid
      if pa( item_handler[tonumber(uid)].pnl ) then
        item_handler[tonumber(uid)].pnl:SetSize( ctr( 128*w ), ctr( 128*h ) )
        for y = 1, h do
          item_handler[tonumber(uid)][y] = {}
          for x = 1, w do
            item_handler[tonumber(uid)][y][x] = {}
            item_handler[tonumber(uid)][y][x].slot = createD( "DPanel", item_handler[tonumber(uid)].pnl, ctr( 128 ), ctr( 128 ), ctr( (x-1)*128 ), ctr( (y-1)*128 ) )
            local _edit_slot = item_handler[tonumber(uid)][y][x].slot
            item_handler[tonumber(uid)][y][x].value = ""
            _edit_slot.storageID = uid
            _edit_slot.posy = y
            _edit_slot.posx = x
            _edit_slot.typ = typ
            _edit_slot:Receiver( "slot", function( receiver, tableOfDroppedPanels, isDropped, menuIndex, mouseX, mouseY )
              if isDropped then
                local _item = tableOfDroppedPanels[1].item
                local _slot1 = {}
                _slot1.storageID = _item.storageID
                _slot1.posy = _item.posy
                _slot1.posx = _item.posx
                local _slot2 = {}
                _slot2.storageID = receiver.storageID
                _slot2.posy = receiver.posy
                _slot2.posx = receiver.posx
                local _typ = receiver.typ or "world"

                net.Start( "moveitem" )
                  net.WriteTable( _slot1 )
                  net.WriteTable( _slot2 )
                  net.WriteTable( _item )
                  net.WriteString( _typ )
                net.SendToServer()

                if tostring( _item.intern_storageID ) != "" then
                  net.Start( "update_backpack" )
                  net.SendToServer()
                end
              end
            end, {} )
            function _edit_slot:Paint( pw, ph )
              self.color = Color( 0, 0, 0, 0 )
              if self:IsHovered() then
                self.color = Color( 255, 255, 255, 200 )
              end
              surfaceBox( 0, 0, pw, ph, self.color )
              drawRBBR( 0, 0, 0, pw, ph, Color( 0, 0, 0 ), ctr( 4 ) )
            end
          end
        end
      end
    end
  end

  function ResetStorages()
    item_handler = {}
  end

  function GetItemHandlerStoragePnl( storageID )
    if item_handler != nil then
      if item_handler[tonumber(storageID)] != nil then
        return item_handler[tonumber(storageID)].pnl
      end
    end
    return NULL
  end

  function SetCamPosition( pnl, item )
    local _mins, _maxs = pnl.Entity:GetRenderBounds()
    local _center = (_mins + _maxs)/2
    pnl:SetFOV( 90 )
  	pnl:SetLookAt( _center )
    pnl:SetCamPos( _center - Vector( 0, item.sizew*6, 0 ) )
  end

  function AddItemToStorage( tab )
    if tab.entity != nil then
      tab.intern_storageID = tab.entity:GetNWString( "storage_uid", "" )
    end
    local _storage = item_handler[tonumber(tab.storageID)].pnl
    if pa( _storage ) then
      local _parent = item_handler[tonumber(tab.storageID)].pnl:GetParent()
      local _x, _y = item_handler[tonumber(tab.storageID)].pnl:GetPos()

      local _bg = createD( "DPanel", _parent, ctr( 128*tab.sizew ), ctr( 128*tab.sizeh ), _x + ctr( (tab.posx-1)*128 ), _y + ctr( (tab.posy-1)*128 ) )
      function _bg:Paint( pw, ph )
        surfaceBox( 0, 0, pw, ph, Color( 0, 0, 0, 240 ) )
      end
      function _bg:PaintOver( pw, ph )
        local _br = 2
        surfaceBox( 0, 0, pw, ctr( _br ), Color( 0, 0, 255, 255 ) )
        surfaceBox( 0, ph-ctr( _br ), pw, ctr( _br ), Color( 0, 0, 255, 255 ) )

        surfaceBox( 0, ctr( _br ), ctr( _br ), ph - ctr( _br*2 ), Color( 0, 0, 255, 255 ) )
        surfaceBox( pw-ctr( _br ), ctr( _br ), ctr( _br ), ph - ctr( _br*2 ), Color( 0, 0, 255, 255 ) )

        surfaceText( tab.PrintName, "mat1text", ctr( 20 ), ctr( 10 ), Color( 255, 255, 255 ), 0, 0 )
      end

      local _item = createD( "DModelPanel", _bg, ctr( 128*tab.sizew ), ctr( 128*tab.sizeh ), 0, 0 )
      _item:InvalidateLayout( true )
      _item:SetModel( tab.WorldModel )
      SetCamPosition( _item, tab )
      function _item:LayoutEntity( Entity ) return end

      local _item2 = createD( "DPanel", _bg, ctr( 128*tab.sizew ), ctr( 128*tab.sizeh ), 0, 0 )
      item_handler[tonumber(tab.storageID)][tonumber(tab.posy)][tonumber(tab.posx)].item = _item2
      item_handler[tonumber(tab.storageID)][tonumber(tab.posy)][tonumber(tab.posx)].value = tonumber( tab.uniqueID )
      local _i = item_handler[tonumber(tab.storageID)][tonumber(tab.posy)][tonumber(tab.posx)].item
      _i.item = tab
      function _i:Paint( pw, ph )
        --surfaceBox( 0, 0, pw, ph, Color( 0, 0, 0, 240 ) )
      end
      function _i:PaintOver( pw, ph )
        local _br = 2
        surfaceBox( 0, 0, pw, ctr( _br ), Color( 0, 0, 255, 255 ) )
        surfaceBox( 0, ph-ctr( _br ), pw, ctr( _br ), Color( 0, 0, 255, 255 ) )

        surfaceBox( 0, ctr( _br ), ctr( _br ), ph - ctr( _br*2 ), Color( 0, 0, 255, 255 ) )
        surfaceBox( pw-ctr( _br ), ctr( _br ), ctr( _br ), ph - ctr( _br*2 ), Color( 0, 0, 255, 255 ) )
      end
      _i:Droppable( "slot" )
      _i:SetToolTip( _i.item.PrintName .. "\n" .. _i.item.ClassName .. "\n" .. _i.item.WorldModel .. "\nW: " .. _i.item.sizew .. "\nH: " .. _i.item.sizeh )

      return _item
    end
  end

  net.Receive( "additemtostorage", function( len )
    local _item = net.ReadTable()
    AddItemToStorage( _item )
  end)

  net.Receive( "moveitem_slot1", function( len )
    local _s1 = net.ReadTable()

    --[[ ITEM ]]--
    local _i = item_handler[tonumber(_s1.storageID)][tonumber(_s1.posy)][tonumber(_s1.posx)]
    if _i.item != nil then
      _i.item:GetParent():Remove()
      _i.item:Remove()
      _i.item = nil
      _i.value = ""
    end
  end)

  net.Receive( "moveitem_slot2", function( len )
    local _s2 = net.ReadTable()
    local _i = net.ReadTable()

    _i.storageID = tonumber( _s2.storageID )
    _i.posy = tonumber( _s2.posy )
    _i.posx = tonumber( _s2.posx )

    _i.ClassName = tostring( _i.ClassName )
    _i.PrintName = tostring( _i.PrintName )
    _i.WorldModel = tostring( _i.WorldModel )
    _i.sizeh = tonumber( _i.sizeh )
    _i.sizew = tonumber( _i.sizew )
    _i.uniqueID = tonumber( _i.uniqueID )

    --[[ Target ]]--
    local _item = AddItemToStorage( _i )
  end)
end

--[[ SERVER ]]--
if SERVER then

end