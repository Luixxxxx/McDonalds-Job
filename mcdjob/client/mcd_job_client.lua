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

QBCore = nil

local DropOffs = {
	[1] =  { ['x'] = -145.58,['y'] = -1430.18,['z'] = 30.92,['h'] = 0.0, ['info'] = 'Innocence Boulevard 1'},
	[2] =  { ['x'] = -258.61,['y'] = -841.55,['z'] = 31.42,['h'] = 0.0, ['info'] = 'Carson Avenue 1'},
	[3] =  { ['x'] = 307.95,['y'] = -1286.47,['z'] = 30.52,['h'] = 0.0, ['info'] = 'Crusade Road 1'},
	[4] =  { ['x'] = 236.70,['y'] = -1869.21,['z'] = 26.90,['h'] = 0.0, ['info'] = 'Roy Lowenstein Boulevard 1'},
	[5] =  { ['x'] = 403.63,['y'] = -1929.85,['z'] = 24.74,['h'] = 0.0, ['info'] = 'Jamestown Street 1'},
	[6] =  { ['x'] = 485.74,['y'] = -943.33,['z'] = 27.13,['h'] = 0.0, ['info'] = 'Atlee Street 1'},
	[7] =  { ['x'] = 281.72,['y'] = -800.77,['z'] = 29.31,['h'] = 0.0, ['info'] = 'Strawberry Avenue 1'},
	[8] =  { ['x'] = -657.77,['y'] = -679.26,['z'] = 31.47,['h'] = 0.0, ['info'] = 'Palomino Avenue 1'},
	[9] =  { ['x'] = -814.18,['y'] = -1114.65,['z'] = 11.18,['h'] = 0.0, ['info'] = 'South Rockford Drive 1'},
	[10] =  { ['x'] = -697.63,['y'] = -1182.29,['z'] = 10.71,['h'] = 0.0, ['info'] = 'South Rockford Drive 2'},
	[11] =  { ['x'] = -1268.93,['y'] = -877.842,['z'] = 11.93,['h'] = 0.0, ['info'] = 'San Andreas 1'},
	[12] =  { ['x'] = -601.30,['y'] = 279.34,['z'] = 82.03,['h'] = 0.0, ['info'] = 'West Boulevard 1'},
	[13] =  { ['x'] = -257.57,['y'] = 245.03,['z'] = 91.87,['h'] = 0.0, ['info'] = 'West Boulevard 2'},
	[14] =  { ['x'] = -1469.06,['y'] = -197.62,['z'] = 48.83,['h'] = 0.0, ['info'] = 'Cougar Avenue 1'},
	[15] =  { ['x'] = -1580.60,['y'] = -34.07,['z'] = 57.56,['h'] = 0.0, ['info'] = 'Sam Austin Dr 1'},
	[16] =  { ['x'] = -458.23,['y'] = 264.30,['z'] = 83.14,['h'] = 0.0, ['info'] = 'Boulevard 1'},
	[17] =  { ['x'] = 751.50,['y'] = 223.92,['z'] = 87.42,['h'] = 0.0, ['info'] = 'Clinton Avenue 1'},
	[18] =  { ['x'] = 1199.87,['y'] = -501.53,['z'] = 65.17,['h'] = 0.0, ['info'] = 'Mirror Park Boulevard 1'},
}

--[[local TacoShop = {
	[1] =  { ['x'] = 8.00,['y'] = -1604.92,['z'] = 29.37,['h'] = 0.0, ['info'] = 'Taco Farmer'},
}]]
-- Code


local QBCore = exports['qb-core']:GetCoreObject()
local JobBusy = false
local Tasks = false
local rnd = 0


