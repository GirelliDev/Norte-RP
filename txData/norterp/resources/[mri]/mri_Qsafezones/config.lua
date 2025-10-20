Config = {}

Config.EnableNotifications = true -- Do you want notifications when a player enters and exits the preconfigured greenzones (The Config.GreenZones)?
Config.GreenzonesCommand = 'setzone' -- The command to run in-game to start creating a temporary greenzone
Config.GreenzonesClearCommand = 'clearzone' -- The command to run in-game to clear an existing temporary greenzone

Config.DebugPoly = false
Config.GreenZones = { -- These are persistent greenzones that exist constantly, at all times - you can create as many as you want here
    ['hospital'] = {
        usePoly = true,
        points = {
            vec3(299.2270, -584.6892, 43.2608),
            vec3(300.2270, -584.6892, 43.2608),
            vec3(300.2270, -585.6892, 43.2608),
            vec3(299.2270, -585.6892, 43.2608)
        },
        coords = vec3(299.2270, -584.6892, 43.2608), -- The center-most location of the greenzone
        radius = 100.0, -- The radius (how large or small) the greenzone is (note: this must include the .0 on the end of the number to work)
        disablePlayerVehicleCollision = true, -- Do you want to disable players & their vehicles collisions between each other? (true if yes, false if no)
        enableVehCollisionFX = false,
        enableSpeedLimits = false, -- Do you want to enforce a speed limit in this zone? (true if yes, false if no)
        setSpeedLimit = 30, -- The speed limit (in MPH) that will be enforced in this zone if enableSpeedLimits is true
        removeWeapons = false, -- Do you want to remove weapons completely from players hands while in this zone? (true if yes, false if no)
        disableFiring = true, -- Do you want to disable everyone from firing weapons/punching/etc in this zone? (true if yes, false if no)
        setInvincible = true, -- Do you want everyone to be invincible in this zone? (true if yes, false if no)
        displayTextUI = true, -- Do you want textUI to display on everyones screen while in this zone? (true if yes, false if no)
        textToDisplay = '**Área** Segura', -- The text to display on everyones screen if displayTextUI is true for this zone
        backgroundColorTextUI = '#72E68F', -- The color of the textUI background to display if displayTextUI is true for this zone
        textColor = '#2C2C2C', -- The color of the text & icon itself on the textUI if displayTextUI is true for this zone
        displayTextPosition = 'bottom-center', -- The position of the textUI if displayTextUI is true for this zone
        displayTextIcon = 'shield', -- The icon to be displayed on the TextUI in this zone if displayTextUI is true
        blip = false, -- Do you want a blip to display on the map here? True for yes, false for no
        blipType = 'radius', -- Type can be 'radius' or 'normal'
        enableSprite = false, -- Do you want a sprite at the center of the radius blip? (If blipType = 'normal', this don't matter, it will display a sprite)
        blipSprite = 621, -- Blip sprite (https://docs.fivem.net/docs/game-references/blips/) (only used if enableSprite = true, otherwise can be ignored)
        blipColor = 2, -- Blip color (https://docs.fivem.net/docs/game-references/blips/#blip-colors)
        blipScale = 0.7, -- Blip size (0.01 to 1.0) (only used if enableSprite = true, otherwise can be ignored)
        blipAlpha = 100, -- The transparency of the radius blip if blipType = 'radius', otherwise not used/can be ignored
        blipName = 'Hospital Greenzone' -- Blip name on the map (if enableSprite = true, otherwise can be ignored)
    },
    -- ['policestation'] = {
    --     usePoly = false,
    --     points = {
    --         vec3(432.7403, -982.1954, 30.7105),
    --         vec3(431.7403, -982.1954, 30.7105),
    --         vec3(431.7403, -983.1954, 30.7105),
    --         vec3(432.7403, -983.1954, 30.7105)
    --     },
    --     coords = vec3(432.7403, -982.1954, 30.7105),
    --     radius = 100.0,
    --     disablePlayerVehicleCollision = false,
    --     enableSpeedLimits = true,
    --     setSpeedLimit = 40,
    --     removeWeapons = false,
    --     disableFiring = true,
    --     setInvincible = false,
    --     displayTextUI = true,
    --     textToDisplay = 'Police Green Zone',
    --     backgroundColorTextUI = '#ff5a47',
    --     textColor = '#000000',
    --     displayTextPosition = 'top-center',
    --     displayTextIcon = 'shield-halved',
    --     blip = false,
    --     blipType = 'radius',
    --     enableSprite = false,
    --     blipSprite = 621,
    --     blipColor = 2,
    --     blipScale = 0.7,
    --     blipAlpha = 100,
    --     blipName = 'LSPD Greenzone'
    -- },
    -- ['examplelocation3'] = {
    --     usePoly = false,
    --     points = {
    --         vec3(-1243.6606, 1348.0383, 212.7915),
    --         vec3(-1244.6606, 1348.0383, 212.7915),
    --         vec3(-1244.6606, 1347.0383, 212.7915),
    --         vec3(-1243.6606, 1347.0383, 212.7915)
    --     },
    --     coords = vec3(-1243.6606, 1348.0383, 212.7915),
    --     radius = 200.0,
    --     disablePlayerVehicleCollision = false,
    --     enableSpeedLimits = false,
    --     setSpeedLimit = 40,
    --     removeWeapons = true,
    --     disableFiring = false,
    --     setInvincible = true,
    --     displayTextUI = true,
    --     textToDisplay = 'Random Green Zone',
    --     backgroundColorTextUI = 'green',
    --     textColor = '#000000',
    --     displayTextPosition = 'top-center',
    --     displayTextIcon = 'box',
    --     blip = true,
    --     blipType = 'radius',
    --     enableSprite = false,
    --     blipSprite = 621,
    --     blipColor = 2,
    --     blipScale = 0.8,
    --     blipAlpha = 100,
    --     blipName = 'Another Greenzone'
    -- }
    -- Create more zones here by following the same format as above
}

Notifications = {
    position = 'center-left', -- The position for all notifications
    greenzoneTitle = 'Green Zone', -- Title when entering a greenzone
    greenzoneIcon = 'shield', -- The icon displayed on the notifications
    greenzoneEnter = 'Você entrou em uma Safezone e certas ações foram desativadas', -- Description when entering a greenzone
    greenzoneExit = 'Você saiu de uma Safezone e todas as ações foram reativadas novamente', -- Description when exiting a greenzone
}