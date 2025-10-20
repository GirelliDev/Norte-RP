const config = {
  autoSlideInterval: 3000, // Tempo de transição automática de slides (ms)
  autoPlay: true, // Valor booleano para controlar a reprodução automática
  musicVolume: 0.05, // Nível de volume padrão (0 = 0%; 0,5 = 50%; 1 = 100%)
  background: {
    type: "video", // "imagem" ou "video" ou "videoPasta"
    url: "QdBZY2fkU-0", // ID do vídeo do YouTube ou caminho do arquivo de imagem ou caminho do arquivo de video
    videoProvider: "youtube", // Apenas para vídeos do YouTube
  },
  socialMedia: [
    // Máximo de 4 itens
    // {
    //   name: "Web",
    //   icon: "/public/images/web.svg",
    //   link: "https://discord.gg/uEfGD4mmVh",
    // },
    {
      name: "Discord",
      icon: "/public/images/discord.svg",
      link: "https://discord.gg/uEfGD4mmVh",
    },
    {
      name: "YouTube",
      icon: "/public/images/youtube.svg",
      link: "https://www.youtube.com/@QBCoreBrasil",
    },
    // {
    //   name: "Instagram",
    //   icon: "/public/images/insta.svg",
    //   link: "https://discord.gg/uEfGD4mmVh",
    // },
  ],

  images: [
    "/public/images/images_1.png",
    "/public/images/images_2.png",
    "/public/images/images_3.png",
    "/public/images/images_4.png",
    // Você pode adicionar mais imagens
  ],

  songs: [
    // Você pode adicionar mais músicas
    {
      title: "Love Is a Long Road",
      artist: "Tom Petty",
      src: "/public/music/TomPetty.mp3",
      img: "/public/images/love.jpg",
    },
    // {
    //   title: "The Setup",
    //   artist: "Favored Nations",
    //   src: "/public/music/The-Setup.mp3",
    //   img: "/public/images/the-setup.jpg",
    // },
    // {
    //   title: "Welcome The Los Santos",
    //   artist: "Oh No",
    //   src: "/public/music/Welcome-To-Los-Santos.mp3",
    //   img: "/public/images/welcome-lst.jpg",
    // },
  ],

locales: {
    headerTitle: "NORTE RP",
    headerSubtitles: [
      "Bem-vindo à cidade onde sua história começa!",
      "Construa, conquiste e viva intensamente cada momento!",
    ],
    cardTitles: [
      "Roleplay de verdade, sem enrolação!",
      "Sistema completo de empregos e economias dinâmicas!",
      "Junte-se à nossa comunidade e cresça conosco!",
    ],
    cardDescriptions: [
      "Norte RP é uma cidade feita por jogadores, para jogadores. Aqui você tem liberdade para criar sua própria história, construir sua trajetória e viver o RP do jeito que sempre quis.",
      "Com sistemas otimizados, economia viva e diversos empregos, cada ação sua faz diferença no futuro da cidade. Policiais, mecânicos, médicos, empresários — todos têm papel importante aqui.",
      "Entre no nosso Discord e conecte-se com a comunidade! Participe de eventos, tire dúvidas e faça parte da construção da cidade mais promissora do Brasil.",
    ],
    serverGalleryTitle: "Momentos que Marcam",
    serverGalleryDescription: "Cada foto, uma história vivida nas ruas da cidade.",
    socialMediaText: "Siga nossas redes e fique por dentro de tudo!",
    socialMediaLinkText: "Entre para o Norte RP",
    socialMediaLinkURL: "https://discord.gg/uEfGD4mmVh",
  },
};
