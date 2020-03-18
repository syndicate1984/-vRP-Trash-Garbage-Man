local gunoaie = {
    "prop_bin_01a",
    "prop_bin_03a",
    "prop_bin_05a",
    'prop_dumpster_01a',
    'prop_dumpster_02a',
    'prop_dumpster_02b',
    'prop_dumpster_4a',
    'prop_dumpster_4b'
}
local gunoaie2 = {}

Citizen.CreateThread(function()
    Citizen.Wait(100)

    while true do
        local sleepThread = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        for i = 1, #gunoaie do
            local x = GetClosestObjectOfType(playerCoords, 2.0, GetHashKey(gunoaie[i]), false, false, false)
            local entity = nil
            if DoesEntityExist(x) then
                entity = x
                gunoi    = GetEntityCoords(entity)

        if DoesEntityExist(entity) <= 1.5 then
            sleepThread = 5

            DrawText3D(gunoi.x, gunoi.y, gunoi.z + 1.5, 'Apasa [~g~E~s~] pentru a cauta in gunoi~s~')  

            if IsControlJustReleased(0, 38) then
                if not gunoaie2[entity] then
                    gunoaie2[entity] = true

                    OpenTrashCan()
                else
                    notify("~r~Deja ai cautat in gunoiu asta!")
                        end
                    end
                end
            end
        end
        Citizen.Wait(sleepThread)
    end
end)

function OpenTrashCan()
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)

    Citizen.Wait(10000)

    TriggerServerEvent("vrp:primeste")

    ClearPedTasks(PlayerPedId())
end

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

DrawText3D = function(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
  
	local scale = 0.45
   
	if onScreen then
		SetTextScale(scale, scale)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextOutline()
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 370
        DrawRect(_x, _y + 0.0150, 0.030 + factor , 0.030, 66, 66, 66, 150)
	end
end