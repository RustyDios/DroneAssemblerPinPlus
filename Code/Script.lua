--[[ =========== Start:: Drone Assembler Pin Plus:: Main Script ========== --]]

local mod_name = "DroneAssemblerPinPlus"
local steamID = "1831818525"
-- local author = "RustyDios"
-- local version ="1"

local RustyPrint = false

local ModDir = CurrentModPath

local Factory = BuildingTemplates.DroneFactory

--[[ =========== Start:: Drone Assembler Pin Plus:: Prefab Pin Text Additions ========== --]]

function OnMsg.ClassesPostprocess()
	
	Factory.pin_rollover = T("<description><newline><newline>Available Drone Prefabs<right><drone(available_drone_prefabs)><newline><left>Scheduled Drone Prefabs<right><drone(drones_in_construction)><newline><left>Required <resource(ConstructResource)><right><resource(ConstructResourceAmount, ConstructResourceTotal, ConstructResource)>")
	Factory.pin_rollover_hint = T("<left_click> Select")
	Factory.pin_rollover_hint_xbox = T("<image UI/PS4/Cross.tga> View")
	Factory.pin_summary1 = T("")
	Factory.pin_summary2 = T("<drones_in_construction>/<drone(available_drone_prefabs)>")

end
--[[ =========== Finish:: Drone Assembler Pin Plus:: Prefab Pin Text Additions ========== --]]

--[[ =========== Start:: Drone Assembler Pin Plus:: OnTech Researched ========== --]]

function OnMsg.TechResearched(tech_id, city)
	if RustyPrint then print ("Tech Researched;",tech_id) end

	if tech_id == "ThePositronicBrain" then
		
		-- update any previously placed factories
		city:ForEachLabelObject("DroneFactory", function (a)
			a.pin_rollover = T("<description><newline><newline>Available Drone Prefabs<right><drone(available_drone_prefabs)><newline><left>Scheduled Drone Prefabs<right><drone(drones_in_construction)><newline><left>Scheduled Biorobots<right><colonist(androids_in_construction)><newline><left>Required <resource(ConstructResource)><right><resource(ConstructResourceAmount, ConstructResourceTotal, ConstructResource)>")
			a.pin_summary1 = T("<colonist(androids_in_construction)>")
		end)
	end

end
--[[ =========== Finish:: Drone Assembler Pin Plus:: OnTech Researched ========== --]]

--[[ =========== Start:: Drone Assembler Pin Plus:: OnConstruction ========== --]]

function OnMsg.ConstructionComplete(bld)
	local obj = bld 

	-- update texts post build of a new factory
	if obj:IsKindOf("DroneFactory") and UICity:IsTechResearched("ThePositronicBrain") then

		if RustyPrint then print ("A Drone Factory was built with The Positronic Brain researched: Updated Pin Details") end

		obj.pin_rollover = T("<description><newline><newline>Available Drone Prefabs<right><drone(available_drone_prefabs)><newline><left>Scheduled Drone Prefabs<right><drone(drones_in_construction)><newline><left>Scheduled Biorobots<right><colonist(androids_in_construction)><newline><left>Required <resource(ConstructResource)><right><resource(ConstructResourceAmount, ConstructResourceTotal, ConstructResource)>")
		obj.pin_summary1 = T("<colonist(androids_in_construction)>")
	end
end
--[[ =========== Finish:: Drone Assembler Pin Plus:: OnConstruction ========== --]]

--[[ =========== Finish:: Drone Assembler Pin Plus:: Main Script ========== --]]
