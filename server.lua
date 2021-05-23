ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('oski_baska:zaplac', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
    local cena = 5000

	if xPlayer.getMoney() >= cena then
		xPlayer.removeMoney(cena)
		cb(true)
	else
		cb(false)
	end
end)


ESX.RegisterServerCallback('oski_baska:iloscEMS', function(source, cb)
    local xPlayers = ESX.GetPlayers()
    local ems = 0
    for i=1, #xPlayers, 1 do
	    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
	    if xPlayer.job.name == 'ambulance' then
		    ems = ems + 1
        end
        if ems == 0 then
            cb(true)
        else
            cb(false)
        end
    end
end)