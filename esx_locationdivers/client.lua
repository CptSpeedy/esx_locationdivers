---------------------------------------------------------------
---------- esx_locationdivers mit en place par Duch' ----------
---------------------------------------------------------------

ESX 					= nil
local PlayerData 		= {}
local menuOpen 			= false
-------------------------------------------------------
---- ACTIVER/DESACTIVER L'EVENEMENT ( à modifier )-----
-------------------------------------------------------
local seashark 			= true
local voiture 			= true
local moto 				= true
local telepherique1 	= true
local telepherique2 	= true
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

-- location moto
Citizen.CreateThread(function()

    if moto == true then
	
		RequestModel(GetHashKey("u_m_y_sbike"))
		while not HasModelLoaded(GetHashKey("u_m_y_sbike")) do
			Wait(1)
		end

		local ped1 =  CreatePed(4,  0x6AF4185D  , 500.4251, 5601.6562, 795.5900, 183.00, false, true)
			SetEntityHeading(ped1, 183.00)
			FreezeEntityPosition(ped1, true)
			SetEntityInvincible(ped1, true)
			SetBlockingOfNonTemporaryEvents(ped1, true)
	end
end)

Citizen.CreateThread(function()

    if moto == true then
	
		while true do 
			Citizen.Wait(1)

			for _,k in pairs(locations) do
				local pedCoords = GetEntityCoords(PlayerPedId())

				if(GetDistanceBetweenCoords(pedCoords, k.coordsIn.x, k.coordsIn.y, k.coordsIn.z, true) < 50)then
				DrawMarker(-1,k.coordsIn.x,k.coordsIn.y, k.coordsIn.z-0.5,0,0,0,0,0,0,3.501,3.5001,0.5001,0,155,255,200,0,0,0,0)
				end
				if(GetDistanceBetweenCoords(pedCoords, k.coordsIn.x, k.coordsIn.y, k.coordsIn.z, true) < 6)then
					showInfo("Appuyez sur ~INPUT_CONTEXT~ pour louer une Moto")
					if(IsControlJustPressed(1, 38)) then
						showMenu(k)
						menuOpen = true
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
    if moto == true then

	local blip = AddBlipForCoord(500.4251, 5601.6562, 795.5900)
		SetBlipSprite (blip, 226)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 1.0)
		SetBlipColour (blip, 5)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(('Location Motos Cross'))
		EndTextCommandSetBlipName(blip)
  end
end)

