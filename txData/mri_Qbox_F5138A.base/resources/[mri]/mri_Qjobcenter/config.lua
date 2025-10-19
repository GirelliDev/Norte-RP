Config = {}

Config.Main = {
    useTarget = 'qb', -- 'qb' , 'ox' , or 'lib' target / draw text UI
    Locations = {
        ["jobcenter"] = {
            coords = vector4(-269.19, -956.09, 31.22, 206.34),
            model = "s_m_m_armoured_01",
            blip = { toggle = false, sprite = 407, color = 4, scale = 0.7, label = "Job Center" },
        },
    }
}

Config.Jobs = {
    {
        name = "Reciclagem",
        image = "./img/garbage.jpg",
        rank = "garbage",
        description = "Saiba mais sobre a vaga de trabalho",
        instructions = "Um trabalhador da comunidade, também conhecido como ser humano incrível, é responsável por coletar e descartar os resíduos municipais. Suas tarefas incluem dirigir caminhões de lixo ao longo de rotas designadas, pegar lixeiras ou sacos de lixo e garantir o descarte de resíduos adequado.",
        paidActions = { "Coleta de Resíduos", "Eficiência de Rota", "Manuseio de Resíduos Especializados", "Horas Extras", "Interação com o Público" },
        location = vec3(-313.84, -1522.82, 27.56),
        tags = { "Dirigir", "Salário baixo", "Livre", }
    },
    {
        name = "Taxista",
        image = "./img/taxi.jpg",
        rank = "taxi",
        -- toggleDuty = true, -- coloque se quiser ativar sistema de entrar em serviço
        description = "Saiba mais sobre a vaga de trabalho",
        instructions = "Um motorista de táxi fornece serviços de transporte sob demanda aos passageiros em uma área geográfica específica. As responsabilidades incluem pegar passageiros, navegar com eficiência para destinos e processar tarifas.",
        paidActions = { "Transporte de Passageiros", "Tempo de Espera", "Serviços Adicionais", "Tarifas de Horário de Pico", "Gorjetas" },
        location = vec3(896.22, -177.72, 74.7),
        tags = { "Dirigir", "Salário baixo", "Livre", }
    },
    {
        name = "Caçador",
        image = "./img/hunting.jpg",
        rank = "hunter",
        description = "Saiba mais sobre a vaga de trabalho",
        instructions = "Um caçador é responsável por rastrear e abater animais em áreas designadas para coletar recursos valiosos, como carne e peles. As tarefas incluem usar armas e armadilhas de maneira segura e eficiente, bem como respeitar as regulamentações de caça.",
        paidActions = { "Rastreamento", "Caça", "Despelamento", "Coleta de Recursos", "Venda de Mercadorias" },
        location = vec3(-679.28, 5834.25, 16.33),
        tags = { "Aventura", "Autônomo", "Livre", }
    },
    {
        name = "Mineração",
        image = "./img/mining.jpg",
        rank = "mining",
        description = "Saiba mais sobre a vaga de trabalho",
        instructions = "Um minerador trabalha em locais de mineração para extrair recursos naturais, como minerais e metais. As responsabilidades incluem operar equipamentos de mineração, garantir a segurança no local de trabalho e processar os materiais extraídos.",
        paidActions = { "Extração de Recursos", "Operação de Equipamentos", "Gestão de Segurança", "Processamento de Materiais", "Venda de Recursos" },
        location = vec3(-596.74, 2090.99, 131.41),
        tags = { "Físico", "Salário competitivo", "Livre", }
    },
    {
        name = "Pescador",
        image = "./img/fishing.jpg",
        rank = "fishing",
        description = "Saiba mais sobre a vaga de trabalho",
        instructions = "Um pescador trabalha em corpos d'água para capturar peixes e outros frutos do mar. As responsabilidades incluem operar barcos e equipamentos de pesca, identificar locais de pesca produtivos e processar e vender o pescado.",
        paidActions = { "Pesca", "Operação de Barcos", "Processamento da Captura", "Venda de Recursos", "Manutenção de Equipamentos" },
        location = vec3(-1492.99, -939.66, 10.21),
        tags = { "Ao ar livre", "Salário variável", "Livre", }
    },
    {
        name = "Fazendeiro",
        image = "./img/farming.jpg",
        rank = "farming",
        description = "Saiba mais sobre a vaga de trabalho",
        instructions = "Um fazendeiro é responsável por cultivar e colher produtos agrícolas. As tarefas incluem plantar, irrigar, fertilizar e colher culturas, bem como cuidar de animais de fazenda e vender produtos no mercado.",
        paidActions = { "Plantio", "Colheita", "Cuidado com os Animais", "Venda no Mercado", "Manutenção de Equipamentos" },
        location = vec3(461.93, -696.86, 26.42),
        tags = { "Rural", "Trabalho físico", "Livre", }
    },
    {
        name = "Transportador",
        image = "./img/cargo.jpg",
        rank = "cargo",
        description = "Saiba mais sobre a vaga de trabalho",
        instructions = "Um transportador é responsável por mover mercadorias de um local para outro. As responsabilidades incluem carregar e descarregar cargas, dirigir veículos de transporte, e garantir que as mercadorias cheguem ao destino em boas condições.",
        paidActions = { "Carregamento de Cargas", "Direção de Transporte", "Planejamento de Rotas", "Conclusão de Entrega", "Manuseio de Mercadorias Especiais" },
        location = vec3(-413.96, 6171.53, 30.48),
        tags = { "Motorista", "Dirigir", "Logística", "Livre", }
    },
    {
        name = "Caminhoneiro",
        image = "./img/truckeroil.jpg",
        rank = "truckeroil",
        description = "Saiba mais sobre a vaga de trabalho",
        instructions = "Um caminhoneiro é responsável por manter os estoques de combustível cheios na cidade. As responsabilidades incluem abastecer e reabastecer postos de gasolina, dirigir caminhões, e garantir que o combustível chegue ao destino em boas condições.",
        paidActions = { "Carregamento de Cargas", "Transporte rápido", "Caminhões" },
        location = vec3(1721.87, -1557.67, 112.65),
        tags = { "Motorista", "Dirigir", "Logística", "Livre", }
    },    
    -- {
    --     name = "Motorista de Caminhão",
    --     image = "./img/trucking.png",
    --     rank = "trucker",
    --     description = "Saiba mais sobre a vaga de trabalho",
    --     instructions = "Um caminhoneiro, também conhecido como motorista de caminhão, opera veículos comerciais para transportar mercadorias a longas distâncias, garantindo uma entrega oportuna e segura.",
    --     paidActions = { "Freight Transportation", "Loading and Unloading", "Adherence to Schedule", "Specialized Skills Pay", "Overtime Pay" },
    --     tags = { "Dirigir", "Salário baixo", "Livre", }
    -- },
}

-- Config.Licenses = {
--     {
--         name = "Carteira de identidade",
--         image = "idcard.png",
--         price = 50,
--         item = "id_card",
--         description = "Uma carteira de identidade é necessária para se identificar legalmente.",
--     },
--     {
--         name = "Carteira de motorista",
--         image = "driverslicense.png",
--         price = 500,
--         item = "driver_license",
--         description = "Uma carteira de motorista é obrigada a operar um veículo a motor.",
--     },
--     {
--         name = "Porte de Armas",
--         image = "firearmslicense.png",
--         price = 5000,
--         item = "weaponlicense",
--         description = "O porte de armas, necessário possuir um para poder legalizar sua arma.",
--     },
-- }

Config.tagColors = {
    "bg-emerald-400",
    "bg-cyan-400",
    "bg-orange-400"
}