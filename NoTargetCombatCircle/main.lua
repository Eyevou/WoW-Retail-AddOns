local f = CreateFrame("Frame", "NoTargetCombatCircleFrame", UIParent)
f:RegisterEvent("PLAYER_REGEN_DISABLED")
f:RegisterEvent("PLAYER_REGEN_ENABLED")

local function NoTargetCombatCircle_OnEvent(self, event, ...)
	if event == "PLAYER_REGEN_DISABLED" then
		NoTargetCombatCircle_combat_state = true
	end
	if event == "PLAYER_REGEN_ENABLED" then
		NoTargetCombatCircle_combat_state = false
		NoTargetCombatCircleFrame:Hide()
	end
end

-- TargetFrameXML
function NoTargetCombatCircle_OnUpdate()
	if NoTargetCombatCircle_combat_state then
		if UnitExists("target") == false then
			NoTargetCombatCircleFrame:Show()
		else
			NoTargetCombatCircleFrame:Hide()
		end
	end
end

f:SetScript("OnEvent", NoTargetCombatCircle_OnEvent)
f:SetScript("OnUpdate", NoTargetCombatCircle_OnUpdate)