function showMenu(k)

	local essence 		= 50
	local elements = {
		{label = 'Moto cross', value = 'sanchez', price = 50}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vehicle_menu',
		{
			title = 'Location de moto --- [ 50$ ]',
			elements = elements
		},
		function(data, menu)
			for i=1, #elements, 1 do
				ESX.Game.SpawnVehicle(data.current.value, k.coordsOut[1], k.coordsOut[2], function(vehicle)
					TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
					TriggerEvent("advancedFuel:setEssence", essence , GetVehicleNumberPlateText(vehicle), GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
				end)
				TriggerServerEvent('esx_locationdivers:buy', data.current.price)
				print(data.current.price)
			end
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
	)
end
-- location seashark

Citizen.CreateThread(function()

    if seashark == true then
	
		RequestModel(GetHashKey("a_m_y_beach_01"))
			while not HasModelLoaded(GetHashKey("a_m_y_beach_01")) do
				Wait(1)
			end

		local ped1 =  CreatePed(4,  0xD1FEB884  , -1612.1522, -1126.4547, 1.3193, 135.10928, false, true)
			SetEntityHeading(ped1, 135.10928)
			FreezeEntityPosition(ped1, true)
			SetEntityInvincible(ped1, true)
			SetBlockingOfNonTemporaryEvents(ped1, true)
	end
	
end)

Citizen.CreateThread(function()

    if seashark == true then

		for _,k in pairs(locations4) do
			createBlip(k.coordsIn4.x, k.coordsIn4.y, k.coordsIn4.z, 471, 1, "Location de Seashark", 5)
		end


		while true do 
			Citizen.Wait(1)

			for _,k in pairs(locations4) do
				local pedCoords = GetEntityCoords(PlayerPedId())

				if(GetDistanceBetweenCoords(pedCoords, k.coordsIn4.x, k.coordsIn4.y, k.coordsIn4.z, true) < 50)then
					DrawMarker(-1,k.coordsIn4.x,k.coordsIn4.y, k.coordsIn4.z-0.5,0,0,0,0,0,0,3.501,3.5001,0.5001,0,155,255,200,0,0,0,0)
				end
				if(GetDistanceBetweenCoords(pedCoords, k.coordsIn4.x, k.coordsIn4.y, k.coordsIn4.z, true) < 6)then
					showInfo("Appuyez sur ~INPUT_CONTEXT~ pour louer un Seashark")
					if(IsControlJustPressed(1, 38)) then
						showMenu4(k)
						menuOpen = true
					end
				end
			end
		end
	end
end)

function showMenu4(k)

	local essence 		= 50
	local elements = {
		{label = 'Seashark', value = 'seashark', price = 50}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vehicle_menu',
		{
			title = 'Location de Seashark --- [ 50$ ]',
			elements = elements
		},
		function(data, menu)
			for i=1, #elements, 1 do
				ESX.Game.SpawnVehicle(data.current.value, k.coordsOut4[1], k.coordsOut4[2], function(vehicle)
					TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
					TriggerEvent("advancedFuel:setEssence", essence , GetVehicleNumberPlateText(vehicle), GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
				end)
				TriggerServerEvent('esx_locationdivers:buy', data.current.price)
				print(data.current.price)
			end
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
	)
end

-- location voiture aeroport

Citizen.CreateThread(function()

    if voiture == true then
    
		RequestModel(GetHashKey("ig_popov"))
			while not HasModelLoaded(GetHashKey("ig_popov")) do
				Wait(1)
			end

		local ped1 =  CreatePed(4,  0x267630FE , -966.8138, -2693.9235, 12.8306, 138.71543, false, true)
			SetEntityHeading(ped1, 138.71543)
			FreezeEntityPosition(ped1, true)
			SetEntityInvincible(ped1, true)
			SetBlockingOfNonTemporaryEvents(ped1, true)
	end
end)

Citizen.CreateThread(function()

    if voiture == true then

		for _,k in pairs(locations5) do
			createBlip(k.coordsIn5.x, k.coordsIn5.y, k.coordsIn5.z, 225, 0.25, "Location de voiture", 5)
		end


		while true do 
			Citizen.Wait(1)

			for _,k in pairs(locations5) do
				local pedCoords = GetEntityCoords(PlayerPedId())

				if(GetDistanceBetweenCoords(pedCoords, k.coordsIn5.x, k.coordsIn5.y, k.coordsIn5.z, true) < 50)then
					DrawMarker(-1,k.coordsIn5.x,k.coordsIn5.y, k.coordsIn5.z-0,0,0,0,0,0,0,3.501,3.5001,0.5001,0,155,255,200,0,0,0,0)
				end
				if(GetDistanceBetweenCoords(pedCoords, k.coordsIn5.x, k.coordsIn5.y, k.coordsIn5.z, true) < 6)then
					showInfo("Appuyez sur ~INPUT_CONTEXT~ pour louer un véhicule")
					if(IsControlJustPressed(1, 38)) then
						showMenu5(k)
						menuOpen = true
					end
				end
			end
		end
	end
end)

function showMenu5(k)

	local essence 		= 50
	local elements = {
		{label = 'Kalahari', value = 'kalahari', price = 50}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vehicle_menu',
		{
			title = 'Location de voiture --- [ 50$ ]',
			elements = elements
		},
		function(data, menu)
			for i=1, #elements, 1 do
				ESX.Game.SpawnVehicle(data.current.value, k.coordsOut5[1], k.coordsOut5[2], function(vehicle)
					TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
					TriggerEvent("advancedFuel:setEssence", essence , GetVehicleNumberPlateText(vehicle), GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
				end)
				TriggerServerEvent('locationdivers:buy', data.current.price)
				print(data.current.price)
			end
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
	)
end

-- telephérique chiliad
Citizen.CreateThread(function()

    if telepherique1 == true then
    
		RequestModel(GetHashKey("s_m_y_construct_02"))
			while not HasModelLoaded(GetHashKey("s_m_y_construct_02")) do
				Wait(1)
			end

		local ped1 =  CreatePed(4,  0xC5FEFADE  , 444.7735, 5572.0200, 780.1888, 183.00, false, true)
			SetEntityHeading(ped1, 272.33)
			FreezeEntityPosition(ped1, true)
			SetEntityInvincible(ped1, true)
			SetBlockingOfNonTemporaryEvents(ped1, true)
	 end
end)

Citizen.CreateThread(function()

    if telepherique1 == true then

		for _,k in pairs(locations3) do
			createBlip(k.coordsIn3.x, k.coordsIn3.y, k.coordsIn3.z, 485, 1, "Téléphérique", 4)
		end


		while true do 
			Citizen.Wait(1)

			for _,k in pairs(locations3) do
				local pedCoords = GetEntityCoords(PlayerPedId())

				if(GetDistanceBetweenCoords(pedCoords, k.coordsIn3.x, k.coordsIn3.y, k.coordsIn3.z, true) < 50)then
					DrawMarker(-1,k.coordsIn3.x,k.coordsIn3.y, k.coordsIn3.z-0.5,0,0,0,0,0,0,3.501,3.5001,0.5001,0,155,255,200,0,0,0,0)
				end
				if(GetDistanceBetweenCoords(pedCoords, k.coordsIn3.x, k.coordsIn3.y, k.coordsIn3.z, true) < 6)then
					showInfo("Appuyez sur ~INPUT_CONTEXT~ pour prendre le téléphérique vers Paleto Bay")
					if(IsControlJustPressed(1, 38)) then
						showMenu2(k)
						menuOpen = true
					end
				end
			end
		end
	end
end)

function showMenu2(k)

	local elements = {
		{label = 'Téléphérique --- [ 15 $ ]', value = '---', price = 15}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vehicle_menu',
		{
			title = 'Téléphérique',
			elements = elements
		},
		function(data, menu)
			for i=1, #elements, 1 do
						
				ESX.ShowNotification('Vous prenez le téléphérique, veuillez patienter  ...')
				Citizen.Wait(2000)	
				DoScreenFadeOut(1000)
				Citizen.Wait(10000)
				SetEntityCoords(GetPlayerPed(-1), -741.719, 5595.351, 40.6545)
				DoScreenFadeIn(1000)
				TriggerServerEvent('esx_locationdivers:buy', data.current.price)
				print(data.current.price)
			end
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
	)
end

---- telepherique paleto bay

Citizen.CreateThread(function()

    if telepherique2 == true then
    
		RequestModel(GetHashKey("s_m_y_construct_02"))
			while not HasModelLoaded(GetHashKey("s_m_y_construct_02")) do
				Wait(1)
			end

		local ped1 =  CreatePed(4,  0xC5FEFADE  , -739.6201, 5595.4140, 40.6545, 86.00, false, true)
			SetEntityHeading(ped1, 86.33)
			FreezeEntityPosition(ped1, true)
			SetEntityInvincible(ped1, true)
			SetBlockingOfNonTemporaryEvents(ped1, true)
	end
end)

Citizen.CreateThread(function()

    if telepherique2 == true then

		for _,k in pairs(locations2) do
			createBlip(k.coordsIn2.x, k.coordsIn2.y, k.coordsIn2.z, 485, 1, "Téléphérique", 4)
		end


		while true do 
			Citizen.Wait(1)

			for _,k in pairs(locations2) do
				local pedCoords = GetEntityCoords(PlayerPedId())

				if(GetDistanceBetweenCoords(pedCoords, k.coordsIn2.x, k.coordsIn2.y, k.coordsIn2.z, true) < 50)then
					DrawMarker(-1,k.coordsIn2.x,k.coordsIn2.y, k.coordsIn2.z-0.5,0,0,0,0,0,0,3.501,3.5001,0.5001,0,155,255,200,0,0,0,0)
				end
				if(GetDistanceBetweenCoords(pedCoords, k.coordsIn2.x, k.coordsIn2.y, k.coordsIn2.z, true) < 6)then
					showInfo("Appuyez sur ~INPUT_CONTEXT~ pour prendre le téléphérique vers le Mont Chiliad")
					if(IsControlJustPressed(1, 38)) then
						showMenu3(k)
						menuOpen = true
					end
				end
			end
		end
	end
end)

function showMenu3(k)

	local elements = {
		{label = 'Téléphérique --- [ 15 $ ]', value = '---', price = 15}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vehicle_menu',
		{
			title = 'Téléphérique',
			elements = elements
		},
		function(data, menu)
			for i=1, #elements, 1 do
				
				ESX.ShowNotification('Vous prenez le téléphérique, veuillez patienter  ...')
				Citizen.Wait(2000)
				DoScreenFadeOut(1000)
				Citizen.Wait(10000)
				SetEntityCoords(GetPlayerPed(-1), 449.1991, 5572.1684, 780.1888)
				DoScreenFadeIn(1000)
				TriggerServerEvent('esx_locationdivers:buy', data.current.price)
				print(data.current.price)
			end
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
	)
end


function showInfo(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, false, 1, 0)
end

function createBlip(x,y,z,id, onlyShortRange, name,color)
	local blip = AddBlipForCoord(x,y,z)
	SetBlipSprite(blip, id)
	SetBlipAsShortRange(blip, onlyShortRange)
	BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(name)
    EndTextCommandSetBlipName(blip)
    SetBlipColour(blip, color)
    return blip
end
