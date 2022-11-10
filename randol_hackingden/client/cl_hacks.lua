local QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        HackZones()
    end
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    HackZones()
end)

AddEventHandler('onResourceStop', function(resourceName) 
	if GetCurrentResourceName() == resourceName then
        exports['qb-target']:RemoveZone("psHacks")
        exports['qb-target']:RemoveZone("mHacks")
        exports['qb-target']:RemoveZone("fingerHack")
	end 
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    exports['qb-target']:RemoveZone("psHacks")
    exports['qb-target']:RemoveZone("mHacks")
    exports['qb-target']:RemoveZone("fingerHack")
end)

CreateThread(function()
    if Config.Blip.Enable then
        hackBlip = AddBlipForCoord(Config.Blip.coords)
        SetBlipSprite(hackBlip, 362)
        SetBlipDisplay(hackBlip, 4)
        SetBlipScale(hackBlip, 0.8)
        SetBlipColour(hackBlip, 0)
        SetBlipAsShortRange(hackBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("The Den")
        EndTextCommandSetBlipName(hackBlip)
    end
end)

function HackResults(success)
    if success then
		TriggerEvent('mhacking:hide')
        QBCore.Functions.Notify("You completed the hack.", "success")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    else
		TriggerEvent('mhacking:hide')
		QBCore.Functions.Notify("You failed the hack.", "error")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
	end
end

RegisterNetEvent('randol_hacking:client:codeBlocks', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"texting"})
    Wait(2000)
	TriggerEvent("mhacking:show")
	TriggerEvent("mhacking:start", math.random(Config.CodeBlockMinigame.minChars, Config.CodeBlockMinigame.maxChars), math.random(Config.CodeBlockMinigame.minTime, Config.CodeBlockMinigame.maxTime), HackResults)
end)

RegisterNetEvent('randol_hacking:client:fingerHack', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"type"})
    Wait(1000) -- Give them time to prepare.
    TriggerEvent("utk_fingerprint:Start", math.random(Config.FingerHack.levels.min,Config.FingerHack.levels.max), math.random(Config.FingerHack.lifes.min,Config.FingerHack.lifes.max), 1, function(outcome, reason)
        if outcome then
            TriggerEvent('mhacking:hide')
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            QBCore.Functions.Notify("You successfully did the hack.", "success")
        else
            TriggerEvent('mhacking:hide')
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            QBCore.Functions.Notify("You failed. Rip Bozo. L + Ratio.", "error")
        end
    end)
end)