isLoggedIn = false
local PlayerJob = {}


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)



Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isLoggedIn and QBCore ~= nil then
            local pos = GetEntityCoords(PlayerPedId())
            if PlayerJob.name == "mcd" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["ogcarspawn"].coords.x, Config.Locations["ogcarspawn"].coords.y, Config.Locations["ogcarspawn"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["ogcarspawn"].coords.x, Config.Locations["ogcarspawn"].coords.y, Config.Locations["ogcarspawn"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["ogcarspawn"].coords.x, Config.Locations["ogcarspawn"].coords.y, Config.Locations["ogcarspawn"].coords.z, true) < 1.5) then
                        if IsPedInAnyVehicle(PlayerPedId(), false) then
                            DrawText3D(Config.Locations["ogcarspawn"].coords.x, Config.Locations["ogcarspawn"].coords.y, Config.Locations["ogcarspawn"].coords.z, "~r~E~w~ - Store The Vehicle")
                        else
                            DrawText3D(Config.Locations["ogcarspawn"].coords.x, Config.Locations["ogcarspawn"].coords.y, Config.Locations["ogcarspawn"].coords.z, "~r~E~w~ - Take Out Vehicle")
                        end
                        if IsControlJustReleased(0, Keys["E"]) then
                            if IsPedInAnyVehicle(PlayerPedId(), false) then
                                DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                            else
                                ogVehicleSpawn()
                                Menu.hidden = not Menu.hidden
                            end
                        end
                        Menu.renderGUI()
                    end 
                end
            else
                Citizen.Wait(2500)
            end
        else
            Citizen.Wait(2500)
        end
    end
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isLoggedIn and QBCore ~= nil then
            local pos = GetEntityCoords(PlayerPedId())
            if PlayerJob.name == "mcd" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stash"].coords.x, Config.Locations["stash"].coords.y, Config.Locations["stash"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["stash"].coords.x, Config.Locations["stash"].coords.y, Config.Locations["stash"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["stash"].coords.x, Config.Locations["stash"].coords.y, Config.Locations["stash"].coords.z, true) < 1.5) then
                            DrawText3D(Config.Locations["stash"].coords.x, Config.Locations["stash"].coords.y, Config.Locations["stash"].coords.z, "~r~E~w~ - Use The Stash ")
                        if IsControlJustReleased(0, Keys["E"]) then
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", "mcdstash", {
                                maxweight = 4000000,
                                slots = 500,
                            })
                            TriggerEvent("inventory:client:SetCurrentStash", "mcdstash")
                            end
                        end
                end
            else
                Citizen.Wait(2500)
            end
        else
            Citizen.Wait(2500)
        end
    end
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if isLoggedIn and QBCore ~= nil then
            local pos = GetEntityCoords(GetPlayerPed(-1))
            if PlayerJob.name == "mcd" then
                if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["storage"].coords.x, Config.Locations["storage"].coords.y, Config.Locations["storage"].coords.z, true) < 10.0) then
                    DrawMarker(2, Config.Locations["storage"].coords.x, Config.Locations["storage"].coords.y, Config.Locations["storage"].coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 200, 200, 222, false, false, false, true, false, false, false)
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config.Locations["storage"].coords.x, Config.Locations["storage"].coords.y, Config.Locations["storage"].coords.z, true) < 1.5) then
                            DrawText3D(Config.Locations["storage"].coords.x, Config.Locations["storage"].coords.y, Config.Locations["storage"].coords.z, "~g~E~w~ - Storage ")
                            if IsControlJustReleased(0, 38) then
                                TriggerServerEvent("inventory:server:OpenInventory", "shop", "mcd", Config.Storage)
                            end
                        end
                end
            else
                Citizen.Wait(2500)
            end
        else
            Citizen.Wait(2500)
        end
    end
end)

Citizen.CreateThread(function()
while true do
	Citizen.Wait(0)
		for k,v in pairs(Config.JobStart) do
			local pos = GetEntityCoords(GetPlayerPed(-1), false)
            local Gebied = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.x, v.y, v.z, false)
				if Gebied <= 1.5  and JobBusy == false and not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
					if Config.JobData['mcd-meal'] >= 1 then
					DrawText3D(v.x, v.y, v.z + 0.15, '~r~E~s~ - Work\n McDonalds Bag\'s Available: ~r~' ..Config.JobData['mcd-meal']..'x')
					DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 0, 255, 0, 155, false, false, false, true, false, false, false)
					if IsControlJustPressed(0, Keys['E']) then
                        
						JobBusy = true
						Config.JobData['mcd-meal'] = Config.JobData['mcd-meal'] - 1
						TriggerServerEvent('qb-mcd:server:start:black')
					end
					else
					DrawText3D(v.x, v.y, v.z + 0.15, '~r~There are no McDonalds Bag\'s In stock')
					DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 0, 0, 155, false, false, false, true, false, false, false)
					end
				elseif Gebied <= 3.0 and JobBusy == true then
				 DrawText3D(v.x, v.y, v.z + 0.15, 'You\'re already working\n ~s~McDonalds Bag\'s Available: ~r~' ..Config.JobData['mcd-meal']..'x')
				 DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 0, 0, 155, false, false, false, true, false, false, false)
				elseif Gebied <= 3.0 and IsPedInAnyVehicle(GetPlayerPed(-1), false) then
					DrawText3D(v.x, v.y, v.z + 0.15, 'Get out of vehicle\n ~s~McDonalds Bag\'s Available: ~r~' ..Config.JobData['mcd-meal']..'x')
					DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 230, 166, 78, 155, false, false, false, true, false, false, false)
				else
					Citizen.Wait(2000)
			end
		end
	end
end)

--[[Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(1)
		for k,v in pairs(Config.PickUpStuff) do
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
		local Gebied = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.x, v.y, v.z, false)
		if Gebied <= 1.5  and Config.JobBusy == false and not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
			DrawText3D(v.x, v.y, v.z + 0.15, '~r~E~s~ - Grab a box')
			DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 0, 255, 0, 155, false, false, false, true, false, false, false)  
			if IsControlJustPressed(0, Keys['E']) then
				SetNewWaypoint(TacoShop[1]["x"], TacoShop[1]["y"])
				TriggerServerEvent('qb-mcds:server:get:stuff')
				QBCore.Functions.Notify("Deliver the box to the "..TacoShop[1]["info"], "success", 10000)
				Config.JobBusy = true
			end
		elseif Gebied <= 3.0 and Config.JobBusy == true then
			DrawText3D(v.x, v.y, v.z + 0.15, '~r~You\'re still busy.')
			DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 0, 0, 155, false, false, false, true, false, false, false)
	 	end
     end
	end
