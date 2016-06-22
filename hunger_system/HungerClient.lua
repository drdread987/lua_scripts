
local AIO = AIO or require("AIO")


if AIO.AddAddon() then
    return
end


local MyHandlers = AIO.AddHandlers("HungerBar", {})


Framework = CreateFrame("Frame", "first_frame", UIParent, nil)
local frame = Framework


frame:SetSize(100, 20)
frame:RegisterForDrag("LeftButton")
frame:SetPoint("TOPLEFT", 100, -100)
frame:SetToplevel(false)
frame:SetClampedToScreen(true)
frame:SetMovable(true)
frame:EnableMouse(true)
frame:SetBackdrop({
            bgFile = "Interface/DialogFrame/UI-DialogBox-Background-Dark",
            tile = true,
			})  
frame:SetScript("OnDragStart", frame.StartMoving)	
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)


AIO.SavePosition(frame)


local second_frame = CreateFrame("Frame", "Second_Frame", frame)
second_frame:SetSize(100,19)
second_frame:RegisterForDrag("LeftButton")
second_frame:SetPoint("LEFT")
second_frame:SetToplevel(true)
second_frame:SetClampedToScreen(true)
second_frame:SetMovable(false)
second_frame:EnableMouse(false)
second_frame:SetBackdrop({
            bgFile = "Interface/Tooltips/UI-Tooltip-Background",
            tile = true,
            insets = { left = 1, right = 1, top = 1, bottom = 1 }
			})  
second_frame:SetBackdropColor(1,.3,.1,1)



function GetHungerPct()

	

end


function MyHandlers.OnLogin(player, hunger_list)

	

end



function MyHandlers.ShowFrame(player)
    frame:Show()
	second_frame:Show()
end


