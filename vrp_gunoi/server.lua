local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_gunoi")

RegisterServerEvent("vrp:primeste")
AddEventHandler("vrp:primeste", function()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})

    local noroc = math.random(0, 74)
    local suma = math.random(1, 3)

    if noroc >= 0 and noroc <= 29 then
        vRP.giveInventoryItem({user_id, "vodka", suma})
    elseif noroc >=30 and noroc <=50 then
        vRP.giveInventoryItem({user_id, "kebab", suma})
    elseif noroc >=51 and noroc <=62 then
        vRP.giveInventoryItem({user_id, "milk", suma})
    elseif noroc >=63 and noroc <=74 then
        vRP.giveInventoryItem({user_id, "donut", suma})
    end
end)
