local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}


local QBCore = exports['qb-core']:GetCoreObject()
local Bezig = false


isLoggedIn = false
local PlayerJob = {}

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    QBCore.Functions.TriggerCallback('qb-mcds:server:GetConfig', function(config)
        Config = config
		isLoggedIn = true
    PlayerJob = QBCore.Functions.GetPlayerData().job
    end)
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)
-- Code

Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1)
		if isLoggedIn and QBCore ~= nil then
            local pos = GetEntityCoords(PlayerPedId())
            if PlayerJob.name == "mcd" then
		 for k,v in pairs(Config.JobData['locations']) do
		  local Positie = GetEntityCoords(GetPlayerPed(-1), false)
		  local Gebied = GetDistanceBetweenCoords(Positie.x, Positie.y, Positie.z, Config.JobData['locations'][k].x, Config.JobData['locations'][k].y, Config.JobData['locations'][k].z, true)
		   if Gebied <= 0.8 then
				if  Config.JobData['locations'][k]['name'] == 'Shell' then
					DrawText3D(Config.JobData['locations'][k].x, Config.JobData['locations'][k].y, Config.JobData['locations'][k].z + 0.2, '[G] - Prepare Fries')
					DrawMarker(2, Config.JobData['locations'][k].x, Config.JobData['locations'][k].y, Config.JobData['locations'][k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
elseif  Config.JobData['locations'][k]['name'] == 'Coke' then
					DrawText3D(Config.JobData['locations'][k].x, Config.JobData['locations'][k].y, Config.JobData['locations'][k].z + 0.2, '[E] - Prepare Coke')
					DrawMarker(2, Config.JobData['locations'][k].x, Config.JobData['locations'][k].y, Config.JobData['locations'][k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
		elseif  Config.JobData['locations'][k]['name'] == 'Patty' then
					DrawText3D(Config.JobData['locations'][k].x, Config.JobData['locations'][k].y, Config.JobData['locations'][k].z + 0.3, '[E] - Prepare Big Mac Patty')
					DrawMarker(2, Config.JobData['locations'][k].x, Config.JobData['locations'][k].y, Config.JobData['locations'][k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
		
			elseif  Config.JobData['locations'][k]['name'] == 'Wrap' then
					DrawText3D(Config.JobData['locations'][k].x, Config.JobData['locations'][k].y, Config.JobData['locations'][k].z + 0.2, '[E] - Prepare Chicken Wrap')
					DrawMarker(2, Config.JobData['locations'][k].x, Config.JobData['locations'][k].y, Config.JobData['locations'][k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
	elseif  Config.JobData['locations'][k]['name'] == 'Burger' then
					DrawText3D(Config.JobData['locations'][k].x, Config.JobData['locations'][k].y, Config.JobData['locations'][k].z + 0.2, '[E] - Prepare Big Mac')
					DrawMarker(2, Config.JobData['locations'][k].x, Config.JobData['locations'][k].y, Config.JobData['locations'][k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
	elseif  Config.JobData['locations'][k]['name'] == 'Ice' then
					DrawText3D(Config.JobData['locations'][k].x, Config.JobData['locations'][k].y, Config.JobData['locations'][k].z + 0.3, '[G] - Prepare IceCream')
					DrawMarker(2, Config.JobData['locations'][k].x, Config.JobData['locations'][k].y, Config.JobData['locations'][k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
		elseif  Config.JobData['locations'][k]['name'] == 'Mptato' then
					DrawText3D(Config.JobData['locations'][k].x, Config.JobData['locations'][k].y, Config.JobData['locations'][k].z + 0.3, '[G] - Mash Potatoes')
					DrawMarker(2, Config.JobData['locations'][k].x, Config.JobData['locations'][k].y, Config.JobData['locations'][k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
	elseif  Config.JobData['locations'][k]['name'] == 'Cptato' then
					DrawText3D(Config.JobData['locations'][k].x, Config.JobData['locations'][k].y, Config.JobData['locations'][k].z + 0.2, '[E] - Cut Potatoes')
					DrawMarker(2, Config.JobData['locations'][k].x, Config.JobData['locations'][k].y, Config.JobData['locations'][k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
		elseif  Config.JobData['locations'][k]['name'] == 'Meal' then
					DrawText3D(Config.JobData['locations'][k].x, Config.JobData['locations'][k].y, Config.JobData['locations'][k].z + 0.3, '[G] - Make Meal')
					DrawMarker(2, Config.JobData['locations'][k].x, Config.JobData['locations'][k].y, Config.JobData['locations'][k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 255, 255, 255, false, false, false, 1, false, false, false)
	
		elseif Config.JobData['locations'][k]['name'] == 'GiveTaco' then
					DrawText3D(Config.JobData['locations'][k].x, Config.JobData['locations'][k].y, Config.JobData['locations'][k].z + 0.15, '[E] - Deliver McDonalds Bag')
					DrawMarker(2, Config.JobData['locations'][k].x, Config.JobData['locations'][k].y, Config.JobData['locations'][k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 102, 0, 255, false, false, false, 1, false, false, false)
				elseif Config.JobData['locations'][k]['name'] == 'Register' then
					 if Config.JobData['register'] >= 10000 then
						DrawText3D(Config.JobData['locations'][k].x, Config.JobData['locations'][k].y, Config.JobData['locations'][k].z + 0.15, '[E] - Grab money \nRegister capacity: ~r~Enough money!')
					else
						DrawText3D(Config.JobData['locations'][k].x, Config.JobData['locations'][k].y, Config.JobData['locations'][k].z + 0.15, '[E] - Grab money \nRegister capacity: ~r~Not enough..')
					end
					    DrawMarker(2, Config.JobData['locations'][k].x, Config.JobData['locations'][k].y, Config.JobData['locations'][k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 46, 209, 206, 255, false, false, false, 1, false, false, false)
				end
				 if IsControlJustPressed(0, Keys['E']) then
				  if not Bezig then
					if Config.JobData['locations'][k]['name'] == 'Lettuce' then
						GetLettuce()
				
					elseif Config.JobData['locations'][k]['name'] == 'Coke' then
						QBCore.Functions.TriggerCallback('qb-mcd:server:get:ingredient1', function(HasItems)  
                        if HasItems then
							FinishCoke()
						else
							QBCore.Functions.Notify("You don\'t have all the Ingredients yet.", "error")
						end
					end)
					elseif Config.JobData['locations'][k]['name'] == 'Patty' then
						QBCore.Functions.TriggerCallback('qb-mcd:server:get:ingredient2', function(HasItems)  
                        if HasItems then
							FinishPatty()
						else
							QBCore.Functions.Notify("You don\'t have all the Ingredients yet.", "error")
						end
					end)
					elseif Config.JobData['locations'][k]['name'] == 'Burger' then
						QBCore.Functions.TriggerCallback('qb-mcd:server:get:ingredient4', function(HasItems)  
                        if HasItems then
							FinishBurger()
						else
							QBCore.Functions.Notify("You don\'t have all the Ingredients yet.", "error")
						end
					end)
						elseif Config.JobData['locations'][k]['name'] == 'Wrap' then
						QBCore.Functions.TriggerCallback('qb-mcd:server:get:ingredient3', function(HasItems)  
                        if HasItems then
							FinishWrap()
						else
							QBCore.Functions.Notify("You don\'t have all the Ingredients yet.", "error")
						end
					end)
					elseif Config.JobData['locations'][k]['name'] == 'Cptato' then
						QBCore.Functions.TriggerCallback('qb-mcd:server:get:ingredient7', function(HasItems)  
                        if HasItems then
							FinishCptato()
						else
							QBCore.Functions.Notify("You don\'t have all the Ingredients yet.", "error")
						end
					end)
					
					elseif Config.JobData['locations'][k]['name'] == 'Register' then
						TakeMoney()
					elseif Config.JobData['locations'][k]['name'] == 'Stock' then
						AddStuff()
					elseif Config.JobData['locations'][k]['name'] == 'GiveTaco' then
						GiveMcdMealToShop()
					 end
					 else
						QBCore.Functions.Notify("You're still doing something man bro.", "error")
					end
				end
				
				 if IsControlJustPressed(0, Keys['G']) then
				  if not Bezig then
					if Config.JobData['locations'][k]['name'] == 'Lettuce' then
						GetLettuce()
				elseif Config.JobData['locations'][k]['name'] == 'Ice' then
						QBCore.Functions.TriggerCallback('qb-mcd:server:get:ingredient5', function(HasItems)  
                        if HasItems then
							FinishIce()
						else
							QBCore.Functions.Notify("You don\'t have all the Ingredients yet.", "error")
						end
					end)
					elseif Config.JobData['locations'][k]['name'] == 'Mptato' then
						QBCore.Functions.TriggerCallback('qb-mcd:server:get:ingredient6', function(HasItems)  
                        if HasItems then
							FinishMptato()
						else
							QBCore.Functions.Notify("You don\'t have all the Ingredients yet.", "error")
						end
					end)
					elseif Config.JobData['locations'][k]['name'] == 'Meal' then
						QBCore.Functions.TriggerCallback('qb-mcd:server:get:ingredient8', function(HasItems)  
                        if HasItems then
							FinishMeal()
						else
							QBCore.Functions.Notify("You don\'t have all the Ingredients yet.", "error")
						end
					end)
					elseif Config.JobData['locations'][k]['name'] == 'Shell' then
						QBCore.Functions.TriggerCallback('qb-mcd:server:get:ingredient', function(HasItems)  
                        if HasItems then
							FinishFires()
						else
							QBCore.Functions.Notify("You don\'t have all the Ingredients yet.", "error")
						end
					end)
					 end
					 else
						QBCore.Functions.Notify("You're still doing something man bro.", "error")
					end
				end
				  
				  
				  end
			  end
				
				
			end
		end
	end
end)

-- functions


function FinishMeal()
	Bezig = true
	TriggerEvent('inventory:client:busy:status', true)
	TriggerServerEvent("InteractSound_SV:PlayOnSource", "wave", 3.2)
	QBCore.Functions.Progressbar("pickup_sla", "Making Meal", 10000, false, true, {
		disableMovement = true,
		disableCarMovement = false,
		disableMouse = false,
		disableCombat = false,
	}, {
		animDict = "mp_common",
		anim = "givetake1_a",
		flags = 8,
	}, {}, {}, function() -- Done
		Bezig = false
		TriggerEvent('inventory:client:busy:status', false)
		TriggerServerEvent('QBCore:Server:RemoveItem', "mcd-burger", 1)
		TriggerServerEvent('QBCore:Server:RemoveItem', "mcd-fries", 1)
		TriggerServerEvent('QBCore:Server:RemoveItem', "coke", 1)
		TriggerServerEvent('QBCore:Server:AddItem', "mcd-meal", 1)
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["mcd-burger"], "remove")
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["mcd-fries"], "remove")
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["coke"], "remove")
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["mcd-meal"], "add")
		-- QBCore.Functions.TriggerCallback('QBCore:AddItem', function()
		-- end, "mcd-meal", 1)
		TriggerServerEvent("InteractSound_SV:PlayOnSource", "micro", 0.2)
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		QBCore.Functions.Notify("Canceled..", "error")
		Bezig = false
	end)
end





function FinishCptato()
	Bezig = true
	TriggerEvent('inventory:client:busy:status', true)
	TriggerServerEvent("InteractSound_SV:PlayOnSource", "wave", 3.2)
	QBCore.Functions.Progressbar("pickup_sla", "Cuting Potatoes..", 5000, false, true, {
		disableMovement = true,
		disableCarMovement = false,
		disableMouse = false,
		disableCombat = false,
	}, {
		animDict = "mp_common",
		anim = "givetake1_a",
		flags = 8,
	}, {}, {}, function() -- Done
		Bezig = false
		TriggerEvent('inventory:client:busy:status', false)
		TriggerServerEvent('QBCore:Server:RemoveItem', "potato", 1)
		TriggerServerEvent('QBCore:Server:AddItem', "cutp", 2)
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["potato"], "remove")
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cutp"], "add")
		-- QBCore.Functions.TriggerCallback('QBCore:AddItem', function()                        
		-- end, "cutp", 2)
		TriggerServerEvent("InteractSound_SV:PlayOnSource", "micro", 0.2)
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		QBCore.Functions.Notify("Canceled..", "error")
		Bezig = false
	end)
end


function FinishMptato()
	Bezig = true
	TriggerEvent('inventory:client:busy:status', true)
	TriggerServerEvent("InteractSound_SV:PlayOnSource", "wave", 3.2)
	QBCore.Functions.Progressbar("pickup_sla", "Mashing Potatoes..", 5000, false, true, {
		disableMovement = true,
		disableCarMovement = false,
		disableMouse = false,
		disableCombat = false,
	}, {
		animDict = "mp_common",
		anim = "givetake1_a",
		flags = 8,
	}, {}, {}, function() -- Done
		Bezig = false
		TriggerEvent('inventory:client:busy:status', false)
		TriggerServerEvent('QBCore:Server:RemoveItem', "potato", 1)
		TriggerServerEvent('QBCore:Server:AddItem', "mashedp", 2)
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["potato"], "remove")
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["mashedp"], "add")
		-- QBCore.Functions.TriggerCallback('QBCore:AddItem', function()                        
		-- end, "mashedp", 2)
		TriggerServerEvent("InteractSound_SV:PlayOnSource", "micro", 0.2)
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		QBCore.Functions.Notify("Canceled..", "error")
		Bezig = false
	end)
end


function FinishIce()
	Bezig = true
	TriggerEvent('inventory:client:busy:status', true)
	TriggerServerEvent("InteractSound_SV:PlayOnSource", "wave", 3.2)
	QBCore.Functions.Progressbar("pickup_sla", "Making IceCream..", 5000, false, true, {
		disableMovement = true,
		disableCarMovement = false,
		disableMouse = false,
		disableCombat = false,
	}, {
		animDict = "mp_common",
		anim = "givetake1_a",
		flags = 8,
	}, {}, {}, function() -- Done
		Bezig = false
		TriggerEvent('inventory:client:busy:status', false)
		TriggerServerEvent('QBCore:Server:RemoveItem', "cone", 1)
		TriggerServerEvent('QBCore:Server:AddItem', "mcd-desert", 1)
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cone"], "remove")
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["mcd-desert"], "add")
		-- QBCore.Functions.TriggerCallback('QBCore:AddItem', function()                        
		-- end, "mcd-desert", 1)
		TriggerServerEvent("InteractSound_SV:PlayOnSource", "micro", 0.2)
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		QBCore.Functions.Notify("Canceled..", "error")
		Bezig = false
	end)
end


function FinishBurger()
	Bezig = true
	TriggerEvent('inventory:client:busy:status', true)
	TriggerServerEvent("InteractSound_SV:PlayOnSource", "wave", 3.2)
	QBCore.Functions.Progressbar("pickup_sla", "Making Big Mac Burger..", 8000, false, true, {
		disableMovement = true,
		disableCarMovement = false,
		disableMouse = false,
		disableCombat = false,
	}, {
		animDict = "mp_common",
		anim = "givetake1_a",
		flags = 8,
	}, {}, {}, function() -- Done
		Bezig = false
		TriggerEvent('inventory:client:busy:status', false)
		TriggerServerEvent('QBCore:Server:RemoveItem', "vegpatty", 1)
		TriggerServerEvent('QBCore:Server:RemoveItem', "sauce", 1)
		TriggerServerEvent('QBCore:Server:RemoveItem', "cheese", 1)
	    TriggerServerEvent('QBCore:Server:RemoveItem', "bun", 1)
		TriggerServerEvent('QBCore:Server:AddItem', "mcd-burger", 1)
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["vegpatty"], "remove")
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sauce"], "remove")
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cheese"], "remove")
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bun"], "remove")
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["mcd-burger"], "add")
		-- QBCore.Functions.TriggerCallback('QBCore:AddItem', function()                        
		-- end, "mcd-burger", 1)
		TriggerServerEvent("InteractSound_SV:PlayOnSource", "micro", 0.2)
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		QBCore.Functions.Notify("Canceled..", "error")
		Bezig = false
    end)
end


function FinishWrap()
	Bezig = true
	TriggerEvent('inventory:client:busy:status', true)
	TriggerServerEvent("InteractSound_SV:PlayOnSource", "wave", 3.2)
	QBCore.Functions.Progressbar("pickup_sla", "Baking Chicken Wrap..", 8000, false, true, {
		disableMovement = true,
		disableCarMovement = false,
		disableMouse = false,
		disableCombat = false,
	}, {
		animDict = "mp_common",
		anim = "givetake1_a",
		flags = 8,
	}, {}, {}, function() -- Done
		Bezig = false
		TriggerEvent('inventory:client:busy:status', false)
		TriggerServerEvent('QBCore:Server:RemoveItem', "flour", 1)
		TriggerServerEvent('QBCore:Server:RemoveItem', "sauce", 1)
		TriggerServerEvent('QBCore:Server:RemoveItem', "cheese", 1)
		TriggerServerEvent('QBCore:Server:AddItem', "mcd-wrap", 1)
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["flour"], "remove")
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["sauce"], "remove")
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cheese"], "remove")
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["mcd-wrap"], "add")
		-- QBCore.Functions.TriggerCallback('QBCore:AddItem', function()                        
		-- end, "mcd-wrap", 3)
		TriggerServerEvent("InteractSound_SV:PlayOnSource", "micro", 0.2)
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		QBCore.Functions.Notify("Canceled..", "error")
		Bezig = false
	end)
end

function FinishPatty()
	Bezig = true
	TriggerEvent('inventory:client:busy:status', true)
	TriggerServerEvent("InteractSound_SV:PlayOnSource", "wave", 3.2)
	QBCore.Functions.Progressbar("pickup_sla", "Baking Big Mac Patties..", 8000, false, true, {
		disableMovement = true,
		disableCarMovement = false,
		disableMouse = false,
		disableCombat = false,
	}, {
		animDict = "mp_common",
		anim = "givetake1_a",
		flags = 8,
	}, {}, {}, function() -- Done
		Bezig = false
		TriggerEvent('inventory:client:busy:status', false)
		TriggerServerEvent('QBCore:Server:RemoveItem', "mashedp", 1)
		TriggerServerEvent('QBCore:Server:AddItem', "vegpatty", 1)
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["mashedp"], "remove")
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["vegpatty"], "add")
		-- QBCore.Functions.TriggerCallback('QBCore:AddItem', function()                        
		-- end, "vegpatty", 2)
		TriggerServerEvent("InteractSound_SV:PlayOnSource", "micro", 0.2)
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		QBCore.Functions.Notify("Canceled..", "error")
		Bezig = false
	end)
end

function FinishFires()
	Bezig = true
	TriggerEvent('inventory:client:busy:status', true)
	TriggerServerEvent("InteractSound_SV:PlayOnSource", "wave", 3.2)
	QBCore.Functions.Progressbar("pickup_sla", "Making fries", 4000, false, true, {
		disableMovement = true,
		disableCarMovement = false,
		disableMouse = false,
		disableCombat = false,
	}, {
		animDict = "mp_common",
		anim = "givetake1_a",
		flags = 8,
	}, {}, {}, function() -- Done
		Bezig = false
		TriggerEvent('inventory:client:busy:status', false)
		TriggerServerEvent('QBCore:Server:RemoveItem', "oil", 1)
		TriggerServerEvent('QBCore:Server:RemoveItem', "cutp", 1)
		TriggerServerEvent('QBCore:Server:AddItem', "mcd-fries", 1)
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["oil"], "remove")
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cutp"], "remove")
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["mcd-fries"], "add")
		-- QBCore.Functions.TriggerCallback('QBCore:AddItem', function()                        
		-- end, "mcd-fries", 3)
		TriggerServerEvent("InteractSound_SV:PlayOnSource", "micro", 0.2)
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		QBCore.Functions.Notify("Canceled..", "error")
		Bezig = false
	end)
end

function FinishCoke()
	Bezig = true
	TriggerEvent('inventory:client:busy:status', true)
	TriggerServerEvent("InteractSound_SV:PlayOnSource", "wave", 3.2)
	QBCore.Functions.Progressbar("pickup_sla", "Making Coke", 4000, false, true, {
		disableMovement = true,
		disableCarMovement = false,
		disableMouse = false,
		disableCombat = false,
	}, {
		animDict = "mp_common",
		anim = "givetake1_a",
		flags = 8,
	}, {}, {}, function() -- Done
		Bezig = false
		TriggerEvent('inventory:client:busy:status', false)
		TriggerServerEvent('QBCore:Server:RemoveItem', "emptyglass", 1)
		TriggerServerEvent('QBCore:Server:AddItem', "coke", 1)
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["emptyglass"], "remove")
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["coke"], "add")
		-- QBCore.Functions.TriggerCallback('QBCore:AddItem', function()                        
		-- end, "coke", 1)
		TriggerServerEvent("InteractSound_SV:PlayOnSource", "micro", 0.2)
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		QBCore.Functions.Notify("Canceled..", "error")
		Bezig = false
	end)
