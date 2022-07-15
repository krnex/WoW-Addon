-----------------------------------
-- TODO: 
--	Make a editable list
-- 	Everything else
-- Authors: Spongebob & Patrick & Kent & Aaron
-----------------------------------

--- NEW MINIMAP ---

addon = LibStub("AceAddon-3.0"):NewAddon("hitList", "AceConsole-3.0")

addonUI = UI:init()

function addon:OnInitialize()


	print('onInit works')
	--UI:init()

	if nameList == nil then
		nameList = {"Cyxus"}
	end


end

--- FUNCTIONS ----

function addName(name)
	trimmedName = string.gsub(name, "%s", "")
	if trimmedName ~= "" then
		table.insert(nameList, trimmedName)
		print(trimmedName .. " has been succesfully added to your HitList.")
	end
end

function deleteName(name)
	for i = #(nameList), 0, -1 do
		if nameList[i] == name and nameList[i] ~= "Cyxus" then
			table.remove(nameList, i)
		end
	end
	print(name .. " has been succesfully removed from your HitList.")
end