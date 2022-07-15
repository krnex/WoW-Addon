-----------------------------------
-- TODO:
--	Make a editable list
-- 	Everything else
-- Authors: Spongebob & Patrick & Kent & Aaron
-----------------------------------

local recoverHitList = {}

addon:RegisterChatCommand("addname", "AddNameProcesssorFunction")
addon:RegisterChatCommand("rmname", "DeleteNameProcesssorFunction")
addon:RegisterChatCommand("shownames", "ShowNameProcesssorFunction")
addon:RegisterChatCommand("clearnames", "ClearNamesProcessorFunction")
addon:RegisterChatCommand("recovernames", "RecoverNamesProcessorFunction")
addon:RegisterChatCommand("hlHelp", "HelpProcessorFunction")
addon:RegisterChatCommand("HitList", "ToggleIconProcessorFunction")


function addon:AddNameProcesssorFunction(input)
	addName(input)
end

function addon:DeleteNameProcesssorFunction(input)
	deleteName(input)
end

function addon:ShowNameProcesssorFunction(input)
	for i = 1, #nameList do
		print(nameList[i])
	end
	if(#nameList == 0) then
		print("You have nothing on your list")
	end
end

function addon:ClearNamesProcessorFunction(input)
	recoverHitList = nameList
	nameList = {"Cyxus"}
	print("HitList has been cleared.")
end

function addon:RecoverNamesProcessorFunction(input)
	if (recoverHitList ~= {}) then
		nameList = recoverHitList
		print("HitList succesfully reinstated.")
	else
		print("HitList has been lost.")
	end
end

function addon:HelpProcessorFunction(input)
	print("addname 'name'")
	print("rmname 'name'")
	print("shownames")
	print("clearnames")
	print("recovernames")
end

function addon:ToggleIconProcessorFunction(input) 
	UI.db.profile.minimap.hide = not UI.db.profile.minimap.hide 
	if UI.db.profile.minimap.hide then 
		UI.icon:Hide("hitList") else UI.icon:Show("hitList")
	end 

end