end

--[[function BakeMeat()
	if Config.JobData['stock-meat'] >= 1 then
	Bezig = true
	TriggerServerEvent("InteractSound_SV:PlayOnSource", "Meat", 0.7)
	QBCore.Functions.Progressbar("pickup_sla", "Baking meat..", 5000, false, true, {
		disableMovement = true,
		disableCarMovement = false,
		disableMouse = false,
		disableCombat = false,
	}, {
		animDict = "amb@prop_human_bbq@male@base",
		anim = "base",
		flags = 8,
	}, {
		model = "prop_cs_fork",
        bone = 28422,
        coords = { x = -0.005, y = 0.00, z = 0.00 },
        rotation = { x = 175.0, y = 160.0, z = 0.0 },
	}, {}, function() -- Done
		TriggerServerEvent('QBCore:Server:AddItem', "meat", 1)
		Config.JobData['stock-meat']= Config.JobData['stock-meat'] - 1
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["meat"], "add")
		Bezig = false
	end, function()
		QBCore.Functions.Notify("Canceled..", "error")
		Bezig = false
	end)
else
	QBCore.Functions.Notify("There is not enough meat in stock.", "error")
 end  
end

function GetLettuce()
	if Config.JobData['stock-lettuce'] >= 1 then
	Bezig = true
	TriggerServerEvent("InteractSound_SV:PlayOnSource", "fridge", 0.5)
	QBCore.Functions.Progressbar("pickup_sla", "Grabbing lettuce..", 4100, false, true, {
		disableMovement = true,
		disableCarMovement = false,
		disableMouse = false,
		disableCombat = false,
	}, {
		animDict = "amb@prop_human_bum_bin@idle_b",
		anim = "idle_d",
		flags = 8,
	}, {}, {}, function() -- Done
		StopAnimTask(GetPlayerPed(-1), "amb@prop_human_bum_bin@idle_b", "idle_d", 1.0)
		TriggerServerEvent('QBCore:Server:AddItem', "lettuce", 1)
		Config.JobData['stock-lettuce']= Config.JobData['stock-lettuce'] - 1
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lettuce"], "add")
		Bezig = false
	end, function()
		StopAnimTask(GetPlayerPed(-1), "amb@prop_human_bum_bin@idle_b", "idle_d", 1.0)
		QBCore.Functions.Notify("Canceled..", "error")
		Bezig = false
	end)
else
	QBCore.Functions.Notify("There is not enough lettuce in stock.", "error")
 end 
end]]

