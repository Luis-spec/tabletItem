local isTabletActive = false
local tabletObj = Config.tabletObject
local tab

RegisterNetEvent('tablet:open')
AddEventHandler('tablet:open', function()
	--anim
	startAnim()
	-- tablet öffnen
	--TriggerServerEvent('myMDT:openSystem')
end)

Citizen.CreateThread(function()
	while true do
		local speed = GetEntitySpeed(PlayerPedId())
		if isTabletActive and speed > 0.25 then
			stopAnim()
		end
		Citizen.Wait(500)
	end
end)

function startAnim()
	isTabletActive = true
	Citizen.CreateThread(function()
		RequestAnimDict("amb@world_human_seat_wall_tablet@female@base")
		while not HasAnimDictLoaded("amb@world_human_seat_wall_tablet@female@base") do
			Citizen.Wait(0)
		end
		attachObject()
		TaskPlayAnim(GetPlayerPed(-1), "amb@world_human_seat_wall_tablet@female@base", "base" ,8.0, -8.0, -1, 50, 0, false, false, false)
	end)
end

function stopAnim()
	StopAnimTask(GetPlayerPed(-1), "amb@world_human_seat_wall_tablet@female@base", "base" ,8.0, -8.0, -1, 50, 0, false, false, false)
	DeleteEntity(tab)
	isTabletActive = false
end

function attachObject()
	tab = CreateObject(GetHashKey(tabletObj), 0, 0, 0, true, true, true)
	AttachEntityToEntity(tab, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.17, 0.10, -0.13, 20.0, 180.0, 180.0, true, true, false, true, 1, true)
end