--[[ 
Known Bugs:
QueueStatusButton reactivates using the "UPDATE_INSTANCE_INFO" event.
Changing the state of a UI Element isn't always reflected after first toggle.
]]

function OnlyMinimap_Toggle()

	--GetUIBufferState()

	if not InCombatLockdown() then
		OMM_MISCFrameHandler()
		OMM_PlayerFrameHandler()
		OMM_ActionBarsBufferHandler()
		OMM_ChatFrameBufferHandler()
	else
		print("Must exit combat.")
	end
	
end

function GetUIBufferState()
--MISC
	if ObjectiveTrackerFrame:IsShown() then
		ObjectiveTrackerFrameBuffer = 1
	end
	if FramerateFrame:IsShown() then
		FramerateFrameBuffer = 1
	end
--Actionbars, Buffs, and Debuff
	if MicroMenu:IsShown() then
		MicroMenuBuffer = 1
	end
	if BagsBar:IsShown() then
		BagsBarBuffer = 1
	end
	if MainMenuBar:IsShown() then
		MainMenuBarBuffer = 1
	end
	if StanceBar:IsShown() then
		StanceBarBuffer = 1
	end
	if MultiBarLeft:IsShown() then
		MultiBarLeftBuffer = 1
	end
	if MultiBarRight:IsShown() then
		MultiBarRightBuffer = 1
	end
	if MultiBarBottomLeft:IsShown() then
		MultiBarBottomLeftBuffer = 1
	end
	if MultiBarBottomRight:IsShown() then
		MultiBarBottomRightBuffer = 1
	end
	if not MultiBar5:IsShown() then
		MultiBar5Buffer = nil
	end
	if MultiBar6:IsShown() then
		MultiBar6Buffer = 1
	end
	if MultiBar7:IsShown() then
		MultiBar7Buffer = 1
	end
	if MainStatusTrackingBarContainer:IsShown() then
		MainStatusTrackingBarContainerBuffer = 1
	end
	if SecondaryStatusTrackingBarContainer:IsShown() then
		SecondaryStatusTrackingBarContainerBuffer = 1
	end
	
end

function OMM_MISCFrameHandler()

	if ObjectiveTrackerFrame:IsShown() then
		ObjectiveTrackerFrame:Hide()
		ObjectiveTrackerFrameBuffer = 1
	elseif ObjectiveTrackerFrameBuffer then
		ObjectiveTrackerFrame:Show()
	else
	--	print("ERROR in ObjectiveTrackerFrameBuffer")
	end
	if FramerateFrame:IsShown() then
		FramerateFrame:Hide()
		FramerateFrameBuffer = 1
	elseif FramerateFrameBuffer then
		FramerateFrame:Show()
	else
		--print("ERROR in FramerateFrameBuffer")
	end
	if QueueStatusButton:IsShown() then
		QueueStatusButton:Hide()
		QueueStatusButtonBuffer = 1
	elseif QueueStatusButtonBuffer then
		QueueStatusButton:Show()
	else
		--print("ERROR in QueueStatusButtonBuffer")
	end

end

function OMM_ChatFrameBufferHandler()
	if ChatFrame1:IsShown() then
		ChatFrameBuffer = 1
		ChatFrame1:Hide()
	elseif ChatFrame2:IsShown() then
		ChatFrameBuffer = 2
		ChatFrame2:Hide()
	elseif ChatFrame3:IsShown() then
		ChatFrameBuffer = 3
		ChatFrame3:Hide()
	elseif ChatFrame4:IsShown() then
		ChatFrameBuffer = 4
		ChatFrame4:Hide()
	elseif ChatFrame5:IsShown() then
		ChatFrameBuffer = 5
		ChatFrame5:Hide()
	elseif ChatFrame6:IsShown() then
		ChatFrameBuffer = 6
		ChatFrame6:Hide()
	elseif ChatFrame7:IsShown() then
		ChatFrameBuffer = 7
		ChatFrame7:Hide()
	elseif ChatFrame8:IsShown() then
		ChatFrameBuffer = 8
		ChatFrame8:Hide()
	elseif ChatFrame9:IsShown() then
		ChatFrameBuffer = 9
		ChatFrame9:Hide()
	else
		if ChatFrameBuffer == 1 then
			ChatFrame1:Show()
		elseif ChatFrameBuffer == 2 then
			ChatFrame2:Show()
		elseif ChatFrameBuffer == 3 then
			ChatFrame3:Show()
		elseif ChatFrameBuffer == 4 then
			ChatFrame4:Show()
		elseif ChatFrameBuffer == 5 then
			ChatFrame5:Show()
		elseif ChatFrameBuffer == 6 then
			ChatFrame6:Show()
		elseif ChatFrameBuffer == 7 then
			ChatFrame7:Show()
		elseif ChatFrameBuffer == 8 then
			ChatFrame8:Show()
		elseif ChatFrameBuffer == 9 then
			ChatFrame9:Show()
		else
			print("ERROR in ChatFrameBuffer")
		end
	end
		
	if QuickJoinToastButton:IsShown() then
		QuickJoinToastButton:Hide()
		QuickJoinToastButtonBuffer = 1
	elseif QuickJoinToastButtonBuffer then
		QuickJoinToastButton:Show()
	else
		print("ERROR in QuickJoinToastButtonBuffer")
	end
	if GeneralDockManager:IsShown() then
		GeneralDockManager:Hide()
		GeneralDockManagerBuffer = 1
	elseif GeneralDockManagerBuffer then
		GeneralDockManager:Show()
	else
		print("ERROR in GeneralDockManagerBuffer")
	end
	
