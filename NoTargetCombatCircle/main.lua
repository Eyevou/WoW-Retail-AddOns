local f = CreateFrame("Frame", "NoTargetCombatCircleFrame", UIParent)
f:RegisterEvent("PLAYER_REGEN_DISABLED")
f:RegisterEvent("PLAYER_REGEN_ENABLED")

local function NoTargetCombatCircle_OnEvent(self, event, ...)
	if event == "PLAYER_REGEN_DISABLED" then
		if C_CVar.GetCVar("SoftTargetEnemy") == "0" then
			C_CVar.SetCVar("SoftTargetEnemy","3")
		--	print("|cffFFC125Action Targeting is now:|r |cff00ff00ENABLED!|r")
		end
		NoTargetCombatCircle_combat_state_check = true
	end
	if event == "PLAYER_REGEN_ENABLED" then
		NoTargetCombatCircle_combat_state = false
		NoTargetCombatCircle_combat_state_check = false
		NoTargetCombatCircleFrame:Hide()
		if C_CVar.GetCVar("SoftTargetEnemy") == "3" then
			C_CVar.SetCVar("SoftTargetEnemy","0")
		--	print("|cffFFC125Action Targeting is now:|r |cffFF0000DISABLED!|r")
		end
	end
end

-- TargetFrameXML
function NoTargetCombatCircle_OnUpdate()

	if NoTargetCombatCircle_combat_state_check == true then
		if UnitExists("target") then
			NoTargetCombatCircle_combat_state = true
		end
	end

	if NoTargetCombatCircle_combat_state then
		if UnitExists("target") == false then
			NoTargetCombatCircle_Interrupt_Check()
		else
			NoTargetCombatCircleFrame:Hide()
		end
	else
		if NoTargetCombatCircleFrame:IsShown() then
			NoTargetCombatCircleFrame:Hide()
		end
	end
end

function NoTargetCombatCircle_Interrupt_Check()
	C_Timer.NewTimer(1.5, function() NoTargetCombatCircleFrame:Show() end)
end

f:SetScript("OnEvent", NoTargetCombatCircle_OnEvent)
f:SetScript("OnUpdate", NoTargetCombatCircle_OnUpdate)