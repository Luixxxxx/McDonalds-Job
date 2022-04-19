
local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent('qb-mcd:server:start:black')
AddEventHandler('qb-mcd:server:start:black', function()
    local src = source
    
    TriggerClientEvent('qb-mcd:start:black:job', src)
end)

RegisterServerEvent('qb-mcd:server:reward:money')
AddEventHandler('qb-mcd:server:reward:money', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    Player.Functions.AddMoney("cash", Config.PaymentTaco, "taco-reward-money")
    TriggerClientEvent('QBCore:Notify', src, "McDonalds Bag delivered! Go back to the McDonalds for a new delivery")
end)

QBCore.Functions.CreateCallback('qb-mcds:server:GetConfig', function(source, cb)
    cb(Config)
end)

RegisterServerEvent('qb-mcds:server:get:stuff')
AddEventHandler('qb-mcds:server:get:stuff', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Player ~= nil then
        Player.Functions.AddItem("mcd-box", 5)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mcd-box'], "add")
    end
end)

QBCore.Functions.CreateCallback('qb-mcd:server:get:ingredient', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cutp = Ply.Functions.GetItemByName("cutp")
    local oil = Ply.Functions.GetItemByName("oil")
    if cutp ~= nil and oil ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-mcd:server:get:ingredient5', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local cone = Ply.Functions.GetItemByName("cone")

     if cone ~= nil  then
        cb(true)
    else
        cb(false)
    end
end)
QBCore.Functions.CreateCallback('qb-mcd:server:get:ingredient6', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local potato = Ply.Functions.GetItemByName("potato")

     if potato ~= nil  then
        cb(true)
    else
        cb(false)
    end
end)
QBCore.Functions.CreateCallback('qb-mcd:server:get:ingredient7', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local potato = Ply.Functions.GetItemByName("potato")

     if potato ~= nil  then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-mcd:server:get:ingredient4', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local vegpatty = Ply.Functions.GetItemByName("vegpatty")
	 local sauce = Ply.Functions.GetItemByName("sauce")
	  local cheese = Ply.Functions.GetItemByName("cheese")
	  local bun = Ply.Functions.GetItemByName("bun")
     if vegpatty ~= nil and sauce ~= nil and cheese ~= nil and bun ~= nil then
        cb(true)
    else
        cb(false)
    end
end)


QBCore.Functions.CreateCallback('qb-mcd:server:get:ingredient3', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local flour = Ply.Functions.GetItemByName("flour")
	 local sauce = Ply.Functions.GetItemByName("sauce")
	  local cheese = Ply.Functions.GetItemByName("cheese")
     if flour ~= nil and sauce ~= nil and cheese ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-mcd:server:get:ingredient2', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local mashedp = Ply.Functions.GetItemByName("mashedp")
     if mashedp ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-mcd:server:get:ingredient1', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local emptyglass = Ply.Functions.GetItemByName("emptyglass")
     if emptyglass ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-mcd:server:get:tacobox', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local box = Ply.Functions.GetItemByName("mcd-box")
    if box ~= nil then
        cb(true)
    else
        cb(false)
    end
end)
QBCore.Functions.CreateCallback('qb-mcd:server:get:ingredient8', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local mcdburger = Ply.Functions.GetItemByName('mcd-burger')
	    local mcdfries = Ply.Functions.GetItemByName('mcd-fries')
		    local coke = Ply.Functions.GetItemByName('coke')
    if mcdfries ~= nil and mcdburger ~= nil and coke ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-mcd:server:get:mcdmeal', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
  
		    local mcd = Ply.Functions.GetItemByName('mcd-meal')
    if mcd ~= nil then
        cb(true)
    else
        cb(false)
    end
end)


-- QBCore.Commands.Add("setmcd", "Set someone as a McDonalds", {{name="id", help="Player ID"}}, true, function(source, args)
--     local Player = QBCore.Functions.GetPlayer(source)
--     local playerId = tonumber(args[1])
--     local OtherPlayer = QBCore.Functions.GetPlayer(playerId)
--     if Player.PlayerData.job.name == "mcd"  then
--         if OtherPlayer ~= nil then
           
--             OtherPlayer.Functions.SetJob("mcdemployee")
--            -- OtherPlayer.Functions.AddItem("lawyerpass", 1, false, lawyerInfo)
--            TriggerClientEvent("QBCore:Notify", source, "- " .. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " ,You have Hired as a McDonalds Employee")
--             TriggerClientEvent("QBCore:Notify", OtherPlayer.PlayerData.source, "You are now a McDonalds Employee")
--        --     TriggerClientEvent('inventory:client:ItemBox', OtherPlayer.PlayerData.source, QBCore.Shared.Items["lawyerpass"], "add")
--         else
--             TriggerClientEvent("QBCore:Notify", source, "This person is not present..", "error")
--         end
--     else
--         TriggerClientEvent("QBCore:Notify", source, "You have no rights..", "error")
--     end
-- end)

-- QBCore.Commands.Add("removemcd", "Delete someone from McDonalds", {{name="id", help="Player ID"}}, true, function(source, args)
--     local Player = QBCore.Functions.GetPlayer(source)
--     local playerId = tonumber(args[1])
--     local OtherPlayer = QBCore.Functions.GetPlayer(playerId)
--     if Player.PlayerData.job.name == "mcd" then
--         if OtherPlayer ~= nil then
--             OtherPlayer.Functions.SetJob("unemployed")
--             TriggerClientEvent("QBCore:Notify", OtherPlayer.PlayerData.source, "You are now McDonalds Employee")
--             TriggerClientEvent("QBCore:Notify", source, "-".. OtherPlayer.PlayerData.charinfo.firstname .. " " .. OtherPlayer.PlayerData.charinfo.lastname ..  " , You are Fired as a McDonalds Employee")
--         else
--             TriggerClientEvent("QBCore:Notify", source, "This person is not present..", "error")
--         end
--     else
--         TriggerClientEvent("QBCore:Notify", source, "You have no rights..", "error")
--     end
-- end)