end

function OMM_ActionBarsBufferHandler()
	
	if MicroMenu:IsShown() then
		MicroMenu:Hide()
		MicroMenuBuffer = 1
	elseif MicroMenuBuffer then
		MicroMenu:Show()
	else
		--print("ERROR in MicroMenuBuffer")
	end
	if BagsBar:IsShown() then
		BagsBar:Hide()
		BagsBarBuffer = 1
	elseif BagsBarBuffer then
		BagsBar:Show()
	else
		--print("ERROR in BagsBarBuffer")
	end
	if MainMenuBar:IsShown() then
		MainMenuBar:Hide()
		MainMenuBarBuffer = 1
	elseif MainMenuBarBuffer then
		MainMenuBar:Show()
	else
		--print("ERROR in MainMenuBarBuffer")
	end
	if StanceBar:IsShown() then
		StanceBar:Hide()
		StanceBarBuffer = 1
	elseif StanceBarBuffer then
		StanceBar:Show()
	else
		--print("ERROR in StanceBarBuffer")
	end
	if MultiBarLeft:IsShown() then
		MultiBarLeft:Hide()
		MultiBarLeftBuffer = 1
	elseif MultiBarLeftBuffer then
		MultiBarLeft:Show()
	else
		--print("ERROR in MultiBarLeftBuffer")
	end
	if MultiBarRight:IsShown() then
		MultiBarRight:Hide()
		MultiBarRightBuffer = 1
	elseif MultiBarRightBuffer then
		MultiBarRight:Show()
	else
		--print("ERROR in MultiBarRightBuffer")
	end
	if MultiBarBottomLeft:IsShown() then
		MultiBarBottomLeft:Hide()
		MultiBarBottomLeftBuffer = 1
	elseif MultiBarBottomLeftBuffer then
		MultiBarBottomLeft:Show()
	else
		--print("ERROR in MultiBarBottomLeftBuffer")
	end
	if MultiBarBottomRight:IsShown() then
		MultiBarBottomRight:Hide()
		MultiBarBottomRightBuffer = 1
	elseif MultiBarBottomRightBuffer then
		MultiBarBottomRight:Show()
	else
		--print("ERROR in MultiBarBottomRightBuffer")
	end
	if MultiBar5:IsShown() then
		MultiBar5:Hide()
		MultiBar5Buffer = 1
		--print("IsShown()")
	elseif MultiBar5Buffer then
		MultiBar5:Show()
		--print("MultiBar5Buffer")
	else
		--print("else")
	end
	if MultiBar6:IsShown() then
		MultiBar6:Hide()
		MultiBar6Buffer = 1
	elseif MultiBar6Buffer then
		MultiBar6:Show()
	else
		--print("ERROR in MultiBar6Buffer")
	end
	if MultiBar7:IsShown() then
		MultiBar7:Hide()
		MultiBar7Buffer = 1
	elseif MultiBar7Buffer then
		MultiBar7:Show()
	else
		--print("ERROR in MultiBar7Buffer")
	end
	if MainStatusTrackingBarContainer:IsShown() then
		MainStatusTrackingBarContainer:Hide()
		MainStatusTrackingBarContainerBuffer = 1
	elseif MainStatusTrackingBarContainerBuffer then
		MainStatusTrackingBarContainer:Show()
	else
		--print("ERROR in MainStatusTrackingBarContainerBuffer")
	end
	if SecondaryStatusTrackingBarContainer:IsShown() then
		SecondaryStatusTrackingBarContainer:Hide()
		SecondaryStatusTrackingBarContainerBuffer = 1
	elseif SecondaryStatusTrackingBarContainerBuffer then
		SecondaryStatusTrackingBarContainer:Show()
	else
		--print("ERROR in SecondaryStatusTrackingBarContainerBuffer")
	end
	
end

function OMM_PlayerFrameHandler()

	if DebuffFrame:IsShown() then
		DebuffFrame:Hide()
		DebuffFrameBuffer = 1
	elseif DebuffFrameBuffer then
		DebuffFrame:Show()
	else
		print("ERROR in DebuffFrameBuffer")
	end
	
	if BuffFrame:IsShown() then
		BuffFrame:Hide()
		BuffFrameBuffer = 1
	elseif BuffFrameBuffer then
		BuffFrame:Show()
	else
		print("ERROR in BuffFrameBuffer")
	end
	
	if PlayerFrame:IsShown() then
		PlayerFrame:Hide()
		PlayerFrameBuffer = 1
	elseif PlayerFrameBuffer then
		PlayerFrame:Show()
	else
		print("ERROR in PlayerFrameBuffer")
	end
	
	if TargetFrame:IsShown() then
		TargetFrame:Hide()
		TargetFrameBuffer = 1
	elseif TargetFrameBuffer then
		TargetFrame:Show()
	else
		-- This is actually fine.
	end
end