Config = Config or {}

Config.UsingPsHousing = false
Config.UsingDefaultQBApartments = true
Config.OnlyShowOnDuty = true

-- RECOMMENDED Fivemerr Images. DOES NOT EXPIRE. 
-- YOU NEED TO SET THIS UP FOLLOW INSTRUCTIONS BELOW.
-- Documents: https://docs.fivemerr.com/integrations/mdt-scripts/ps-mdt
Config.FivemerrMugShot = false

-- Discord webhook for images. NOT RECOMMENDED, IMAGES EXPIRE.
Config.MugShotWebhook = true
Config.UseCQCMugshot = false

-- Frontal, Traseiro. Use 4 para ambos os lados, recomendamos deixar como 1 para o padrão.
Config.MugPhotos = 1

-- Se definido como verdadeiro = A fine é automaticamente removida do banco, cobrando automaticamente o jogador.
-- Se definido como falso = A fine é enviada como uma fatura para o telefone do jogador, sendo responsabilidade do jogador pagá-la, podendo permanecer não paga e ignorada.
Config.BillVariation = true

-- Se definido como falso (padrão) = O valor da fine é apenas retirado da conta bancária do jogador.
-- Se definido como verdadeiro = O valor da fine é adicionado à conta da sociedade após ser retirado da conta bancária do jogador.
Config.QBBankingUse = false

-- Configura sua inventário para recuperar automaticamente imagens quando uma arma é registrada em uma loja de armas ou autoregistrada.
-- Se estiver utilizando a versão mais recente do lj-inventory do GitHub, nenhuma modificação adicional é necessária.
-- No entanto, se estiver utilizando um sistema de inventário diferente, por favor, consulte a seção "Edição de Inventário | Adição Automática de Armas com Imagens" no README do ps-mdt.
Config.InventoryForWeaponsImages = "ox_inventory"

-- Only compatible with ox_inventory
Config.RegisterWeaponsAutomatically = true

-- Set to true to register all weapons that are added via AddItem in ox_inventory
Config.RegisterCreatedWeapons = true

-- "LegacyFuel", "lj-fuel", "ps-fuel"
Config.Fuel = "cdn-fuel"

-- Google Docs Link
Config.sopLink = {
    ['police'] = '',
    ['ambulance'] = '',
    ['bcso'] = '',
    ['doj'] = '',
    ['sast'] = '',
    ['sasp'] = '',
    ['doc'] = '',
    ['lssd'] = '',
    ['sapr'] = '',
}

-- Google Docs Link
Config.RosterLink = {
    ['police'] = '',
    ['ambulance'] = '',
    ['bcso'] = '',
    ['doj'] = '',
    ['sast'] = '',
    ['sasp'] = '',
    ['doc'] = '',
    ['lssd'] = '',
    ['sapr'] = '',	
}

Config.PoliceJobs = {
    ['police'] = true,
    ['lspd'] = true,
    ['bcso'] = true,
    ['sast'] = true,
    ['sasp'] = true,
    ['doc'] = true,
    ['lssd'] = true,
    ['sapr'] = true,
    ['pa'] = true
}

Config.AmbulanceJobs = {
    ['ambulance'] = true,
    ['fire'] = true
}

Config.DojJobs = {
    ['lawyer'] = true,
    ['judge'] = true
}

-- Esta é uma solução alternativa porque o qb-menu presente no qb-policejob preenche uma localização de depósito e a envia para o evento.
-- Se as localizações de depósito forem modificadas no qb-policejob, as alterações também devem ser implementadas aqui para garantir consistência.

Config.ImpoundLocations = {
    [1] = vector4(436.68, -1007.42, 27.32, 180.0),
    [2] = vector4(-436.14, 5982.63, 31.34, 136.0),
}

-- suporteee for Wraith ARS 2X. 

Config.UseWolfknightRadar = false
Config.WolfknightNotifyTime = 5000 -- Por quanto tempo a notificação é exibida em milissegundos (30000 = 30 segundos)
Config.PlateScanForDriversLicense = false -- Se verdadeiro, o scanner de placa verificará se o proprietário do veículo escaneado possui uma carteira de motorista.s

-- IMPORTANTE: Para evitar fazer consultas excessivas ao banco de dados, modifique esta configuração para 'true' 'CONFIG.use_sonorancad = true' no arquivo de configuração localizado em 'wk_wars2x/config.lua'.
-- Habilitar esta configuração limitará as verificações de placa apenas aos veículos que foram utilizados por um jogador.

Config.LogPerms = {
	['ambulance'] = {
		[4] = true,
	},
	['police'] = {
		[4] = true,
	},
    ['bcso'] = {
		[4] = true,
	},
    ['sast'] = {
		[4] = true,
	},
    ['sasp'] = {
		[4] = true,
	},
    ['sapr'] = {
		[4] = true,
	},
    ['doc'] = {
		[4] = true,
	},
    ['lssd'] = {
		[4] = true,
	},
}

Config.RemoveIncidentPerms = {
	['ambulance'] = {
		[4] = true,
	},
	['police'] = {
		[4] = true,
	},
    ['bcso'] = {
		[4] = true,
	},
    ['sast'] = {
		[4] = true,
	},
    ['sasp'] = {
		[4] = true,
	},
    ['sapr'] = {
		[4] = true,
	},
    ['doc'] = {
		[4] = true,
	},
    ['lssd'] = {
		[4] = true,
	},
}

Config.RemoveReportPerms = {
	['ambulance'] = {
		[4] = true,
	},
	['police'] = {
		[4] = true,
	},
    ['bcso'] = {
		[4] = true,
	},
    ['sast'] = {
		[4] = true,
	},
    ['sasp'] = {
		[4] = true,
	},
    ['sapr'] = {
		[4] = true,
	},
    ['doc'] = {
		[4] = true,
	},
    ['lssd'] = {
		[4] = true,
	},
}

Config.RemoveWeaponsPerms = {
	['ambulance'] = {
		[4] = true,
	},
	['police'] = {
		[4] = true,
	},
    ['bcso'] = {
		[4] = true,
	},
    ['sast'] = {
		[4] = true,
	},
    ['sasp'] = {
		[4] = true,
	},
    ['sapr'] = {
		[4] = true,
	},
    ['doc'] = {
		[4] = true,
	},
    ['lssd'] = {
		[4] = true,
	},
}

Config.PenalCodeTitles = {
    [1] = 'DELITOS CONTRA PESSOAS',
    [2] = 'DELITOS ENVOLVENDO ROUBO',
    [3] = 'DELITOS ENVOLVENDO FRAUDE',
    [4] = 'DELITOS ENVOLVENDO DANOS À PROPRIEDADE',
    [5] = 'DELITOS CONTRA A ADMINISTRAÇÃO PÚBLICA',
    [6] = 'DELITOS CONTRA A ORDEM PÚBLICA',
    [7] = 'DELITOS CONTRA A SAÚDE E OS BONS COSTUMES',
    [8] = 'DELITOS CONTRA A SEGURANÇA PÚBLICA',
    [9] = 'DELITOS ENVOLVENDO A OPERAÇÃO DE UM VEÍCULO',
    [10] = 'DELITOS ENVOLVENDO O BEM-ESTAR DA VIDA SELVAGEM',
}

