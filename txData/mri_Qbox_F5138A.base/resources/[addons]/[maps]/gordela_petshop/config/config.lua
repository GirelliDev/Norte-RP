--Para encontrar a lista completa de modelos de Ped: https://docs.fivem.net/docs/game-references/ped-models/
--Para acessar a lista completa de animações: https://alexguirre.github.io/animations-list/

Config = {}
Config.Invincible = true --Você quer que os personagens sejam invencíveis?
Config.Frozen = false --Você quer que os pedestres fiquem incapazes de se mover? Provavelmente sim, então deixe 'verdadeiro' lá.
Config.Stoic = true --Você quer que os pedestres reajam ao que está acontecendo ao seu redor?
Config.Fade = true-- Do you want the peds to fade into/out of existence? It looks better than just *POP* its there.
Config.Distance = 15.0 --Você quer que os pedestres desapareçam e apareçam gradualmente? Isso fica melhor do que simplesmente PUM, estão lá.


-- O sistema que você usa para obter as coordenadas exige subtração do eixo Z?
-- Se sim, defina isso como verdadeiro. Você precisará ajustar as coordenadas para valores padrão diminuindo 1 se definir como falso."
Config.MinusOne = true

Config.PedList = {
	{
		model = "a_c_chop",
		coords = vector3(420.93, 327.18, 103.08),
		heading = 210.31,
		gender = "male", 
		--animDict = "missmechanic", 
		--animName = "work_base",
	    isRendered = false,
        ped = nil,
    },
	{
		model = "a_c_poodle",
		coords = vector3(417.3, 329.88, 103.15),
		heading = 120.52,
		gender = "male", 
		--animDict = "missmechanic", 
		--animName = "work_base",
	    isRendered = false,
        ped = nil,
    },
	{
		model = "a_c_pug",
		coords = vector3(416.71, 325.66, 103.37),
		heading = 330.58,
		gender = "male", 
		--animDict = "missmechanic", 
		--animName = "work_base",
	    isRendered = false,
        ped = nil,
    },
	{
		model = "a_c_westy",
		coords = vector3(417.35, 328.21, 103.15),
		heading = 254.94, 
		gender = "male", 
		--animDict = "missmechanic", 
		--animName = "work_base",
	    isRendered = false,
        ped = nil,
    },
	{
		model = "a_c_cat_01",
		coords = vector3(419.62, 333.8, 104.59),
		heading = 158.71,
		gender = "male", 
		--animDict = "missmechanic", 
		--animName = "work_base",
	    isRendered = false,
        ped = nil,
    },
	{
		model = "a_c_husky",
		coords = vector3(415.74, 322.62, 103.13),
		heading = 154.05,
		gender = "male", 
		--animDict = "missmechanic", 
		--animName = "work_base",
	    isRendered = false,
        ped = nil,
    },
	{
		model = "a_c_retriever",
		coords = vector3(417.68, 335.9, 103.45),
		heading = 65.3,
		gender = "male", 
		--animDict = "missmechanic", 
		--animName = "work_base",
	    isRendered = false,
        ped = nil,
    },
	{
		model = "a_c_chop",
		coords = vector3(411.08, 330.84, 104.17),
		heading = 64.17,
		gender = "male",
		--animDict = "missmechanic", 
		--animName = "work_base",
	    isRendered = false,
        ped = nil,
    },
}