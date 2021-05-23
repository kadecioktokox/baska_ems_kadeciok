ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)



	-- Ped 
	pedName = 's_m_y_autopsy_01',
	pedHash = 0xB2273D4E,
	pedHeading = 7.0,
	pedCoords = { x = -678.22, y = -338.25, z = 83.12 },


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(PlayerPedId())            
        if (GetDistanceBetweenCoords(coords, kordy, true) < ) then
            DrawMarker(27, kordy, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.5, 2.5, 2.5, 136, 243, 216, 100, false, true, 2, false, false, false, false)
            if GetDistanceBetweenCoords(coords, kordy, true) < 2 then
                alert("Naciśnij ~INPUT_PICKUP~ aby lokalny medyk mógł ci pomóc")
                if GetDistanceBetweenCoords(coords, kordy, true) < 2 and IsControlJustReleased(1, 38) then
				    ESX.TriggerServerCallback('oski_baska:iloscEMS', function(ems)
					    if ems then
                            ESX.TriggerServerCallback('oski_baska:zaplac', function(bought)
                                if bought then
						            ESX.ShowNotification('Jacek ci pomaga!')
                                    Citizen.Wait(8000)
                                    TriggerEvent("esx_ambulancejob:revive", PlayerPedId())
                                else
                                    ESX.ShowNotification('Nie masz pieniędzy!')
                                end
							end)
						else
						    ESX.ShowNotification('Wygląda na to żę jest więcej niż jeden medyk, udaj się do medyka pełniącego służbę!')
						end
					end)
                end   
            else
                ESX.UI.Menu.Close('default', GetCurrentResourceName(), 'baskamenu')
            end
        end
    end
end)

function alert(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end