Config.PenalCode = {
    [1] = {
        [1] = {title = 'Agressão Simples', class = 'Misdemeanor', id = 'P.C. 1001', months = 7, fine = 500, color = 'green', description = 'Quando uma pessoa causa intencionalmente ou conscientemente contato físico com outra (sem arma)'},
        [2] = {title = 'Agressão', class = 'Misdemeanor', id = 'P.C. 1002', months = 15, fine = 850, color = 'orange', description = 'Se uma pessoa causa intencionalmente ou conscientemente ferimentos a outra (sem arma)'},
        [3] = {title = 'Agressão Agravada', class = 'Felony', id = 'P.C. 1003', months = 20, fine = 1250, color = 'orange', description = 'Quando uma pessoa causa ferimentos colorporais a outra de forma não intencional e imprudente durante uma confrontação E causa ferimentos colorporais'},
        [4] = {title = 'Agressão com Arma Mortal', class = 'Felony', id = 'P.C. 1004', months = 30, fine = 3750, color = 'red', description = 'Quando uma pessoa causa intencionalmente, conscientemente ou imprudentemente ferimentos colorporais a outra pessoa E causa ferimentos colorporais graves ou utiliza ou exibe uma arma mortal'},
        [5] = {title = 'Homicídio Involuntário', class = 'Felony', id = 'P.C. 1005', months = 60, fine = 7500, color = 'red', description = 'Quando uma pessoa causa a morte de outra de forma não intencional e imprudente'},
        [6] = {title = 'Homicídio Veicular', class = 'Felony', id = 'P.C. 1006', months = 75, fine = 7500, color = 'red', description = 'Quando uma pessoa causa a morte de outra de forma não intencional e imprudente com um veículo'},
        [7] = {title = 'Tentativa de Assassinato de um Civil', class = 'Felony', id = 'P.C. 1007', months = 50, fine = 7500, color = 'red', description = 'Quando uma pessoa não governamental ataca intencionalmente outra com a intenção de matar'},
        [8] = {title = 'Assassinato de Segundo Grau', class = 'Felony', id = 'P.C. 1008', months = 100, fine = 15000, color = 'red', description = 'Qualquer assassinato intencional que não seja premeditado ou planejado. Uma situação em que o assassino pretende apenas infligir ferimentos colorporais graves.'},
        [9] = {title = 'Cúmplice de Assassinato de Segundo Grau', class = 'Felony', id = 'P.C. 1009', months = 50, fine = 5000, color = 'red', description = 'Estar presente e/ou participar do ato de cobrança dos pais'},
        [10] = {title = 'Assassinato de Primeiro Grau', class = 'Felony', id = 'P.C. 1010', months = 0, fine = 0, color = 'red', description = 'Qualquer assassinato intencional que seja premeditado e com malícia.'},
        [11] = {title = 'Cúmplice de Assassinato de Primeiro Grau', class = 'Felony', id = 'P.C. 1011', months = 0, fine = 0, color = 'red', description = 'Estar presente e/ou participar do ato de cobrança dos pais'},
        [12] = {title = 'Assassinato de um Funcionário Público ou Policial', class = 'Felony', id = 'P.C. 1012', months = 0, fine = 0, color = 'red', description = 'Qualquer assassinato intencional realizado a um funcionário do governo'},
        [13] = {title = 'Tentativa de Assassinato de um Funcionário Público ou Policial', class = 'Felony', id = 'P.C. 1013', months = 65, fine = 10000, color = 'red', description = 'Ataques feitos a um funcionário do governo com a intenção de causar morte'},
        [14] = {title = 'Cúmplice do Assassinato de um Funcionário Público ou Policial', class = 'Felony', id = 'P.C. 1014', months = 0, fine = 0, color = 'red', description = 'Estar presente e/ou participar do ato de cobrança dos pais'},
        [15] = {title = 'Prisão Ilegal', class = 'Misdemeanor', id = 'P.C. 1015', months = 10, fine = 600, color = 'green', description = 'O ato de levar outra pessoa contra sua vontade e mantê-la por um longo período de tempo'},
        [16] = {title = 'Sequestro', class = 'Felony', id = 'P.C. 1016', months = 15, fine = 900, color = 'orange', description = 'O ato de levar outra pessoa contra sua vontade por um curto período de tempo'},
        [17] = {title = 'Cúmplice de Sequestro', class = 'Felony', id = 'P.C. 1017', months = 7, fine = 450, color = 'orange', description = 'Estar presente e/ou participar do ato de cobrança dos pais'},
        [18] = {title = 'Tentativa de Sequestro', class = 'Felony', id = 'P.C. 1018', months = 10, fine = 450, color = 'orange', description = 'O ato de tentar levar alguém contra sua vontade'},
        [19] = {title = 'Toma de Refém', class = 'Felony', id = 'P.C. 1019', months = 20, fine = 1200, color = 'orange', description = 'O ato de levar outra pessoa contra sua vontade por ganho pessoal'},
        [20] = {title = 'Cúmplice de Toma de Refém', class = 'Felony', id = 'P.C. 1020', months = 10, fine = 600, color = 'orange', description = 'Estar presente e/ou participar do ato de tomada de refém'},
        [21] = {title = 'Prisão Ilegal de um Funcionário Público ou Policial', class = 'Felony', id = 'P.C. 1021', months = 25, fine = 4000, color = 'orange', description = 'O ato de levar um funcionário do governo contra sua vontade por um período prolongado de tempo'},
        [22] = {title = 'Ameaças Criminosas', class = 'Misdemeanor', id = 'P.C. 1022', months = 5, fine = 500, color = 'orange', description = 'O ato de declarar a intenção de cometer um crime contra outro'},
        [23] = {title = 'Pôr em Perigo por Negligência', class = 'Misdemeanor', id = 'P.C. 1023', months = 10, fine = 1000, color = 'orange', description = 'O ato de ignorar a segurança de outra pessoa que pode colocar outra pessoa em perigo de morte ou lesão colorporal'},
        [24] = {title = 'Tiroteio Relacionado a Gangue', class = 'Felony', id = 'P.C. 1024', months = 30, fine = 2500, color = 'red', description = 'O ato em que uma arma de fogo é disparada em relação à atividade de gangue'},
        [25] = {title = 'Canibalismo', class = 'Felony', id = 'P.C. 1025', months = 0, fine = 0, color = 'red', description = 'O ato em que uma pessoa consome a carne de outra voluntariamente'},
        [26] = {title = 'Tortura', class = 'Felony', id = 'P.C. 1026', months = 40, fine = 4500, color = 'red', description = 'O ato de causar dano a outra pessoa para extrair informações e/ou por prazer pessoal'},
    },
    [2] = {

        [1] = {title = 'Roubo Pequeno', class = 'Infraction', id = 'P.C. 2001', months = 0, fine = 250, color = 'green', description = 'O roubo de propriedade abaixo do valor de $50'},
        [2] = {title = 'Grande Roubo', class = 'Misdemeanor', id = 'P.C. 2002', months = 10, fine = 600, color = 'green', description = 'Roubo de propriedade acima de $700'},
        [3] = {title = 'Roubo de Automóveis A', class = 'Felony', id = 'P.C. 2003', months = 15, fine = 900, color = 'green', description = 'O ato de roubar um veículo que pertence a outra pessoa sem permissão'},
        [4] = {title = 'Roubo de Automóveis B', class = 'Felony', id = 'P.C. 2004', months = 35, fine = 3500, color = 'green', description = 'O ato de roubar um veículo que pertence a outra pessoa sem permissão enquanto armado'},
        [5] = {title = 'Carjacking', class = 'Felony', id = 'P.C. 2005', months = 30, fine = 2000, color = 'orange', description = 'O ato de alguém tomar à força um veículo de seus ocupantes'},
        [6] = {title = 'Roubo Qualificado', class = 'Misdemeanor', id = 'P.C. 2006', months = 10, fine = 500, color = 'green', description = 'O ato de entrar em um prédio ilegalmente com a intenção de cometer um crime, especialmente roubo.'},
        [7] = {title = 'Assalto', class = 'Felony', id = 'P.C. 2007', months = 25, fine = 2000, color = 'green', description = 'A ação de tomar propriedade ilegalmente de uma pessoa ou local por meio de força ou ameaça de força.'},
        [8] = {title = 'Cumplicidade em Assalto', class = 'Felony', id = 'P.C. 2008', months = 12, fine = 1000, color = 'green', description = 'Estar presente e/ou participar do ato de acusação principal'},
        [9] = {title = 'Tentativa de Assalto', class = 'Felony', id = 'P.C. 2009', months = 20, fine = 1000, color = 'green', description = 'A ação de tentar tomar propriedade ilegalmente de uma pessoa ou local por meio de força ou ameaça de força.'},
        [10] = {title = 'Assalto Armado', class = 'Felony', id = 'P.C. 2010', months = 30, fine = 3000, color = 'orange', description = 'A ação de tomar propriedade ilegalmente de uma pessoa ou local por meio de força ou ameaça de força enquanto armado.'},
        [11] = {title = 'Cumplicidade em Assalto Armado', class = 'Felony', id = 'P.C. 2011', months = 15, fine = 1500, color = 'orange', description = 'Estar presente e/ou participar do ato de acusação principal'},
        [12] = {title = 'Tentativa de Assalto Armado', class = 'Felony', id = 'P.C. 2012', months = 25, fine = 1500, color = 'orange', description = 'A ação de tentar tomar propriedade ilegalmente de uma pessoa ou local por meio de força ou ameaça de força enquanto armado.'},
        [13] = {title = 'Grande Furto', class = 'Felony', id = 'P.C. 2013', months = 45, fine = 7500, color = 'orange', description = 'Roubo de propriedade pessoal acima de um valor especificado legalmente.'},
        [14] = {title = 'Partida sem Pagar', class = 'Infraction', id = 'P.C. 2014', months = 0, fine = 500, color = 'green', description = 'O ato de sair de um estabelecimento sem pagar pelo serviço prestado'},
        [15] = {title = 'Posse de Moeda Não Legal', class = 'Misdemeanor', id = 'P.C. 2015', months = 10, fine = 750, color = 'green', description = 'Estar em posse de moeda roubada'},
        [16] = {title = 'Posse de Itens Emitidos pelo Governo', class = 'Misdemeanor', id = 'P.C. 2016', months = 15, fine = 1000, color = 'green', description = 'Estar em posse de itens adquiríveis apenas por funcionários do governo'},
        [17] = {title = 'Posse de Itens Usados na Comissão de um Crime', class = 'Misdemeanor', id = 'P.C. 2017', months = 10, fine = 500, color = 'green', description = 'Estar em posse de itens que foram anteriormente usados para cometer crimes'},
        [18] = {title = 'Venda de Itens Usados na Comissão de um Crime', class = 'Felony', id = 'P.C. 2018', months = 15, fine = 1000, color = 'orange', description = 'O ato de vender itens que foram anteriormente usados para cometer crimes'},
        [19] = {title = 'Roubo de uma Aeronave', class = 'Felony', id = 'P.C. 2019', months = 20, fine = 1000, color = 'green', description = 'O ato de roubar uma aeronave'},
    },
    [3] = {
        [1] = {title = 'Falsificação de Identidade', class = 'Misdemeanor', id = 'P.C. 3001', months = 15, fine = 1250, color = 'green', description = 'A ação de se identificar falsamente como outra pessoa para enganar'},
        [2] = {title = 'Falsificação de Policial ou Servidor Público', class = 'Felony', id = 'P.C. 3002', months = 25, fine = 2750, color = 'green', description = 'A ação de se identificar falsamente como um funcionário do governo para enganar'},
        [3] = {title = 'Falsificação de Juiz', class = 'Felony', id = 'P.C. 3003', months = 0, fine = 0, color = 'green', description = 'A ação de se identificar falsamente como um juiz para enganar'},
        [4] = {title = 'Posse de Identificação Roubada', class = 'Misdemeanor', id = 'P.C. 3004', months = 10, fine = 750, color = 'green', description = 'Ter a identificação de outra pessoa sem consentimento'},
        [5] = {title = 'Posse de Identificação Governamental Roubada', class = 'Misdemeanor', id = 'P.C. 3005', months = 20, fine = 2000, color = 'green', description = 'Ter a identificação de um funcionário do governo sem consentimento'},
        [6] = {title = 'Extorsão', class = 'Felony', id = 'P.C. 3006', months = 20, fine = 900, color = 'orange', description = 'Ameaçar ou causar danos a uma pessoa ou propriedade em troca de ganho financeiro'},
        [7] = {title = 'Fraude', class = 'Misdemeanor', id = 'P.C. 3007', months = 10, fine = 450, color = 'green', description = 'Enganar outra pessoa para obter ganho financeiro'},
        [8] = {title = 'Falsificação', class = 'Misdemeanor', id = 'P.C. 3008', months = 15, fine = 750, color = 'green', description = 'Falsificar documentos legais para ganho pessoal'},
        [9] = {title = 'Lavagem de Dinheiro', class = 'Felony', id = 'P.C. 3009', months = 0, fine = 0, color = 'red', description = 'Processar dinheiro roubado para moeda legal'},
    },
    [4] = {
        [1] = {title = 'Invasão de Propriedade', class = 'Misdemeanor', id = 'P.C. 4001', months = 10, fine = 450, color = 'green', description = 'Para uma pessoa estar dentro dos limites de uma localização da qual não estão legalmente autorizados'},
        [2] = {title = 'Invasão de Propriedade como Crime', class = 'Felony', id = 'P.C. 4002', months = 15, fine = 1500, color = 'green', description = 'Para uma pessoa ter repetidamente entrado nos limites de uma localização da qual sabidamente não estão legalmente autorizados'},
        [3] = {title = 'Incêndio Criminoso', class = 'Felony', id = 'P.C. 4003', months = 15, fine = 1500, color = 'orange', description = 'O uso de fogo e acelerantes para de forma intencional e maliciosa destruir, danificar ou causar a morte de uma pessoa ou propriedade'},
        [4] = {title = 'Vandalismo', class = 'Infração', id = 'P.C. 4004', months = 0, fine = 300, color = 'green', description = 'A destruição voluntária de propriedade'},
        [5] = {title = 'Vandalismo de Propriedade Governamental', class = 'Felony', id = 'P.C. 4005', months = 20, fine = 1500, color = 'green', description = 'A destruição voluntária de propriedade governamental'},
        [6] = {title = 'Lixo', class = 'Infraction', id = 'P.C. 4006', months = 0, fine = 200, color = 'green', description = 'O descarte intencional de resíduos em local aberto e não designado para isso'},
    },
    [5] = {
        [1] = {title = 'Suborno de Funcionário Público', class = 'Felony', id = 'P.C. 5001', months = 20, fine = 3500, color = 'green', description = 'o uso de dinheiro, favores e/ou propriedade para ganhar favor com um funcionário público'},
        [2] = {title = 'Lei Anti-Máscara', class = 'Infraction', id = 'P.C. 5002', months = 0, fine = 750, color = 'green', description = 'Usar máscara em uma zona proibida'},
        [3] = {title = 'Posse de Contrabando em Instalação Governamental', class = 'Felony', id = 'P.C. 5003', months = 25, fine = 1000, color = 'green', description = 'Estar na posse de itens ilegais enquanto dentro de um prédio governamental'},
        [4] = {title = 'Posse Criminal de Propriedade Roubada', class = 'Misdemeanor', id = 'P.C. 5004', months = 10, fine = 500, color = 'green', description = 'Estar na posse de itens roubados, conscientemente ou não'},
        [5] = {title = 'Evasão', class = 'Felony', id = 'P.C. 5005', months = 10, fine = 450, color = 'green', description = 'A ação de sair intencional e conscientemente da custódia enquanto legalmente sendo preso, detido ou na cadeia'},
        [6] = {title = 'Fuga de Prisão', class = 'Felony', id = 'P.C. 5006', months = 30, fine = 2500, color = 'orange', description = 'A ação de sair da custódia estadual de uma instalação de detenção estadual ou do condado'},
        [7] = {title = 'Cumplicidade na Fuga de Prisão', class = 'Felony', id = 'P.C. 5007', months = 25, fine = 2000, color = 'orange', description = 'Estar presente e/ou participar do ato de acusação principal'},
        [8] = {title = 'Tentativa de Fuga de Prisão', class = 'Felony', id = 'P.C. 5008', months = 20, fine = 1500, color = 'orange', description = 'A tentativa intencional e consciente de escapar de uma instalação de detenção estadual ou do condado'},
        [9] = {title = 'Falsidade Ideológica', class = 'Felony', id = 'P.C. 5009', months = 0, fine = 0, color = 'green', description = 'A ação de declarar falsidades enquanto legalmente obrigado a falar a verdade'},
        [10] = {title = 'Violação de Ordem de Restrição', class = 'Felony', id = 'P.C. 5010', months = 20, fine = 2250, color = 'green', description = 'A violação intencional e consciente da documentação protetora ordenada pelo tribunal'},
        [11] = {title = 'Desvio de Verbas', class = 'Felony', id = 'P.C. 5011', months = 45, fine = 10000, color = 'green', description = 'A transferência intencional e consciente de fundos de contas bancárias não pessoais para contas bancárias pessoais para ganho pessoal'},
        [12] = {title = 'Prática Ilegal', class = 'Felony', id = 'P.C. 5012', months = 15, fine = 1500, color = 'orange', description = 'A ação de realizar um serviço sem licenciamento legal e aprovação adequados'},
        [13] = {title = 'Uso Indevido de Sistemas de Emergência', class = 'Infraction', id = 'P.C. 5013', months = 0, fine = 600, color = 'orange', description = 'Uso de equipamentos de emergência governamentais para finalidades não previstas'},
        [14] = {title = 'Conspiração', class = 'Misdemeanor', id = 'P.C. 5014', months = 10, fine = 450, color = 'green', description = 'A ação de planejar um crime mas ainda não cometê-lo'},
        [15] = {title = 'Violação de Ordem Judicial', class = 'Misdemeanor', id = 'P.C. 5015', months = 0, fine = 0, color = 'orange', description = 'A infringência da documentação ordenada pelo tribunal'},
        [16] = {title = 'Falta de Comparecimento', class = 'Misdemeanor', id = 'P.C. 5016', months = 0, fine = 0, color = 'orange', description = 'Quando alguém legalmente obrigado a comparecer em tribunal não o faz'},
        [17] = {title = 'Desacato ao Tribunal', class = 'Felony', id = 'P.C. 5017', months = 0, fine = 0, color = 'orange', description = 'A interrupção dos procedimentos judiciais em uma sala de tribunal enquanto está em sessão (decisão judicial)'},
        [18] = {title = 'Resistência à Prisão', class = 'Misdemeanor', id = 'P.C. 5018', months = 5, fine = 300, color = 'orange', description = 'O ato de não permitir que os agentes da paz o prendam voluntariamente'},
    },
    [6] = {
        [1] = {title = 'Desobediência a um Agente da Paz', class = 'infraction', id = 'P.C. 6001', months = 0, fine = 750, color = 'green', description = 'O desrespeito intencional a uma ordem legal'},
        [2] = {title = 'Conduta Desordeira', class = 'infraction', id = 'P.C. 6002', months = 0, fine = 250, color = 'green', description = 'Agir de maneira que cria uma condição perigosa ou fisicamente ofensiva por qualquer ato que não serve a um propósito legítimo do ator.'},
        [3] = {title = 'Perturbação da Ordem Pública', class = 'infraction', id = 'P.C. 6003', months = 0, fine = 350, color = 'green', description = 'Ação de uma maneira que causa agitação e perturba a ordem pública'},
        [4] = {title = 'Denúncia Falsa', class = 'Misdemeanor', id = 'P.C. 6004', months = 10, fine = 750, color = 'green', description = 'O ato de denunciar um crime que não ocorreu'},
        [5] = {title = 'Assédio', class = 'Misdemeanor', id = 'P.C. 6005', months = 10, fine = 500, color = 'orange', description = 'A interrupção repetida ou ataques verbais a outra pessoa'},
        [6] = {title = 'Obstrução da Justiça (Contravenção)', class = 'Misdemeanor', id = 'P.C. 6006', months = 10, fine = 500, color = 'green', description = 'Agir de forma que dificulta o processo de Justiça ou investigações legais'},
        [7] = {title = 'Obstrução da Justiça (Crime)', class = 'Felony', id = 'P.C. 6007', months = 15, fine = 900, color = 'green', description = 'Agir de forma que dificulta o processo de Justiça ou investigações legais enquanto usa violência'},
        [8] = {title = 'Incitação à Tumulto', class = 'Felony', id = 'P.C. 6008', months = 25, fine = 1000, color = 'orange', description = 'Causar agitação civil de maneira a incitar um grupo a causar danos a pessoas ou propriedades'},
        [9] = {title = 'Vadiagem em Propriedades do Governo', class = 'infraction', id = 'P.C. 6009', months = 0, fine = 500, color = 'green', description = 'Quando alguém está presente em uma propriedade governamental por um período prolongado'},
        [10] = {title = 'Manipulação de Provas', class = 'Misdemeanor', id = 'P.C. 6010', months = 10, fine = 500, color = 'green', description = 'Quando alguém intencionalmente e indiretamente interfere em pontos-chave de uma investigação legal'},
        [11] = {title = 'Manipulação de Veículo', class = 'Misdemeanor', id = 'P.C. 6011', months = 15, fine = 750, color = 'green', description = 'A interferência intencional e consciente na função normal de um veículo'},
        [12] = {title = 'Manipulação de Evidências', class = 'Felony', id = 'P.C. 6012', months = 20, fine = 1000, color = 'green', description = 'A interferência intencional e consciente com evidências de uma investigação legal'},
        [13] = {title = 'Intimidação de Testemunhas', class = 'Felony', id = 'P.C. 6013', months = 0, fine = 0, color = 'green', description = 'O treinamento ou coação intencional e consciente de uma testemunha em uma investigação legal'},
        [14] = {title = 'Falha em Apresentar Identificação', class = 'Misdemeanor', id = 'P.C. 6014', months = 15, fine = 1500, color = 'green', description = 'O ato de não apresentar identificação quando legalmente exigido'},
        [15] = {title = 'Vigilantismo', class = 'Felony', id = 'P.C. 6015', months = 30, fine = 1500, color = 'orange', description = 'O ato de se envolver na aplicação da lei com autoridade legal para fazê-lo'},
        [16] = {title = 'Aglomeração Ilegal', class = 'Misdemeanor', id = 'P.C. 6016', months = 10, fine = 750, color = 'orange', description = 'Quando um grande grupo se reúne em um local que requer aprovação prévia para fazê-lo'},
        [17] = {title = 'Corrupção Governamental', class = 'Felony', id = 'P.C. 6017', months = 0, fine = 0, color = 'red', description = 'O ato de usar posição política e poder para ganho próprio'},
        [18] = {title = 'Perseguição', class = 'Felony', id = 'P.C. 6018', months = 40, fine = 1500, color = 'orange', description = 'Quando uma pessoa monitora outra sem o consentimento dela'},
        [19] = {title = 'Auxílio e Cumplicidade', class = 'Misdemeanor', id = 'P.C. 6019', months = 15, fine = 450, color = 'orange', description = 'Assistir alguém a cometer ou encorajar alguém a cometer um crime'},
        [20] = {title = 'Abrigo a um Fugitivo', class = 'Misdemeanor', id = 'P.C. 6020', months = 10, fine = 1000, color = 'green', description = 'Quando alguém esconde voluntariamente outra pessoa que é procurada pelas autoridades'},
    },
    [7] = {
        [1] = {title = 'Posse de Maconha Contravenção', class = 'Misdemeanor', id = 'P.C. 7001', months = 5, fine = 250, color = 'green', description = 'A posse de uma quantidade de maconha inferior a 4 baseados'},
        [2] = {title = 'Fabricação de Maconha Crime', class = 'Felony', id = 'P.C. 7002', months = 15, fine = 1000, color = 'red', description = 'A posse de uma quantidade de maconha proveniente da fabricação'},
        [3] = {title = 'Cultivo de Maconha A Contravenção', class = 'Misdemeanor', id = 'P.C. 7003', months = 10, fine = 750, color = 'green', description = 'A posse de 4 ou menos plantas de maconha'},
        [4] = {title = 'Cultivo de Maconha B Crime', class = 'Felony', id = 'P.C. 7004', months = 30, fine = 1500, color = 'orange', description = 'A posse de 5 ou mais plantas de maconha'},
        [5] = {title = 'Posse de Maconha com Intenção de Distribuir Crime', class = 'Felony', id = 'P.C. 7005', months = 30, fine = 3000, color = 'orange', description = 'A posse de uma quantidade de maconha para distribuição'},
        [6] = {title = 'Posse de Cocaína Contravenção', class = 'Misdemeanor', id = 'P.C. 7006', months = 7, fine = 500, color = 'green', description = 'A posse de cocaína em pequena quantidade geralmente para uso pessoal'},
        [7] = {title = 'Fabricação de Cocaína Crime', class = 'Felony', id = 'P.C. 7007', months = 25, fine = 1500, color = 'red', description = 'A posse de uma quantidade de cocaína proveniente da fabricação'},
        [8] = {title = 'Posse de Cocaína com Intenção de Distribuir Crime', class = 'Felony', id = 'P.C. 7008', months = 35, fine = 4500, color = 'orange', description = 'A posse de uma quantidade de cocaína para distribuição'},
        [9] = {title = 'Posse de Metanfetamina Contravenção', class = 'Misdemeanor', id = 'P.C. 7009', months = 7, fine = 500, color = 'green', description = 'A posse de metanfetamina em pequena quantidade geralmente para uso pessoal'},
        [10] = {title = 'Fabricação de Metanfetamina Crime', class = 'Felony', id = 'P.C. 7010', months = 25, fine = 1500, color = 'red', description = 'A posse de uma quantidade de metanfetamina proveniente da fabricação'},
        [11] = {title = 'Posse de Metanfetamina com Intenção de Distribuir Crime', class = 'Felony', id = 'P.C. 7011', months = 35, fine = 4500, color = 'orange', description = 'A posse de uma quantidade de metanfetamina para distribuição'},
        [12] = {title = 'Posse de Oxy / Vicodin Contravenção', class = 'Misdemeanor', id = 'P.C. 7012', months = 7, fine = 500, color = 'green', description = 'A posse de oxy / vicodin em pequena quantidade geralmente para uso pessoal sem receita médica'},
        [13] = {title = 'Fabricação de Oxy / Vicodin Crime', class = 'Felony', id = 'P.C. 7013', months = 25, fine = 1500, color = 'red', description = 'A posse de uma quantidade de oxy / vicodin proveniente da fabricação'},
        [14] = {title = 'Posse de Oxy / Vicodin com Intenção de Distribuir Crime', class = 'Felony', id = 'P.C. 7014', months = 35, fine = 4500, color = 'orange', description = 'A posse de uma quantidade de oxy / vicodin para distribuição'},
        [15] = {title = 'Posse de Ecstasy Contravenção', class = 'Misdemeanor', id = 'P.C. 7015', months = 7, fine = 500, color = 'green', description = 'A posse de ecstasy em pequena quantidade geralmente para uso pessoal'},
        [16] = {title = 'Fabricação de Ecstasy Crime', class = 'Felony', id = 'P.C. 7016', months = 25, fine = 1500, color = 'red', description = 'A posse de uma quantidade de ecstasy proveniente da fabricação'},
        [17] = {title = 'Posse de Ecstasy com Intenção de Distribuir Crime', class = 'Felony', id = 'P.C. 7017', months = 35, fine = 4500, color = 'orange', description = 'A posse de uma quantidade de ecstasy para distribuição'},
        [18] = {title = 'Posse de Ópio Contravenção', class = 'Misdemeanor', id = 'P.C. 7018', months = 7, fine = 500, color = 'green', description = 'A posse de ópio em pequena quantidade geralmente para uso pessoal'},
        [19] = {title = 'Fabricação de Ópio Crime', class = 'Felony', id = 'P.C. 7019', months = 25, fine = 1500, color = 'red', description = 'A posse de uma quantidade de ópio proveniente da fabricação'},
        [20] = {title = 'Posse de Ópio com Intenção de Distribuir Crime', class = 'Felony', id = 'P.C. 7020', months = 35, fine = 4500, color = 'orange', description = 'A posse de uma quantidade de ópio para distribuição'},
        [21] = {title = 'Posse de Adderall Contravenção', class = 'Misdemeanor', id = 'P.C. 7021', months = 7, fine = 500, color = 'green', description = 'A posse de adderall em pequena quantidade geralmente para uso pessoal sem receita médica'},
        [22] = {title = 'Posse de Adderall com Intenção de Distribuir', class = 'Felony', id = 'P.C. 7022', months = 25, fine = 1500, color = 'red', description = 'A posse de uma quantidade de adderall proveniente de fabricação'},
        [23] = {title = 'Posse de Adderall com Intenção de Distribuir', class = 'Felony', id = 'P.C. 7023', months = 35, fine = 4500, color = 'orange', description = 'A posse de uma quantidade de Adderall para distribuição'},
        [24] = {title = 'Posse de Xanax como Contravenção', class = 'Misdemeanor', id = 'P.C. 7024', months = 7, fine = 500, color = 'green', description = 'A posse de xanax em pequena quantidade geralmente para uso pessoal sem receita'},
        [25] = {title = 'Posse de Xanax com Intenção de Distribuir', class = 'Felony', id = 'P.C. 7025', months = 25, fine = 1500, color = 'red', description = 'A posse de uma quantidade de xanax proveniente de fabricação'},
        [26] = {title = 'Posse de Xanax com Intenção de Distribuir', class = 'Felony', id = 'P.C. 7026', months = 35, fine = 4500, color = 'orange', description = 'A posse de uma quantidade de Xanax para distribuição'},
        [27] = {title = 'Posse de Shrooms como Contravenção', class = 'Misdemeanor', id = 'P.C. 7027', months = 7, fine = 500, color = 'green', description = 'A posse de shrooms em pequena quantidade geralmente para uso pessoal'},
        [28] = {title = 'Posse de Shrooms com Intenção de Distribuir', class = 'Felony', id = 'P.C. 7028', months = 25, fine = 1500, color = 'red', description = 'A posse de uma quantidade de shrooms proveniente de fabricação'},
        [29] = {title = 'Posse de Shrooms com Intenção de Distribuir', class = 'Felony', id = 'P.C. 7029', months = 35, fine = 4500, color = 'orange', description = 'A posse de uma quantidade de Shrooms para distribuição'},
        [30] = {title = 'Posse de Lean como Contravenção', class = 'Misdemeanor', id = 'P.C. 7030', months = 7, fine = 500, color = 'green', description = 'A posse de lean em pequena quantidade geralmente para uso pessoal'},
        [31] = {title = 'Posse de Lean com Intenção de Distribuir', class = 'Felony', id = 'P.C. 7031', months = 25, fine = 1500, color = 'red', description = 'A posse de uma quantidade de lean proveniente de fabricação'},
        [32] = {title = 'Posse de Lean com Intenção de Distribuir', class = 'Felony', id = 'P.C. 7032', months = 35, fine = 4500, color = 'orange', description = 'A posse de uma quantidade de Lean para distribuição'},
        [33] = {title = 'Venda de substância controlada', class = 'Felony', id = 'P.C. 7033', months = 10, fine = 1000, color = 'green', description = 'A venda de uma substância controlada por lei'},
        [34] = {title = 'Tráfico de Drogas', class = 'Felony', id = 'P.C. 7034', months = 0, fine = 0, color = 'red', description = 'O movimento em grande escala de drogas ilegais'},
        [35] = {title = 'Profanação de um cadáver humano', class = 'Felony', id = 'P.C. 7035', months = 20, fine = 1500, color = 'orange', description = 'Quando alguém prejudica, perturba ou destrói os restos de outra pessoa'},
        [36] = {title = 'Embriaguez Pública', class = 'Misdemeanor', id = 'P.C. 7036', months = 0, fine = 500, color = 'green', description = 'Quando alguém está intoxicado acima do limite legal em público'},
        [37] = {title = 'Indecência Pública', class = 'Misdemeanor', id = 'P.C. 7037', months = 10, fine = 750, color = 'green', description = 'O ato de alguém se expor de uma forma que infringe a moral pública'},        
    },
    [8] = {
        [1] = {title = 'Posse de Arma de Classe A Criminosa', class = 'Felony', id = 'P.C. 8001', months = 10, fine = 500, color = 'green', description = 'Posse de uma arma de Classe A sem licenciamento'},
        [2] = {title = 'Posse de Arma de Classe B Criminosa', class = 'Felony', id = 'P.C. 8002', months = 15, fine = 1000, color = 'green', description = 'Posse de uma arma de Classe B sem licenciamento'},
        [3] = {title = 'Posse de Arma de Classe C Criminosa', class = 'Felony', id = 'P.C. 8003', months = 30, fine = 3500, color = 'green', description = 'Posse de uma arma de Classe C sem licenciamento'},
        [4] = {title = 'Posse de Arma de Classe D Criminosa', class = 'Felony', id = 'P.C. 8004', months = 25, fine = 1500, color = 'green', description = 'Posse de uma arma de Classe D sem licenciamento'},
        [5] = {title = 'Venda de Arma de Classe A Criminosa', class = 'Felony', id = 'P.C. 8005', months = 15, fine = 1000, color = 'orange', description = 'O ato de vender uma arma de Classe A sem licenciamento'},
        [6] = {title = 'Venda de Arma de Classe B Criminosa', class = 'Felony', id = 'P.C. 8006', months = 20, fine = 2000, color = 'orange', description = 'O ato de vender uma arma de Classe B sem licenciamento'},
        [7] = {title = 'Venda de Arma de Classe C Criminosa', class = 'Felony', id = 'P.C. 8007', months = 35, fine = 7000, color = 'orange', description = 'O ato de vender uma arma de Classe C sem licenciamento'},
        [8] = {title = 'Venda de Arma de Classe D Criminosa', class = 'Felony', id = 'P.C. 8008', months = 30, fine = 3000, color = 'orange', description = 'O ato de vender uma arma de Classe D sem licenciamento'},
        [9] = {title = 'Uso Criminoso de Arma', class = 'Misdemeanor', id = 'P.C. 8009', months = 10, fine = 450, color = 'orange', description = 'Uso de uma arma durante a comissão de um crime'},
        [10] = {title = 'Posse de Modificações Ilegais em Armas', class = 'Misdemeanor', id = 'P.C. 8010', months = 10, fine = 300, color = 'green', description = 'Estar em posse de modificações de armas ilegalmente'},
        [11] = {title = 'Tráfico de Armas', class = 'Felony', id = 'P.C. 8011', months = 0, fine = 0, color = 'red', description = 'O transporte de uma grande quantidade de armas de um ponto a outro'},
        [12] = {title = 'Exibição de Arma', class = 'Misdemeanor', id = 'P.C. 8012', months = 15, fine = 500, color = 'orange', description = 'O ato de tornar uma arma visível intencionalmente'},
        [13] = {title = 'Insurreição', class = 'Felony', id = 'P.C. 8013', months = 0, fine = 0, cor = 'red', description = 'Tentativa de derrubar o governo com violência'},
        [14] = {title = 'Ingresso em Espaço Aéreo Restrito', class = 'Felony', id = 'P.C. 8014', months = 20, fine = 1500, color = 'green', description = 'Pilotar uma aeronave em espaço aéreo controlado pelo governo'},
        [15] = {title = 'Atravessar a rua fora da faixa de pedestres', class = 'Infraction', id = 'P.C. 8015', months = 0, fine = 150, cor = 'green', description = 'Cruzar uma via de maneira que seja perigosa para veículos automotores'},
        [16] = {title = 'Uso Criminoso de Explosivos', class = 'Felony', id = 'P.C. 8016', months = 30, fine = 2500, color = 'orange', description = 'Uso de explosivos para cometer um crime'},        
    },
    [9] = {

        [1] = {title = 'Dirigir Sob Efeito de Álcool', class = 'Misdemeanor', id = 'P.C. 9001', months = 5, fine = 300, color = 'green', description = 'Operar um veículo motorizado sob a influência de álcool'},
        [2] = {title = 'Evasão', class = 'Misdemeanor', id = 'P.C. 9002', months = 5, fine = 400, color = 'green', description = 'Esconder-se ou fugir de detenção legal'},
        [3] = {title = 'Evasão Imprudente', class = 'Felony', id = 'P.C. 9003', months = 10, fine = 800, color = 'orange', description = 'Desprezar imprudentemente a segurança e esconder-se ou fugir de detenção legal enquanto'},
        [4] = {title = 'Não Ceder à Viatura de Emergência', class = 'Infraction', id = 'P.C. 9004', months = 0, fine = 600, color = 'green', description = 'Não dar passagem a veículos de emergência'},
        [5] = {title = 'Desrespeitar Dispositivo de Controle de Tráfego', class = 'Infraction', id = 'P.C. 9005', months = 0, fine = 150, color = 'green', description = 'Não seguir os dispositivos de segurança da via'},
        [6] = {title = 'Veículo Não Funcional', class = 'Infraction', id = 'P.C. 9006', months = 0, fine = 75, color = 'green', description = 'Ter um veículo que não está mais funcional na via pública'},
        [7] = {title = 'Direção Negligente', class = 'Infraction', id = 'P.C. 9007', months = 0, fine = 300, color = 'green', description = 'Dirigir de maneira a desconsiderar inadvertidamente a segurança'},
        [8] = {title = 'Direção Imprudente', class = 'ContraMisdemeanorvenção', id = 'P.C. 9008', months = 10, fine = 750, color = 'orange', description = 'Dirigir de maneira a deliberadamente desconsiderar a segurança'},
        [9] = {title = 'Excesso de Velocidade de Terceiro Grau', class = 'Infraction', id = 'P.C. 9009', months = 0, fine = 225, color = 'green', description = 'Ultrapassar em 15 a velocidade permitida'},
        [10] = {title = 'Excesso de Velocidade de Segundo Grau', class = 'Infraction', id = 'P.C. 9010', months = 0, fine = 450, color = 'green', description = 'Ultrapassar em 35 a velocidade permitida'},
        [11] = {title = 'Excesso de Velocidade de Primeiro Grau', class = 'Infraction', id = 'P.C. 9011', months = 0, fine = 750, color = 'green', description = 'Ultrapassar em 50 a velocidade permitida'},
        [12] = {title = 'Operação de Veículo sem Licença', class = 'Infraction', id = 'P.C. 9012', months = 0, fine = 500, color = 'green', description = 'Operar um veículo motorizado sem a devida licença'},
        [13] = {title = 'Retorno Ilegal', class = 'Infraction', id = 'P.C. 9013', months = 0, fine = 75, color = 'green', description = 'Realizar um retorno onde é proibido'},
        [14] = {title = 'Ultrapassagem Ilegal', class = 'Infraction', id = 'P.C. 9014', months = 0, fine = 300, color = 'green', description = 'Ultrapassar outros veículos de forma proibida'},
        [15] = {title = 'Não Manter a Faixa', class = 'Infraction', id = 'P.C. 9015', months = 0, fine = 300, color = 'green', description = 'Não permanecer na faixa correta com um veículo motorizado'},
        [16] = {title = 'Conversão Ilegal', class = 'Infraction', id = 'P.C. 9016', months = 0, fine = 150, color = 'green', description = 'Realizar uma conversão onde é proibido'},
        [17] = {title = 'Não Parar', class = 'Infraction', id = 'P.C. 9017', months = 0, fine = 600, color = 'green', description = 'Não parar em uma parada legal ou dispositivo de trânsito'},
        [18] = {title = 'Estacionamento Não Autorizado', class = 'Infraction', id = 'P.C. 9018', months = 0, fine = 300, color = 'green', description = 'Estacionar um veículo em um local que requer aprovação'},
        [19] = {title = 'Acidente de Fuga', class = 'Misdemeanor', id = 'P.C. 9019', months = 10, fine = 500, color = 'green', description = 'Colidir com outra pessoa ou veículo e fugir do local'},
        [20] = {title = 'Dirigir sem Faróis ou Sinalização', class = 'Infraction', id = 'P.C. 9020', months = 0, fine = 300, color = 'green', description = 'Operar um veículo sem luzes funcionais'},
        [21] = {title = 'Corrida de Rua', class = 'Felony', id = 'P.C. 9021', months = 15, fine = 1500, color = 'green', description = 'Operar veículos motorizados em uma competição'},
        [22] = {title = 'Operar sem Licença Adequada', class = 'Felony', id = 'P.C. 9022', months = 20, fine = 1500, color = 'orange', description = 'Falta de posse de licença válida ao operar uma aeronave'},
        [23] = {title = 'Uso Ilegal de um Veículo Motorizado', class = 'Misdemeanor', id = 'P.C. 9023', months = 10, fine = 750, color = 'green', description = 'O uso de um veículo motorizado sem uma razão legal'}
    },
    [10] = {
        [1] = {title = 'Caça em Áreas Restritas', class = 'Misdemeanor', id = 'P.C. 10001', months = 0, fine = 450, color = 'green', description = 'Colher animais em áreas onde é proibido fazê-lo'},
        [2] = {title = 'Caça sem Licença', class = 'Misdemeanor', id = 'P.C. 10002', months = 0, fine = 450, color = 'green', description = 'Colher animais sem a licença adequada'},
        [3] = {title = 'Crueldade contra Animais', class = 'Misdemeanor', id = 'P.C. 10003', months = 10, fine = 450, color = 'green', description = 'O ato de abusar de um animal conscientemente ou não'},
        [4] = {title = 'Caça com Arma Não Permitida para Caça', class = 'Misdemeanor', id = 'P.C. 10004', months = 10, fine = 750, color = 'green', description = 'Usar uma arma não legalmente especificada ou fabricada para a colheita de animais selvagens'},
        [5] = {title = 'Caça fora do horário de caça', class = 'Misdemeanor', id = 'P.C. 10005', months = 0, fine = 750, color = 'green', description = 'Colher animais fora do horário especificado para fazê-lo'},
        [6] = {title = 'Caça Excessiva', class = 'Misdemeanor', id = 'P.C. 10006', months = 10, fine = 1000, color = 'green', description = 'Pegar mais do que a quantidade legalmente especificada de animais'},
        [7] = {title = 'Clandestinidade na Caça', class = 'Felony', id = 'P.C. 10007', months = 20, fine = 1250, color = 'red', description = 'Colher um animal que está listado como não colhível legalmente'}
    }
}

