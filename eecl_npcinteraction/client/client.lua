CreateThread(function() -- crear npcs
    for i, v in pairs(Config.npcs) do
        local coords4 = vec4(Config.npcs[i].coords.x, Config.npcs[i].coords.y, Config.npcs[i].coords.z, Config.npcs[i].coords.w )
       
        local hash = GetHashKey(Config.npcs[i].ped)
        while not HasModelLoaded(hash) do
            RequestModel(hash)
            Wait(20)
        end
        ped = CreatePed("PED_TYPE_CIVFEMALE", Config.npcs[i].ped, coords4, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
    end
end)

CreateThread(function() -- comprobar distancia con el npcs
    while true do
        local wait = 1000
        for i, v in pairs(Config.npcs) do
            coords3 = vec3(Config.npcs[i].coords.x, Config.npcs[i].coords.y, Config.npcs[i].coords.z)
            -- print(wait)
            local playerCoords = GetEntityCoords(ESX.PlayerData.ped)
            local distance = #(playerCoords - coords3)
            if distance < Config.npcs[i].distancia then
                local wait = 1
                ESX.TextUI(Config.npcs[i].textui)
                if IsControlPressed(0,153) then
                    local Elements = {
                        {label = Config.npcs[i].A.label, name = "A"},
                        {label = Config.npcs[i].B.label, name = "B"},
                        {label = Config.npcs[i].C.label, name = "C"},
                        -- {label = "Bread - £200", name = "bread", value = 1, type = 'slider', min = 1,max = 100},
                        -- {label = '<span style="color:green;">HEY! IM GREEN!/span>', name = "geen_element"}
                      }
                
                    ESX.UI.Menu.Open("default", GetCurrentResourceName(), Config.npcs[i].name, {
                        title = Config.npcs[i].title, -- The Name of Menu to show to users,
                        align    = 'top-left', -- top-left | top-right | bottom-left | bottom-right | center |
                        elements = Elements -- define elements as the pre-created table
                      }, function(data,menu) -- OnSelect Function
                        --- for a simple element
                        if data.current.name == "A" then
                            TriggerEvent(Config.npcs[i].A.valor)
                          menu.close()
                        end

                        if data.current.name == "B" then
                            TriggerEvent(Config.npcs[i].B.valor)
                            menu.close()
                        end

                        if data.current.name == "C" then
                            TriggerEvent(Config.npcs[i].C.valor)
                            menu.close()
                        end
                      end, function(data, menu) -- Cancel Function
                        menu.close() -- close menu
                    end)
                end
            end
        
        end 
        Wait(wait)
    end
end)