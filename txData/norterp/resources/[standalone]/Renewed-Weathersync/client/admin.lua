-- Weather Admin Management --
local weatherTypes = {
    {
        label = 'Tempestade de neve',
        value = 'BLIZZARD'
    },
    {
        label = 'Limpo',
        value = 'CLEAR'
    },
    {
        label = 'Clareando',
        value = 'CLEARING'
    },
    {
        label = 'Nuvens',
        value = 'CLOUDS'
    },
    {
        label = 'Extra Ensolarado',
        value = 'EXTRASUNNY'
    },
    {
        label = 'Nevoeiro',
        value = 'FOGGY'
    },
    {
        label = 'Neutro',
        value = 'NEUTRAL'
    },
    {
        label = 'Nublado',
        value = 'OVERCAST'
    },
    {
        label = 'Chuva',
        value = 'RAIN'
    },
    {
        label = 'Nevoeiro denso',
        value = 'SMOG'
    },
    {
        label = 'Neve',
        value = 'SNOW'
    },
    {
        label = 'Neve leve',
        value = 'SNOWLIGHT'
    },
    {
        label = 'Trovoada',
        value = 'THUNDER'
    },
    {
        label = 'Natal',
        value = 'XMAS'
    },
}

local function viewWeatherEvent(index, weatherEvent, isQueued)
    local color = GlobalState.UIColors

    local metadata = isQueued and {
        ('Clima %s'):format(weatherEvent.weather),
        ('Durando por %s minutos'):format(weatherEvent.time)
    } or {
        ('Clima %s'):format(weatherEvent.weather),
        ('%s Minutos restantes'):format(weatherEvent.time)
    }
    lib.registerContext({
        id = 'Renewed-Weathersync:client:changeWeather',
        title = 'Gerenciar Clima',
        menu = 'Renewed-Weathersync:client:manageWeather',
        options = {
            {
                title = 'Informações',
                icon = 'fa-solid fa-circle-info',
                readOnly = true,
                metadata = metadata
            },
            {
                title = 'Mudar clima',
                icon = 'fa-solid fa-cloud',
                arrow = true,
                onSelect = function()
                    local input = lib.inputDialog('Alterar o tipo de clima', {
                        {
                            label = 'Selecione o clima',
                            type = 'select',
                            required = true,
                            default = weatherEvent.weather,
                            options = weatherTypes
                        },
                    })

                    if input and input[1] then
                        local weather = lib.callback.await('Renewed-Weathersync:server:setWeatherType', false, index, input[1])

                        if weather then
                            weatherEvent.weather = weather
                        end
                    end

                    viewWeatherEvent(index, weatherEvent)
                end
            },
            {
                title = 'Mudar duração',
                arrow = true,
                icon = 'fa-solid fa-hourglass-half',
                onSelect = function()
                    local input = lib.inputDialog('Mudança de duração', {
                        {
                            label = 'Duração em minutos',
                            type = 'slider',
                            required = true,
                            min = 1,
                            max = 120,
                            default = weatherEvent.time,
                        },
                    })

                    if input and input[1] then
                        local time = lib.callback.await('Renewed-Weathersync:server:setEventTime', false, index, input[1])

                        if time then
                            weatherEvent.time = time
                        end
                    end

                    viewWeatherEvent(index, weatherEvent)
                end
            },
            {
                title = 'Remova o evento climático',
                arrow = true,
                icon = 'fa-solid fa-circle-xmark',
                iconColor = color.danger,
                onSelect = function()
                    TriggerServerEvent('Renewed-Weather:server:removeWeatherEvent', index)
                end
            }
        }
    })

    lib.showContext('Renewed-Weathersync:client:changeWeather')
end

RegisterNetEvent('Renewed-Weather:client:viewWeatherInfo', function(weatherTable)
    local color = GlobalState.UIColors

    local options = {}
    local amt = 0

    local startingIn = 0

    for i = 1, #weatherTable do
        local currentWeather = weatherTable[i]
        amt += 1

        local isQueued = i > 1

        local meatadata = isQueued and {
            ('Começando em %s minutos'):format(startingIn),
            ('Durando por %s minutos'):format(currentWeather.time)
        } or {
            ('%s Minutos restantes'):format(currentWeather.time)
        }
        local weatherLabel
        for i = 1, #weatherTypes do
            if currentWeather.weather == weatherTypes[i].value then
                weatherLabel = weatherTypes[i].label
                break
            end
        end



        options[amt] = {
            title = isQueued and ('Próximo clima: %s'):format(weatherLabel) or ('Clima atual: %s'):format(weatherLabel),
            description = isQueued and ('Começando em %s minutos'):format(startingIn),
            arrow = true,
            icon = isQueued and 'fa-solid fa-cloud-arrow-up' or 'fa-solid fa-cloud',
            metadata = meatadata,
            onSelect = function()
                viewWeatherEvent(i, currentWeather, isQueued)
            end
        }

        startingIn += currentWeather.time
    end


    lib.registerContext({
        id = 'Renewed-Weathersync:client:manageWeather',
        title = 'Gerenciamento',
        description = 'do Clima',
        menu = 'menu_admin',
        options = options
    })

    lib.showContext('Renewed-Weathersync:client:manageWeather')
end)