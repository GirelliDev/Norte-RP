Config = {}

Config.UseTarget = true

Config.Locations = {
    -- { -- Bennys do centro
    --     control = vector3(-204.18, -1321.64, 31.29),
    --     vehicle = vector3(-198.85, -1324.42, 31.13),
    --     sprays = {
    --         { pos = vector3(-201.01, -1321.78, 31.13), rotation = vector3(0, 25, -90), scale = 1.2 },
    --         { pos = vector3(-197.49, -1321.78, 31.13), rotation = vector3(0, 25, -90), scale = 1.2 },
    --         { pos = vector3(-195.2, -1324.85, 31.13), rotation = vector3(0, 25, 180), scale = 1.2 },
    --         { pos = vector3(-195.2, -1323.96, 31.13), rotation = vector3(0, 25, 180), scale = 1.2 },
    --         { pos = vector3(-197.52, -1326.85, 31.13), rotation = vector3(0, 25, 90), scale = 1.2 },
    --         { pos = vector3(-201.13, -1326.85, 31.13), rotation = vector3(0, 25, 90), scale = 1.2 },
    --     },
    --     jobs = {'mechanic'}, -- false
    -- },
    { -- LS Custom de cima
        control = vec3(-332.8, -144.77, 39.01),
        vehicle = vec3(-327.85, -144.26, 38.79),
        sprays = {
            { pos = vec3(-328.348, -141.444, 39.513), rotation = vector3(0.000, 25.000, -111.817), scale = 1.2 },
            { pos = vec3(-324.965, -142.688, 39.513), rotation = vector3(0.000, 25.000, -114.508), scale = 1.2 },
            { pos = vec3(-326.736, -147.439, 39.513), rotation = vector3(0.000, 25.000, 70.213), scale = 1.2 },
            { pos = vec3(-328.997, -146.608, 39.513), rotation = vector3(0.000, 25.000, 72.735), scale = 1.2 },
            { pos = vec3(-323.415, -144.996, 39.513), rotation = vector3(1.074, 25.568, 161.155), scale = 1.2 },
            { pos = vec3(-324.044, -146.729, 39.513), rotation = vector3(-0.875, 24.862, 160.072), scale = 1.2 },
        },
        jobs = {'mechanic'}, -- false
    },
}

Config.SprayModel = 'prop_tool_nailgun'