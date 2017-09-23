--Copyright (C) 2017 Arno Zura ( https://www.gnu.org/licenses/gpl.txt )

AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )

resource.AddFile( "models/props/cs_assault/money.mdl" )

function ENT:Initialize()
	self:SetModel( "models/props/cs_assault/money.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )

  local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end

	self:SetNWInt( "money", 0 )
end

function ENT:GetMoney()
	return self:GetNWInt( "money" )
end

function ENT:SetMoney( money )
	self:SetNWInt( "money", tonumber( money ) )
end

function ENT:Use( activator, caller )
	activator:addMoney( self:GetMoney() )
  self:Remove()
end

function ENT:Think()

end