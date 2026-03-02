local f = CreateFrame("Frame", "NoTargetCombatCircleFrame", UIParent)
f:RegisterEvent("PLAYER_REGEN_DISABLED")
f:RegisterEvent("PLAYER_REGEN_ENABLED")
f:RegisterEvent("PLAYER_SOFT_ENEMY_CHANGED")

local function NoTargetCombatCircle_OnEvent(self, event, ...)
	if event == "PLAYER_REGEN_DISABLED" then
		if C_CVar.GetCVar("SoftTargetEnemy") ~= "3" then
			C_CVar.SetCVar("SoftTargetEnemy","3")
		end
		NoTargetCombatCircle_combat_state_check = true
	end
	if event == "PLAYER_REGEN_ENABLED" then
		NoTargetCombatCircle_combat_state = false
		NoTargetCombatCircle_combat_state_check = false
		NoTargetCombatCircleFrame:Hide()
		if C_CVar.GetCVar("SoftTargetEnemy") == "3" then
			C_CVar.SetCVar("SoftTargetEnemy","0")
		end
	end
end

function NoTargetCombatCircle_OnUpdate()
	if not IsMounted() then
		if NoTargetCombatCircle_combat_state_check then
			if UnitExists("anyenemy") then
				NoTargetCombatCircle_combat_state = true
			end
		end
	end

	if NoTargetCombatCircle_combat_state then
		if UnitIsDead("target") and UnitExists("anyenemy") then
			NoTargetCombatCircle_Hide()
		end

		if UnitExists("target") then
			NoTargetCombatCircle_Hide()
		end

		if UnitExists("anyenemy") then
			NoTargetCombatCircle_Hide()
		else
			NoTargetCombatCircle_Interrupt_Check()
		end
	else
		NoTargetCombatCircle_Hide()
	end
end

--[[		if NoTargetCombatCircle_combat_state then
			if UnitIsDead("target") and UnitExists("softtarget") then
				if NoTargetCombatCircleFrame:IsShown() then
					NoTargetCombatCircleFrame:Hide()
					print("Hide")
				end
			else
				if UnitIsDead("target") == false then
					if UnitExists("target") == false then
						NoTargetCombatCircle_Interrupt_Check()
					else
						if NoTargetCombatCircleFrame:IsShown() then
							NoTargetCombatCircleFrame:Hide()
							print("Hide")
						end
					end
				end
			end
		else
			if NoTargetCombatCircleFrame:IsShown() then
				NoTargetCombatCircleFrame:Hide()
				print("Hide")
			end
		end
	end]]

function NoTargetCombatCircle_Interrupt_Check()
	--print("NoTargetCombatCircle_Interrupt_Check()")
	C_Timer.NewTimer(1.5, function() NoTargetCombatCircleFrame:Show() end)
end

function NoTargetCombatCircle_Hide()
	if NoTargetCombatCircleFrame:IsShown() then
		NoTargetCombatCircleFrame:Hide()
		--print("Hide")
	end
end


f:SetScript("OnEvent", NoTargetCombatCircle_OnEvent)
f:SetScript("OnUpdate", NoTargetCombatCircle_OnUpdate)