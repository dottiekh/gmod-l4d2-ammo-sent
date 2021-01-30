AddCSLuaFile( "cl_init.lua" ) 
AddCSLuaFile( "shared.lua" ) 

include('shared.lua')

function ENT:Draw()
    self:DrawModel() -- Draws Model Client Side
end

function ENT:Initialize()
	self:SetModel( "models/props/terror/ammo_stack.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )     
	self:SetMoveType( MOVETYPE_VPHYSICS )   --gives prop physics, can be MOVETYPE_NONE to be "frozen"
	self:SetSolid( SOLID_VPHYSICS )         
	local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
end

-- activated when SENT is used
function ENT:Use( activator, caller )
	if IsValid(activator) and activator:IsPlayer() and activator:KeyPressed(IN_USE) then -- check if valid player is using
		local ammoType = activator:GetActiveWeapon():GetPrimaryAmmoType() -- get ammo type of active wep
		if ammoType ~= -1 then     -- make sure weapon HAS ammo (ignore melee, physcannon, etc)
			activator:GiveAmmo(9999, ammoType) 
		else return end
	end
end

function ENT:Think()
end

function ENT:OnRemove()
end
