RegisterNetEvent("eecl_npcinteraction:pan",function()
    local xPlayer = ESX.GetPlayerFromId(source)
    
    xPlayer.addInventoryItem("bread", 1)   
end)