function GiveMcdMealToShop()
	QBCore.Functions.TriggerCallback('qb-mcd:server:get:mcdmeal', function(HasItem, type)
		if HasItem then
		  if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
			if Config.JobData['mcd-meal'] <= 9 then	
				QBCore.Functions.Notify("mcd-meal delivered!", "success")
				Config.JobData['mcd-meal'] = Config.JobData['mcd-meal'] + 1
				TriggerServerEvent('QBCore:Server:RemoveItem', "mcd-meal", 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["mcd-meal"], "remove")
				else
					QBCore.Functions.Notify("There are still 10 mcd-meal\'s that have to be sold. We dont waste food here..", "error")
				end
		  elseif type == 'green' then
			if Config.JobData['mcd-meal'] <= 9 then	
				TriggerServerEvent('QBCore:Server:RemoveItem', "mcd-meal", 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["mcd-meal"], "remove")
				else
					QBCore.Functions.Notify("There are still 10 mcd-meal\'s that have to be sold. We dont waste food here..", "error")
				end
		end
	    else
		QBCore.Functions.Notify("You dont even have a meal.", "error")
	 end
	end)
end

function AddStuff()
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if HasItem then
			if Config.JobBusy == true then
				TriggerServerEvent('QBCore:Server:RemoveItem', "taco-box", 5)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["taco-box"], "remove")
				Config.JobData['stock-lettuce']= Config.JobData['stock-lettuce'] + math.random(16,24)
				Config.JobData['stock-meat']= Config.JobData['stock-meat'] + math.random(16,24)
				QBCore.Functions.Notify("Taco Shop has been restocked!", "success")
				Config.JobBusy = false
			else
				QBCore.Functions.Notify("You\'re coming straight from the taco store.", "error")
			end
		else
			QBCore.Functions.Notify("You don\'t even have a box of ingredients.", "error")
		end
	end, 'taco-box')
