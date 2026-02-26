local f = CreateFrame("Frame", "NoTargetCombatCircleFrame", UIParent)
f:RegisterEvent("PLAYER_REGEN_DISABLED")
f:RegisterEvent("PLAYER_REGEN_ENABLED")
f:RegisterEvent("PLAYER_SOFT_ENEMY_CHANGED")

-- UnitIsDead("target") -- True/False
-- IsInInstance() -- True/False
-- UnitExists("softenemy")
-- UnitExists("anyenemy")
-- isUsable, useError = C_MountJournal.GetMountUsabilityByID(mountID, checkIndoors)

local function NoTargetCombatCircle_OnEvent(self, event, ...)
	if event == "PLAYER_REGEN_DISABLED" then
		if C_CVar.GetCVar("SoftTargetEnemy") ~= "3" then
			C_CVar.SetCVar("SoftTargetEnemy","3")
			--print("|cffFFC125Action Targeting is now:|r |cff00ff00ENABLED!|r")
		end
		NoTargetCombatCircle_combat_state_check = true
	end
	if event == "PLAYER_REGEN_ENABLED" then
		NoTargetCombatCircle_combat_state = false
		NoTargetCombatCircle_combat_state_check = false
		NoTargetCombatCircleFrame:Hide()
		if C_CVar.GetCVar("SoftTargetEnemy") == "3" then
			C_CVar.SetCVar("SoftTargetEnemy","0")
			--print("|cffFFC125Action Targeting is now:|r |cffFF0000DISABLED!|r")
		end
	end
end

-- TargetFrameXML
function NoTargetCombatCircle_OnUpdate()
	if not IsMounted() then
		if NoTargetCombatCircle_combat_state_check then
			if UnitExists("anyenemy") then
				NoTargetCombatCircle_combat_state = true
			end
		end

		if NoTargetCombatCircle_combat_state then
			if UnitIsDead("target") == false then
				if UnitExists("target") == false then
					NoTargetCombatCircle_Interrupt_Check()
				else
					NoTargetCombatCircleFrame:Hide()
				end
			end
		else
			if NoTargetCombatCircleFrame:IsShown() then
				NoTargetCombatCircleFrame:Hide()
			end
		end
	end
end

function NoTargetCombatCircle_Interrupt_Check()
	C_Timer.NewTimer(1.5, function() NoTargetCombatCircleFrame:Show() end)
end

f:SetScript("OnEvent", NoTargetCombatCircle_OnEvent)
f:SetScript("OnUpdate", NoTargetCombatCircle_OnUpdate)