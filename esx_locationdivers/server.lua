------ l'argent pris pour l'evenement peut etre versé dans l'entreprise que vous souhaitez --------

ESX                			 = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_locationdivers:buy')
AddEventHandler('esx_locationdivers:buy', function(price)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	--local societyAccount = nil
	  
	  --TriggerEvent('esx_addonaccount:getSharedAccount', 'society_gouvernor', function(account)
		--societyAccount = account
	  --end)

    xPlayer.removeMoney(price)
		--societyAccount.addMoney (price)
    TriggerClientEvent('esx:showNotification', _source, 'Merci et à bientôt !')
end)