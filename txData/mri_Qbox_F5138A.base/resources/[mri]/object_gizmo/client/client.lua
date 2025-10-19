local usingGizmo = false
local focus = false

local function toggleNuiFrame(bool)
    usingGizmo = bool
    SetNuiFocus(bool, bool)
end

function useGizmo(handle)

    SendNUIMessage({
        action = 'setGizmoEntity',
        data = {
            handle = handle,
            position = GetEntityCoords(handle),
            rotation = GetEntityRotation(handle)
        }
    })

    toggleNuiFrame(true)

    lib.showTextUI(
        ('Modo: %s  \n'):format("translate") ..
        '[R]    - Trocar Modos  \n' ..
        '[C] - Colocar no chão  \n' ..
        '[CAPSLOCK]    - Alternar mouse  \n' ..
        '[Esc]  - Salvar  \n'
    )

    while usingGizmo do

        SendNUIMessage({
            action = 'setCameraPosition',
            data = {
                position = GetFinalRenderedCamCoord(),
                rotation = GetFinalRenderedCamRot()
            }
        })
        if IsDisabledControlJustReleased(0, 137) or IsControlJustReleased(0, 137) then
            SetNuiFocus(true, true)
        end
        Wait(0)
    end

    lib.hideTextUI()

    return {
        handle = handle,
        position = GetEntityCoords(handle),
        rotation = GetEntityRotation(handle)
    }
end

RegisterNUICallback('moveEntity', function(data, cb)
    local entity = data.handle
    local position = data.position
    local rotation = data.rotation

    SetEntityCoords(entity, position.x, position.y, position.z)
    SetEntityRotation(entity, rotation.x, rotation.y, rotation.z)
    cb('ok')
end)

RegisterNUICallback('placeOnGround', function(data, cb)
    PlaceObjectOnGroundProperly(data.handle)
    cb('ok')
end)

RegisterNUICallback('nuiFocus', function(data, cb)
        SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback('finishEdit', function(data, cb)
    toggleNuiFrame(false)
    focus = false
    SendNUIMessage({
        action = 'setGizmoEntity',
        data = {
            handle = nil,
        }
    })
    cb('ok')
end)

RegisterNUICallback('swapMode', function(data, cb)
    lib.showTextUI(
        ('Modo: %s  \n'):format(data.mode) ..
        '[R]    - Trocar Modos  \n' ..
        '[C] - Colocar no chão  \n' ..
        '[CAPSLOCK]    - Alternar mouse  \n' ..
        '[Esc]  - Salvar  \n'
    )
    cb('ok')
end)


exports("useGizmo", useGizmo)
