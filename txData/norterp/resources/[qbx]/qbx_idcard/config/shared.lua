return {

    idCardSettings = {
        closeKey = 'Escape',
        autoClose = {
            status = false, -- or true
            time = 3000
        }
    },

    licenses = {
        ['id_card'] = {
            header = 'Identidade',
            background = '#ebf7fd',
            backgroundImage = 'https://i.ibb.co/vxvGzg1/card.png',
            prop = 'prop_franklin_dl'
        },
        ['driver_license'] = {
            header = 'Carteira de Motorista',
            background = '#febbbb',
            backgroundImage = 'https://i.ibb.co/vxvGzg1/card.png',
            prop = 'prop_franklin_dl',
        },
        ['weaponlicense'] = {
            header = 'Porte de Armas',
            background = '#c7ffe5',
            backgroundImage = 'https://i.ibb.co/vxvGzg1/card.png',
            prop = 'prop_franklin_dl',
        },
        ['lawyerpass'] = {
            header = 'Carteira OAB',
            background = '#f9c491',
            backgroundImage = 'https://i.ibb.co/vxvGzg1/card.png',
            prop = 'prop_cs_r_business_card'
        }
    }
}