Config.AllowedJobs = {}
for index, value in pairs(Config.PoliceJobs) do
    Config.AllowedJobs[index] = value
end
for index, value in pairs(Config.AmbulanceJobs) do
    Config.AllowedJobs[index] = value
end
for index, value in pairs(Config.DojJobs) do
    Config.AllowedJobs[index] = value
end

Config.ColorNames = {
    [0] = "Preto Metálico",
    [1] = "Preto Grafite Metálico",
    [2] = "Aço Preto Metálico",
    [3] = "Prata Escura Metálica",
    [4] = "Prata Metálica",
    [5] = "Prata Azul Metálica",
    [6] = "Cinza Aço Metálico",
    [7] = "Prata Sombreada Metálica",
    [8] = "Prata Pedra Metálica",
    [9] = "Prata Meia-Noite Metálica",
    [10] = "Metal Gun",
    [11] = "Cinza Antracite Metálico",
    [12] = "Preto Fosco",
    [13] = "Cinza Fosco",
    [14] = "Cinza Claro Fosco",
    [15] = "Preto Utilitário",
    [16] = "Polímero Preto Utilitário",
    [17] = "Prata Escura Utilitária",
    [18] = "Prata Utilitária",
    [19] = "Metal Gun Utilitário",
    [20] = "Prata Sombreada Utilitária",
    [21] = "Preto Desgastado",
    [22] = "Grafite Desgastado",
    [23] = "Cinza Prateado Desgastado",
    [24] = "Prata Desgastada",
    [25] = "Prata Azul Desgastada",
    [26] = "Prata Sombreada Desgastada",
    [27] = "Vermelho Metálico",
    [28] = "Vermelho Torino Metálico",
    [29] = "Vermelho Fórmula Metálico",
    [30] = "Vermelho Brasa Metálico",
    [31] = "Vermelho Gracioso Metálico",
    [32] = "Vermelho Granada Metálico",
    [33] = "Vermelho Deserto Metálico",
    [34] = "Vermelho Cabernet Metálico",
    [35] = "Vermelho Candy Metálico",
    [36] = "Laranja Amanhecer Metálico",
    [37] = "Ouro Clássico Metálico",
    [38] = "Laranja Metálico",
    [39] = "Vermelho Fosco",
    [40] = "Vermelho Escuro Fosco",
    [41] = "Laranja Fosco",
    [42] = "Amarelo Fosco",
    [43] = "Vermelho Utilitário",
    [44] = "Vermelho Brilhante Utilitário",
    [45] = "Vermelho Granada Utilitário",
    [46] = "Vermelho Desgastado",
    [47] = "Vermelho Dourado Desgastado",
    [48] = "Vermelho Escuro Desgastado",
    [49] = "Verde Escuro Metálico",
    [50] = "Verde Racing Metálico",
    [51] = "Verde Mar Metálico",
    [52] = "Verde Oliva Metálico",
    [53] = "Verde Metálico",
    [54] = "Verde Azulado Metálico Gasolina",
    [55] = "Verde Limão Fosco",
    [56] = "Verde Escuro Utilitário",
    [57] = "Verde Utilitário",
    [58] = "Verde Escuro Desgastado",
    [59] = "Verde Desgastado",
    [60] = "Lavagem Marinha Desgastada",
    [61] = "Azul Meia-Noite Metálico",
    [62] = "Azul Escuro Metálico",
    [63] = "Azul Saxônia Metálico",
    [64] = "Azul Metálico",
    [65] = "Azul Marinheiro Metálico",
    [66] = "Azul Porto Metálico",
    [67] = "Azul Diamante Metálico",
    [68] = "Azul Surf Metálico",
    [69] = "Azul Náutico Metálico",
    [70] = "Azul Brilhante Metálico",
    [71] = "Azul Roxo Metálico",
    [72] = "Azul Spinnaker Metálico",
    [73] = "Azul Ultra Metálico",
    [74] = "Azul Brilhante Metálico",
    [75] = "Azul Escuro Utilitário",
    [76] = "Azul Meia-Noite Utilitário",
    [77] = "Azul Utilitário",
    [78] = "Azul Espuma do Mar Utilitário",
    [79] = "Azul Elétrico Utilitário",
    [80] = "Azul Maui Poli Utilitário",
    [81] = "Azul Brilhante Utilitário",
    [82] = "Azul Escuro Fosco",
    [83] = "Azul Fosco",
    [84] = "Azul Meia-Noite Fosco",
    [85] = "Azul Escuro Desgastado",
    [86] = "Azul Desgastado",
    [87] = "Azul Claro Desgastado",
    [88] = "Amarelo Táxi Metálico",
    [89] = "Amarelo Corrida Metálico",
    [90] = "Bronze Metálico",
    [91] = "Amarelo Pássaro Metálico",
    [92] = "Limão Metálico",
    [93] = "Champagne Metálico",
    [94] = "Bege Pueblo Metálico",
    [95] = "Ivory Escuro Metálico",
    [96] = "Marrom Chocolate Metálico",
    [97] = "Marrom Dourado Metálico",
    [98] = "Marrom Claro Metálico",
    [99] = "Bege Palha Metálico",
    [100] = "Marrom Musgo Metálico",
    [101] = "Marrom Biston Metálico",
    [102] = "Madeira de Faia Metálica",
    [103] = "Madeira de Faia Escura Metálica",
    [104] = "Laranja Chocolate Metálico",
    [105] = "Areia de Praia Metálica",
    [106] = "Areia Desbotada ao Sol Metálica",
    [107] = "Creme Metálico",
    [108] = "Marrom Utilitário",
    [109] = "Marrom Médio Utilitário",
    [110] = "Marrom Claro Utilitário",
    [111] = "Branco Metálico",
    [112] = "Branco Geadio Metálico",
    [113] = "Bege Mel Desgastado",
    [114] = "Marrom Desgastado",
    [115] = "Marrom Escuro Desgastado",
    [116] = "Bege Palha Desgastado",
    [117] = "Aço Escovado",
    [118] = "Aço Preto Escovado",
    [119] = "Alumínio Escovado",
    [120] = "Cromado",
    [121] = "Branco Sujo Desgastado",
    [122] = "Branco Sujo Utilitário",
    [123] = "Laranja Desgastado",
    [124] = "Laranja Claro Desgastado",
    [125] = "Verde Securicolor Metálico",
    [126] = "Amarelo Táxi Desgastado",
    [127] = "Azul Carro de Polícia",
    [128] = "Verde Fosco",
    [129] = "Marrom Fosco",
    [130] = "Laranja Desgastado",
    [131] = "Branco Fosco",
    [132] = "Branco Desgastado",
    [133] = "Verde Exército Oliva Desgastado",
    [134] = "Branco Puro",
    [135] = "Rosa Choque",
    [136] = "Rosa Salmão",
    [137] = "Rosa Vermelho Metálico",
    [138] = "Laranja",
    [139] = "Verde",
    [140] = "Azul",
    [141] = "Azul Preto Metálico",
    [142] = "Roxo Preto Metálico",
    [143] = "Vermelho Preto Metálico",
    [144] = "Verde Caçador",
    [145] = "Roxo Metálico",
    [146] = "Azul Escuro V Metálico",
    [147] = "Preto da OFICINA_MOD1",
    [148] = "Roxo Fosco",
    [149] = "Roxo Escuro Fosco",
    [150] = "Vermelho Lava Metálico",
    [151] = "Verde Floresta Fosco",
    [152] = "Verde Azeitona Fosco",
    [153] = "Marrom Deserto Fosco",
    [154] = "Bege Deserto Fosco",
    [155] = "Verde Folhagem Fosco",
    [156] = "COR PADRÃO DA LIGA",
    [157] = "Azul Épsilon",
    [158] = "Desconhecido",
}

