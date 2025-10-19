----------------------------------------------------------------------
-- Thanks for supporting AngelicXS Scripts!							--
-- Support can be found at: https://discord.gg/tQYmqm4xNb			--
-- More paid scripts at: https://angelicxs.tebex.io/ 				--
-- More FREE scripts at: https://github.com/GouveiaXS/ 				--
-- Images are provided for new items if you choose to add them 		--
----------------------------------------------------------------------

----------------------------------------------------------------------
--						Main Configuration 							--
--			To configure jobs uniquely see each client file			--
--			for additional config options specific to the job		--
----------------------------------------------------------------------

-- Model info: https://docs.fivem.net/docs/game-references/ped-models/
-- Blip info: https://docs.fivem.net/docs/game-references/blips/

Config = {}

Config.UseESX = false						-- Use ESX Framework
Config.UseQBCore = true						-- Use QBCore Framework (Ignored if Config.UseESX = true)

Config.NHInput = false						-- Use NH-Input [https://github.com/nerohiro/nh-keyboard]
Config.NHMenu = false						-- Use NH-Menu [https://github.com/whooith/nh-context]
Config.QBInput = false						-- Use QB-Input (Ignored if Config.NHInput = true) [https://github.com/qbcore-framework/qb-input]
Config.QBMenu = false						-- Use QB-Menu (Ignored if Config.NHMenu = true) [https://github.com/qbcore-framework/qb-menu]
Config.OXLib = true						-- Use the OX_lib (Ignored if Config.NHInput or Config.QBInput = true) [https://github.com/overextended/ox_lib]  !! must add shared_script '@ox_lib/init.lua' and lua54 'yes' to fxmanifest!!

Config.UseCustomNotify = false				-- Use a custom notification script, must complete event below.
-- Only complete this event if Config.UseCustomNotify is true; mythic_notification provided as an example
RegisterNetEvent('angelicxs-CivilianJobs:CustomNotify')
AddEventHandler('angelicxs-CivilianJobs:CustomNotify', function(message, type)
    --exports.mythic_notify:SendAlert(type, message, 4000)
end)

-- Visual Preference
Config.Use3DText = false 					-- Use 3D text for NPC/Job interactions; only turn to false if Config.UseThirdEye is turned on and IS working.
Config.UseThirdEye = true 					-- Enables using a third eye (third eye requires the following arguments debugPoly, useZ, options {event, icon, label}, distance)
Config.ThirdEyeName = 'ox_target' 			-- Name of third eye aplication
Config.UsePedAsJobBoss = true				-- Creates a ped at the interaction location to initiate each job (required if Config.UseThirdEye = true)

-- General Blip Preference
Config.JobBlipSize = 0.7
Config.BlipMarkerColour = 24
Config.BlipRouteColour = 15


-- Rewards Configuration
Config.AccountMoney = 'cash' 				-- How you want the job completion to be paid.

-- Usable Item Config
Config.ScubaItemName = 'diving_gear'		-- Name of scuba gear item to put on/take off scuba gear

-- General Configuration
Config.UsePlayerJob = false					-- If true requires the player to have the appropriate job; job uses and names identified next
Config.VehicleSteward = true				-- If true, will not let the player do any more jobs if they have returned a destroyed vehicle (they will need to relog to reset this)
Config.BusJobOn = true						-- If true allows the bus job
Config.BusJobName = 'bus-driver'			-- Name of the bus job, used if Config.UsePlayerJob = true
Config.ForkliftJobOn = false					-- If true allows the forklift job
Config.ForkliftJobName = 'forklift-driver'	-- Name of the forklift job, used if Config.UsePlayerJob = true
Config.TaxiJobOn = true						-- If true allows the taxi job
Config.TaxiJobName = 'taxi-driver'			-- Name of the taxi job, used if Config.UsePlayerJob = true
Config.ScubaJobOn = false					-- If true allows the scuba job
Config.ScubaJobName = 'scuba-diver'			-- Name of the scuba job, used if Config.UsePlayerJob = true
Config.JetSkiJobOn = false					-- If true allows the JetSKi job
Config.JetSkiJobName = 'lifeguard'			-- Name of the JetSKi job, used if Config.UsePlayerJob = true
Config.HeliJobOn = false						-- If true allows the Heli job
Config.HeliJobName = 'heli-driver'			-- Name of the Heli job, used if Config.UsePlayerJob = true
Config.GarbageJobOn = false					-- If true allows the Garbage job
Config.GarbageJobName = 'garbage-driver'	-- Name of the Garbage job, used if Config.UsePlayerJob = true


-- Vehicle Keys and Fuel; set the below event to give the player keys and fuel for the vehicle (if applicable)
RegisterNetEvent('angelicxs-CivilianJobs:VehicleInitation')
AddEventHandler('angelicxs-CivilianJobs:VehicleInitation', function(vehicle)
	-- Example provided:
	TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
    exports["cdn-fuel"]:SetFuel(vehicle, 100)
end)

-- Language Configuration
Config.LangType = {
	['error'] = 'error',
	['success'] = 'success',
	['info'] = 'primary'
}

Config.Lang = {
	['request_job_3d'] = 'Pressione ~r~[E]~w~ para mudar de emprego.',
	['request_job'] = 'Mudar de Emprego',
	['request_work_3d'] = 'Pressione ~r~[E]~w~ para solicitar trabalho. \n Pressione ~r~[G]~w~ para devolver o veículo de trabalho. \n Pressione ~r~[F]~w~ para descobrir como funciona o emprego.',
	['request_work'] = 'Solicitar Trabalho',
	['ask_how_to'] = 'Perguntar Como Funciona o Trabalho',
	['wrong_job'] = 'Você não tem o emprego correto para fazer este trabalho!',
	['at_route_marker'] = 'Você chegou ao destino indicado!',
	['vehicle_out'] = 'Você já recebeu um veículo!',
	['gen_how_to'] = 'Pressione F8 para visualizar seu console e ler como funciona o trabalho!',
	['vehicle_return_request'] = 'Devolver Veículo',
	['vehicle_return'] = 'Você devolveu seu veículo de trabalho!',
	['vehicle_far'] = 'Aproxime seu veículo para devolvê-lo!',
	['vehicle_not_out'] = 'Você não possui um veículo atualmente!',
	['vehicle_destroyed'] = 'Você destruiu nosso veículo, estou avisando todo mundo na cidade e você não vai conseguir outro hoje!',
	['vehicle_destroyed_notice'] = 'Você destruiu um veículo de trabalho, volte amanhã para outra chance!',
	['payment_notice_money'] = 'Você recebeu a seguinte quantia pelo seu trabalho: $',
	['payment_notice_item'] = 'Você recebeu o seguinte item pelo seu trabalho:',
	['gen_anchor_boat'] = 'Você deve estar em um barco para usar este comando.',
	['gen_anchor_boat_activate'] = 'Você deve estar no banco do motorista para ancorar ou desancorar um barco.',
	['gen_anchor_boat_off'] = 'Você desancorou o barco.',
	['gen_anchor_boat_on'] = 'Você ancorou o barco.',

-- Idioma do Ônibus
	['bus_how_to'] = 'Dirija até cada ponto marcado em sua rota e espere um passageiro subir ou descer. O pagamento é feito quando o passageiro desce do ônibus. Se você pular uma parada, precisará voltar para pegar/deixar o passageiro.',
	['bus_route_complete'] = 'Você completou a rota, retorne ao terminal de ônibus para devolver seu veículo ou pedir uma nova rota!',
	['bus_on_route'] = 'Você já foi designado para uma rota, por favor, termine antes de solicitar uma nova!',
	['bus_start'] = 'Vá em frente e complete a rota que enviei!',
	['bus_get_on'] = 'Um passageiro está subindo.',
	['bus_get_off'] = 'Um passageiro está descendo.',

-- Idioma da Empilhadeira
	['forklift_how_to'] = 'Leve a empilhadeira para o local indicado para pegar o palete, use o teclado numérico 5 e o teclado numérico 8 para abaixar/levantar os garfos. Deixe o palete no caminhão indicado para receber o pagamento.',
	['forklift_start'] = 'Vá pegar o palete encomendado e coloque-o no caminhão marcado!',
	['forklift_on_job'] = 'Você não terminou o pedido atual!',
	['forklift_job_complete'] = 'Você completou o pedido, devolva a empilhadeira ou peça um novo pedido!',

-- Idioma do Táxi
	['taxi_how_to'] = 'Após um período de tempo, você receberá uma corrida que poderá aceitar ou recusar, se recusar, precisará esperar outra corrida aparecer. Ao aceitar, pegue o indivíduo e leve-o ao destino para pagamento.',
	['taxi_start'] = 'Saia por aí e dirija, vou enviar sua primeira corrida em breve!',
	['taxi_working'] = 'Saia por aí e termine algumas corridas!',
	['taxi_menu_header_1'] = 'Pedido de corrida recebido!',
	['taxi_menu_header_2'] = 'Valor da corrida: R$ ',
	['taxi_menu_yes'] = 'Aceitar Corrida',
	['taxi_menu_no'] = 'Recusar Corrida',
	['taxi_get_on'] = 'Um passageiro está entrando.',
	['taxi_get_off'] = 'Um passageiro está saindo.',
	['taxi_bring_client'] = 'Leve o cliente ao destino dele!',
	['taxi_fare_accepted'] = 'Você aceitou a corrida, vá buscar ',
	['taxi_fare_declined'] = 'Você recusou a corrida, espere outro pedido!',
	['taxi_route_complete'] = 'Você completou a corrida, receberá outra corrida quando estiver disponível!',

-- Idioma do Mergulho com Scuba
	['scuba_how_to'] = 'Explicação longa aqui',
	['scuba_start'] = 'Vá para a área indicada e procure as caixas, certifique-se de ter seu equipamento antes de ir! A seguinte quantidade de caixas foi detectada na área:',
	['scuba_on_job'] = 'Você já possui uma localização de mergulho indicada!',
	['scuba_salvage'] = 'Recuperar Caixa',
	['scuba_salvage_3d'] = 'Pressione ~r~[E]~w~ para recuperar a caixa.',
	['scuba_salvage_complete'] = 'Você recuperou com sucesso a caixa!',
	['scuba_75'] = 'O oxigênio do tanque está em 75%!',
	['scuba_50'] = 'O oxigênio do tanque está em 50%!',
	['scuba_25'] = 'O oxigênio do tanque está em 25%!',
	['scuba_in_water'] = 'Você não pode fazer isso enquanto estiver na água!',
	
-- Idioma do Helicóptero
	['heli_how_to'] = 'Explicação longa aqui',
	['heli_start'] = 'Vá pegar a entrega prioritária da caixa e entregue ao cliente!',
	['heli_on_job'] = 'Você não terminou o pedido atual!',
	['heli_job_complete'] = 'Você completou o pedido, retorne ao heliporto e devolva o helicóptero ou peça um novo pedido!',

-- Idioma do Salva-Vidas
	['jetski_how_to'] = 'Vá até o local indicado para pegar o civil se afogando, então traga-os de volta ao salva-vidas para salvá-los e receber o pagamento.',
	['jetski_start'] = 'Vá verificar essa área, recebemos um chamado dizendo que alguém precisa de ajuda!',
	['jetski_on_job'] = 'Você não verificou o último relatório!',
	['jetski_job_complete'] = 'Você os salvou! Devolva seu veículo ou verifique mais relatórios conversando com o salva-vidas.',
	['jetski_help_civ'] = 'Você encontrou o relatório! Pare perto do civil para ajudá-lo!',
	['jetski_return_civ'] = 'Devolva o civil ao salva-vidas para garantir que estejam bem!',
	
-- Idioma da Coleta de Lixo
	['garbage_how_to'] = 'Dirija até cada local marcado para pegar o lixo e então jogue o saco de lixo no caminhão. Assim que todas as paradas forem concluídas, o pagamento será feito.',
	['garbage_start'] = 'Siga a rota marcada para pegar o lixo e jogá-lo no caminhão',
	['garbage_on_job'] = 'Você não terminou a rota atualmente atribuída a você!',
	['garbage_search_bin_3D'] = 'Pressione ~r~[E]~w~ para procurar lixo.',
	['garbage_search_bin'] = 'Procurar Lixo',
	['garbage_route_complete'] = 'Rota completa! Veja o Mestre do Lixo para devolver o caminhão ou obter uma nova rota!',
	['garbage_get_garbage'] = 'Pressione ~r~[G]~w~ para pegar o lixo.',
	['garbage_put_garbage'] = 'Pressione ~r~[G]~w~ para colocar o lixo no caminhão.',
	['garbage_item_find'] = 'Você encontrou um item no lixo!',
	['garbage_item_nofind'] = 'Não há nada no lixo.',
	['garbage_in_truck'] = 'O lixo foi carregado, vá para o próximo local!',
}

Config.ErrorCodes = {
	['dev'] = 'Por favor, forneça as seguintes informações à sua equipe de desenvolvimento:',
	['001'] = 'A função Randomizer encontrada na configuração principal falhou. A lista foi encontrada como nula e foi chamada do seguinte evento:',
	['002'] = 'Um loop de retorno/quebra foi concluído involuntariamente. O loop foi chamado do seguinte evento:',
	['003'] = 'Aviso, o seguinte modelo demorou mais de um (1) segundo para carregar (referência de HashGrabber - main.lua):',
	['004'] = 'Foi solicitada a criação de uma rota indefinida a partir do seguinte evento:',
	['005'] = 'A segunda geração de NPC foi automaticamente abortada, solicitando eventor:',
	['006'] = 'A segunda geração de veículo foi automaticamente abortada, solicitando eventor:',
	['007'] = 'Aviso, erro detectado, consulte o comentário para mais detalhes, solicitando eventor:', -- !!!! Se você ver esse erro, provavelmente foi acionado por um injetor !!!!
	['008'] = 'Foi tentada a despawn de um veículo sem um NPC de trabalho gerado',
	['009'] = 'Falha ao efetuar o pagamento! (referência de DistancePayment - main.lua)',  -- !!!! Se você ver esse erro, provavelmente foi acionado por um injetor !!!!
	['010'] = 'Falha ao efetuar o pagamento! (referência de PaymentFlat - main.lua)',  -- !!!! Se você ver esse erro, provavelmente foi acionado por um injetor !!!!
	['011'] = 'Falha ao efetuar o pagamento! (referência de PaymentItem - main.lua)',  -- !!!! Se você ver esse erro, provavelmente foi acionado por um injetor !!!!
	['012'] = 'Cheating detectado.',
	['013'] = 'O jogador com o seguinte ID de servidor e licença foi removido por suspeita de exploração (acionou múltiplos eventos de pagamento/ganho de item dentro de 1 segundo): ',
}
