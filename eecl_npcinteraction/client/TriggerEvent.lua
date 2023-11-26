RegisterNetEvent("eecl_npcinteraction:test",function()
    print("Hola")
end)

RegisterNetEvent("eecl_npcinteraction:test2",function()
    print("Hola Panchitos")
end)


RegisterNetEvent("eecl_npcinteraction:test3",function()
    TriggerServerEvent("eecl_npcinteraction:pan")
end)
