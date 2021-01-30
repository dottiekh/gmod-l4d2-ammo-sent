AddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent.

include('shared.lua')

function ENT:Draw()
    self:DrawModel() -- Draws Model Client Side
end

function ENT:Initialize()
	self:SetModel( "models/props/terror/ammo_stack.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,
	self:SetMoveType( MOVETYPE_VPHYSICS )   -- after all, gmod is a physics
	self:SetSolid( SOLID_VPHYSICS )         -- Toolbox
	local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
end

function ENT:Use( activator, caller )
	if IsValid(activator) and activator:IsPlayer() and activator:KeyPressed(IN_USE) then -- check if valid player is using
		local ammoType = activator:GetActiveWeapon():GetPrimaryAmmoType()
		if ammoType ~= -1 then     -- make sure weapon HAS ammo 
			activator:GiveAmmo(9999, ammoType)
		else return end
	end
end

function ENT:Think()
end

function ENT:OnRemove()
end