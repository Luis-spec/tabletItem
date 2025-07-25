ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterUsableItem(Config.tabletItem, function(source)
    -- event ausführen
    TriggerClientEvent('tablet:open', source)
end)