end

function TakeMoney()
	if Config.JobData['register'] >= 10000 then
		local lockpickTime = math.random(10000,35000)
		RegisterAnim(lockpickTime)
		QBCore.Functions.Progressbar("search_register", "Empty cash register..", lockpickTime, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "veh@break_in@0h@p_m_one@",
            anim = "low_force_entry_ds",
            flags = 16,
        }, {}, {}, function() -- Done
            GetMoney = false
			Config.JobData['register']= Config.JobData['register'] - 10000        
        end, function() -- Cancel
            GetMoney = false
            ClearPedTasks(GetPlayerPed(-1))
            QBCore.Functions.Notify("Process Canceled..", "error")
        end)
	else
		QBCore.Functions.Notify("There is not enough money in the register yet.", "error")
	end
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end


function RegisterAnim(time)
	time = time / 1000
	loadAnimDict("veh@break_in@0h@p_m_one@")
	TaskPlayAnim(GetPlayerPed(-1), "veh@break_in@0h@p_m_one@", "low_force_entry_ds" ,3.0, 3.0, -1, 16, 0, false, false, false)
	GetMoney = true
	Citizen.CreateThread(function()
	while GetMoney do
		TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
		Citizen.Wait(2000)
		time = time - 2
		TriggerServerEvent('qb-storerobbery:server:takeMoney', currentRegister, false)
		if time <= 0 then
			GetMoney = false
			StopAnimTask(GetPlayerPed(-1), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
		end
	end
	end)
	end

Citizen.CreateThread(function()
	local blip = AddBlipForCoord(81.6, 275.68, 110.21)
	SetBlipSprite(blip, 78)
	SetBlipScale(blip, 0.6)
	SetBlipColour(blip, 73)  
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("McDonalds")
    EndTextCommandSetBlipName(blip)
end)

--[[Citizen.CreateThread(function()
	TacoVoor = AddBlipForCoord(650.68, 2727.25, 41.99)
    SetBlipSprite (TacoVoor, 569)
    SetBlipDisplay(TacoVoor, 4)
    SetBlipScale  (TacoVoor, 0.6)
    SetBlipAsShortRange(TacoVoor, true)
    SetBlipColour(TacoVoor, 39)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Taco Farmer Storage")
    EndTextCommandSetBlipName(TacoVoor)
end)]]