RegisterNetEvent('randol_hacking:client:psMinigames', function(gameType)
    TriggerEvent('animations:client:EmoteCommandStart', {"type"})
    Wait(1000) -- Give them time to prepare.
    if gameType == 1 then
        exports['ps-ui']:Circle(function(success)
            if success then
                QBCore.Functions.Notify("You successfully did the hack.", "success")
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            else
                QBCore.Functions.Notify("You failed. Rip Bozo. L + Ratio.", "error")
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            end
        end, math.random(Config.SlothMinigames["Circle"].NumberOfCircles.min,Config.SlothMinigames["Circle"].NumberOfCircles.max), math.random(Config.SlothMinigames["Circle"].MS.min,Config.SlothMinigames["Circle"].MS.max))
    elseif gameType == 2 then
        exports['ps-ui']:Maze(function(success)
            if success then
                QBCore.Functions.Notify("You successfully did the hack.", "success")
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            else
                QBCore.Functions.Notify("You failed. Rip Bozo. L + Ratio.", "error")
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            end
        end, math.random(Config.SlothMinigames["Maze"].HackTime.min, Config.SlothMinigames["Maze"].HackTime.max))
    elseif gameType == 3 then
        exports['ps-ui']:VarHack(function(success)
            if success then
                QBCore.Functions.Notify("You successfully did the hack.", "success")
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            else
                QBCore.Functions.Notify("You failed. Rip Bozo. L + Ratio.", "error")
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            end
         end, Config.SlothMinigames["VarHack"].Blocks, Config.SlothMinigames["VarHack"].Seconds)
    elseif gameType == 4 then
         exports['ps-ui']:Thermite(function(success)
            if success then
                QBCore.Functions.Notify("You successfully did the hack.", "success")
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            else
                QBCore.Functions.Notify("You failed. Rip Bozo. L + Ratio.", "error")
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            end
         end, Config.SlothMinigames["Thermite"].Time, Config.SlothMinigames["Thermite"].Gridsize, Config.SlothMinigames["Thermite"].IncorrectBlocks) -- Time, Gridsize (5, 6, 7, 8, 9, 10), IncorrectBlocks
    elseif gameType == 5 then
        exports['ps-ui']:Scrambler(function(success)
            if success then
                QBCore.Functions.Notify("You successfully did the hack.", "success")
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            else
                QBCore.Functions.Notify("You failed. Rip Bozo. L + Ratio.", "error")
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            end
        end, Config.SlothMinigames["Scrambler"].Type[math.random(#Config.SlothMinigames["Scrambler"].Type)], Config.SlothMinigames["Scrambler"].Time, Config.SlothMinigames["Scrambler"].Mirrored) -- Type (alphabet, numeric, alphanumeric, greek, braille, runes), Time (Seconds), Mirrored (0: Normal, 1: Normal + Mirrored 2: Mirrored only ))
    end
end)

RegisterNetEvent('randol_hacking:client:psMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = 'Hack Selection',
            txt = 'Test your skills.',
            icon = 'fa-solid fa-list-ul',
            isMenuHeader = true
        },
        {
            header = 'Circle Minigame',
            icon = 'fa-solid fa-masks-theater',
            params = {
                event = "randol_hacking:client:psMinigames",
                args = 1
            }
        },
        {
            header = 'Maze Minigame',
            icon = 'fa-solid fa-masks-theater',
			params = {
                event = "randol_hacking:client:psMinigames",
                args = 2
            }
        },
        {
            header = 'Var Hack Minigame',
            icon = 'fa-solid fa-masks-theater',
			params = {
                event = "randol_hacking:client:psMinigames",
                args = 3
            }
        },
        {
            header = 'Thermite Minigame',
            icon = 'fa-solid fa-masks-theater',
			params = {
                event = "randol_hacking:client:psMinigames",
                args = 4
            }
        },
        {
            header = 'Scrambler Minigame',
            icon = 'fa-solid fa-masks-theater',
			params = {
                event = "randol_hacking:client:psMinigames",
                args = 5
            }
        },
        {
            header = 'Close',
            icon = 'fa-solid fa-angle-left',
			
			params = {
                event = 'qb-menu:closeMenu'
            }
        },
    })
end)

function HackZones()
    if Config.ProjectSloth then
        exports['qb-target']:AddCircleZone("psHacks", vector3(759.37, -1911.83, 29.66), 0.65, {
            name="psHacks",
            useZ=true,
            debugPoly= Config.Debug,
        }, {
            options = {
                {
                    type = "client",
                    event = "randol_hacking:client:psMenu",
                    icon = "fa-solid fa-user-secret",
                    label = "Multi Hacks",
                },
            },
            distance = 1.5
        })
    end
    if Config.MHacking then
        exports['qb-target']:AddCircleZone("mHacks", vector3(757.92, -1912.06, 29.26), 0.5, {
            name="mHacks",
            useZ=true,
            debugPoly= Config.Debug,
        }, {
            options = {
                {
                    type = "client",
                    event = "randol_hacking:client:codeBlocks",
                    icon = "fa-solid fa-user-secret",
                    label = "Code Block Hack",
                },
            },
            distance = 1.5
        })
    end
    if Config.FingerPrint then
        exports['qb-target']:AddCircleZone("fingerHack", vector3(754.62, -1903.74, 29.26), 0.5, {
            name="fingerHack",
            useZ=true,
            debugPoly= Config.Debug,
        }, {
            options = {
                {
                    type = "client",
                    event = "randol_hacking:client:fingerHack",
                    icon = "fa-solid fa-fingerprint",
                    label = "Fingerprint Hack",
                },
            },
            distance = 1.5
        })
    end
end