end)]]

RegisterNetEvent('qb-mcd:start:black:job')
AddEventHandler('qb-mcd:start:black:job', function()
	rnd = math.random(1,#DropOffs)
	CreateBlip()
	QBCore.Functions.Notify("Deliver this bag to "..DropOffs[rnd]["info"], "success", 10000)
	TriggerServerEvent('QBCore:Server:AddItem', "mcd-bag", 1)
	TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["mcd-bag"], "add")
	if Tasks then
		return
	end
	Tasks = true
	while Tasks do
		Citizen.Wait(1)
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
		local Gebied = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, DropOffs[rnd]["x"], DropOffs[rnd]["y"], DropOffs[rnd]["z"], false)
		if Gebied <= 5.0 then
			DrawText3D(DropOffs[rnd]["x"], DropOffs[rnd]["y"], DropOffs[rnd]["z"]+0.1, '~r~E~s~ - Deliver') 
			DrawMarker(2, DropOffs[rnd]["x"], DropOffs[rnd]["y"], DropOffs[rnd]["z"], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 102, 0, 155, false, false, false, true, false, false, false)
				if IsControlJustReleased(0,38) then
					if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
						EndJob()
					else
			        	QBCore.Functions.Notify("You can\'t deliver in your vehicle.", "error")
				end
			end
		else
			Citizen.Wait(2000)
		end
	end
end)

RegisterNetEvent('qb-mcd:client:set:taco:count')
AddEventHandler('qb-mcd:client:set:taco:count', function(what, bool)
	Config.JobData[what] = bool
end)

RegisterNetEvent('qb-mcd:client:set:register:count')
AddEventHandler('qb-mcd:client:set:register:count', function(bool)
	Config.JobData['register'] = bool
end)

function Animatie()
	loadAnimDict( "mp_safehouselost@" )
    TaskPlayAnim( PlayerPedId(), "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end 

function DeleteBlip()
	if DoesBlipExist(blip) then
		RemoveBlip(blip)
	end
end

function CreateBlip()
	if JobBusy then
	blip = AddBlipForCoord(DropOffs[rnd]["x"],DropOffs[rnd]["y"],DropOffs[rnd]["z"])
	end
	SetNewWaypoint(DropOffs[rnd]["x"], DropOffs[rnd]["y"])
	SetBlipSprite(blip, 78)
	SetBlipScale(blip, 0.6)
	SetBlipColour(blip, 46) 
    SetBlipAsShortRange(blip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Delivery Address")
    EndTextCommandSetBlipName(blip)
end

function EndJob()
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if JobBusy == true and HasItem then
			Tasks = false
			JobBusy = false
			TriggerServerEvent("InteractSound_SV:PlayOnSource", "doorbell", 0.15)
			Citizen.Wait(1000)
			Animatie()
			Citizen.Wait(800)
			DeleteBlip()
			TriggerServerEvent('qb-mcd:server:reward:money', true)
			Config.JobData['register'] = Config.JobData['register'] + math.random(100,200)
			TriggerServerEvent('QBCore:Server:RemoveItem', "mcd-bag", 1)
			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["mcd-bag"], "remove")
		else
			QBCore.Functions.Notify("You didnt even took the order with you.", "error")
		end 
 	end, 'mcd-bag')
end

function ogVehicleSpawn()
    ped = PlayerPedId();
    MenuTitle = "Garage"
    ClearMenu()
    Menu.addButton("Vehicle", "VehicleList", nil)
    Menu.addButton("Close menu", "closeMenuFull", nil) 
end

function VehicleList(isDown)
    ped = PlayerPedId();
    MenuTitle = "Vehicle:"
    ClearMenu()
    for k, v in pairs(Config.Vehicles) do
        Menu.addButton(Config.Vehicles[k], "TakeOutVehicle", k, "Garage", " Engine: 100%", " Body: 100%", " Fuel: 100%")
    end
        
    Menu.addButton("Return", "MachineMenu",nil)
end

function TakeOutVehicle(vehicleInfo)
    local coords = Config.Locations["ogcarspawn"].coords
    QBCore.Functions.SpawnVehicle(vehicleInfo, function(veh)
        SetVehicleNumberPlateText(veh, "MCDONALD")
        SetEntityHeading(veh, coords.h)
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        closeMenuFull()
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
        CurrentPlate = GetVehicleNumberPlateText(veh)
    end, coords, true)
end

function closeMenuFull()
    Menu.hidden = true
    currentGarage = nil
    ClearMenu()
end


-- Functions 

DrawText3D = function(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end
