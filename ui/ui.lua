-----------------------------------
-- TODO:
--	Make a editable list
-- 	Everything else
-- Authors: Spongebob & Patrick & Kent & Aaron
-----------------------------------

UI = {}
UI.__index = UI

function UI:init()

	local temp = false
	UIinterface = LibStub("AceGUI-3.0")
	local icon = LibStub("LibDBIcon-1.0")
	local ldbObject = LibStub("LibDataBroker-1.1"):NewDataObject("hitList", {
	type = "launcher",
	text = "hitList",
	icon = "Interface\\Icons\\spell_nature_bloodlust",
	OnClick = function()
		if (temp == false) then
			UI.createUI()
		end
	end,
    OnTooltipShow = function(tooltip)
		 tooltip:AddLine("HitList")
	end,
	})

		--- MiniMap init
	local db = LibStub("AceDB-3.0"):New("hitListDB", {
		profile = {
			minimap = {
				hide = false,
			},
		},
	})
	icon:Register("hitList", ldbObject, db.profile.minimap)

end


function UI:createUI()
	temp = true

	frame = UIinterface:Create("Frame")
	frame:SetTitle("HitList")
	frame:SetStatusText("HitList 1.0")
	frame:SetWidth(300)
	frame:SetHeight(425)
	frame:SetCallback("OnClose", function(widget)
		UIinterface:Release(widget)
		temp = false
	end)
	frame:SetLayout("List")

	editboxadd = UIinterface:Create("EditBox")
	editboxadd:SetLabel("Add name to HitList:")
	editboxadd:SetWidth(200)
	editboxadd:SetCallback("OnEnterPressed", function(widget, event, text)
		addName(text)
		UI:createName(text)
	end)
	frame:AddChild(editboxadd)

	editboxdelete = UIinterface:Create("EditBox")
	editboxdelete:SetLabel("Delete name from HitList:")
	editboxdelete:SetWidth(200)
	editboxdelete:SetCallback("OnEnterPressed", function(widget, event, text)
		deleteName(text)
		scroll:ReleaseChildren()
		UI:Repopulate()
	end)
	frame:AddChild(editboxdelete)

	scrollcontainer = UIinterface:Create("InlineGroup") -- "InlineGroup" is also good
	scrollcontainer:SetFullWidth(true)
	scrollcontainer:SetHeight(250) -- probably?
	scrollcontainer:SetLayout("Fill") -- important!
	frame:AddChild(scrollcontainer)

	scroll = UIinterface:Create("ScrollFrame")
	scroll:SetLayout("List") -- probably?
	scrollcontainer:AddChild(scroll)

	UI:Repopulate()

end

function UI:Repopulate()
	if #(nameList) ~= 0 or nameList ~= nil then
		for i = 1, #(nameList) do
			UI:createName(nameList[i])
		end
	end
end

function UI:createName(name)
	nameLabel = UIinterface:Create("InteractiveLabel")
	nameLabel:SetText(name)
	nameLabel:SetCallback("OnClick", function(widget, event, text)
		deleteName(name)
		scroll:ReleaseChildren()
		UI:Repopulate()
	end)
	scroll:AddChild(nameLabel)
end