Config.ColorInformation = {
    [0] = "black",
    [1] = "black",
    [2] = "black",
    [3] = "darksilver",
    [4] = "silver",
    [5] = "bluesilver",
    [6] = "silver",
    [7] = "darksilver",
    [8] = "silver",
    [9] = "bluesilver",
    [10] = "darksilver",
    [11] = "darksilver",
    [12] = "matteblack",
    [13] = "gray",
    [14] = "lightgray",
    [15] = "black",
    [16] = "black",
    [17] = "darksilver",
    [18] = "silver",
    [19] = "utilgunmetal",
    [20] = "silver",
    [21] = "black",
    [22] = "black",
    [23] = "darksilver",
    [24] = "silver",
    [25] = "bluesilver",
    [26] = "darksilver",
    [27] = "red",
    [28] = "torinored",
    [29] = "formulared",
    [30] = "blazered",
    [31] = "gracefulred",
    [32] = "garnetred",
    [33] = "desertred",
    [34] = "cabernetred",
    [35] = "candyred",
    [36] = "orange",
    [37] = "gold",
    [38] = "orange",
    [39] = "red",
    [40] = "mattedarkred",
    [41] = "orange",
    [42] = "matteyellow",
    [43] = "red",
    [44] = "brightred",
    [45] = "garnetred",
    [46] = "red",
    [47] = "red",
    [48] = "darkred",
    [49] = "darkgreen",
    [50] = "racingreen",
    [51] = "seagreen",
    [52] = "olivegreen",
    [53] = "green",
    [54] = "gasolinebluegreen",
    [55] = "mattelimegreen",
    [56] = "darkgreen",
    [57] = "green",
    [58] = "darkgreen",
    [59] = "green",
    [60] = "seawash",
    [61] = "midnightblue",
    [62] = "darkblue",
    [63] = "saxonyblue",
    [64] = "blue",
    [65] = "blue",
    [66] = "blue",
    [67] = "diamondblue",
    [68] = "blue",
    [69] = "blue",
    [70] = "brightblue",
    [71] = "purpleblue",
    [72] = "blue",
    [73] = "ultrablue",
    [74] = "brightblue",
    [75] = "darkblue",
    [76] = "midnightblue",
    [77] = "blue",
    [78] = "blue",
    [79] = "lightningblue",
    [80] = "blue",
    [81] = "brightblue",
    [82] = "mattedarkblue",
    [83] = "matteblue",
    [84] = "matteblue",
    [85] = "darkblue",
    [86] = "blue",
    [87] = "lightningblue",
    [88] = "yellow",
    [89] = "yellow",
    [90] = "bronze",
    [91] = "yellow",
    [92] = "lime",
    [93] = "champagne",
    [94] = "beige",
    [95] = "darkivory",
    [96] = "brown",
    [97] = "brown",
    [98] = "lightbrown",
    [99] = "beige",
    [100] = "brown",
    [101] = "brown",
    [102] = "beechwood",
    [103] = "beechwood",
    [104] = "chocoorange",
    [105] = "yellow",
    [106] = "yellow",
    [107] = "cream",
    [108] = "brown",
    [109] = "brown",
    [110] = "brown",
    [111] = "white",
    [112] = "white",
    [113] = "beige",
    [114] = "brown",
    [115] = "brown",
    [116] = "beige",
    [117] = "steel",
    [118] = "blacksteel",
    [119] = "aluminium",
    [120] = "chrome",
    [121] = "wornwhite",
    [122] = "offwhite",
    [123] = "orange",
    [124] = "lightorange",
    [125] = "green",
    [126] = "yellow",
    [127] = "blue",
    [128] = "green",
    [129] = "brown",
    [130] = "orange",
    [131] = "white",
    [132] = "white",
    [133] = "darkgreen",
    [134] = "white",
    [135] = "pink",
    [136] = "pink",
    [137] = "pink",
    [138] = "orange",
    [139] = "green",
    [140] = "blue",
    [141] = "blackblue",
    [142] = "blackpurple",
    [143] = "blackred",
    [144] = "darkgreen",
    [145] = "purple",
    [146] = "darkblue",
    [147] = "black",
    [148] = "purple",
    [149] = "darkpurple",
    [150] = "red",
    [151] = "darkgreen",
    [152] = "olivedrab",
    [153] = "brown",
    [154] = "tan",
    [155] = "green",
    [156] = "silver",
    [157] = "blue",
    [158] = "black",
}

Config.ClassList = {
    [0] = "Compacto",
    [1] = "Sedã",
    [2] = "SUV",
    [3] = "Cupê",
    [4] = "Muscle",
    [5] = "Clássico Esportivo",
    [6] = "Esportivo",
    [7] = "Super",
    [8] = "Motocicleta",
    [9] = "Off-Road",
    [10] = "Industrial",
    [11] = "Utilitário",
    [12] = "Van",
    [13] = "Bicicleta",
    [14] = "Barco",
    [15] = "Helicóptero",
    [16] = "Avião",
    [17] = "Serviço",
    [18] = "Emergência",
    [19] = "Militar",
    [20] = "Comercial",
    [21] = "Trem"    
}

function GetJobType(job)
	if Config.PoliceJobs[job] then
		return 'police'
	elseif Config.AmbulanceJobs[job] then
		return 'ambulance'
	elseif Config.DojJobs[job] then
		return 'doj'
	else
		return nil
	end
end
