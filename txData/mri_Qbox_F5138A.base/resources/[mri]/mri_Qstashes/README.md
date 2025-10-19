# mri_Qstashes

Sistema avançado de baús (stashes) para servidores FiveM, totalmente gerenciável in-game por administradores, com permissões configuráveis, integração com ox_inventory, menus contextuais e suporte a múltiplos idiomas.

---

## Funcionalidades

- **Criação, edição, teleporte e exclusão de baús** diretamente pelo jogo, via menu administrativo.
- **Permissões de administração** configuráveis via ace ou grupos customizados.
- **Proteção total**: apenas administradores podem acessar e executar ações administrativas.
- **Menu intuitivo**: todos os baús listados, com submenu para cada ação (editar, teleportar, excluir).
- **Configuração fácil** de slots, peso, senha, job, gang, rank, item necessário, citizenID, label e webhook.
- **Integração com ox_inventory** e ox_target para interação 3D.
- **Logs via webhook** para movimentações nos baús.
- **Suporte a múltiplos idiomas** (en, pt-br).

---

## Dependências

- [ox_lib](https://github.com/overextended/ox_lib)
- [ox_target](https://github.com/overextended/ox_target)
- [ox_inventory](https://github.com/overextended/ox_inventory)
- [qbx_core](https://github.com/qbcore-framework/qb-core) (ou similar)

---

## Instalação

1. Baixe e coloque a pasta `mri_Qstashes` em `resources/[mri]`.
2. Adicione no seu `server.cfg`:
   ```
   ensure mri_Qstashes
   ```
3. Dê permissão ace para os administradores no seu `server.cfg`:
   ```
   add_ace group.admin admin allow
   ```
   Ou ajuste conforme sua configuração de permissões.

---

## Configuração

Arquivo: `shared/Config.lua`
```lua
Config = {}
Config.Command = "bau" -- Comando para abrir o menu admin
Config.Defaultslot = 50 -- Slots padrão do baú
Config.Defaultweight = 1000 -- Peso padrão (em kg)
Config.DefaultMessage = "Abrir baú" -- Mensagem padrão do alvo
Config.Debug = false -- Ativa debug
Config.AdminPerms = { "admin" } -- Permissões ace para admin (pode adicionar mais, ex: {"admin", "god"})
```

---

## Como usar

- **Abertura do menu admin:**  
  Use o comando configurado (`/bau` por padrão) no chat. Apenas administradores podem abrir.
- **No menu:**  
  - "Criar novo baú": permite criar um novo baú no local desejado (usando raycast).
  - Clique em qualquer baú listado para abrir o submenu:
    - **Editar:** altera todas as configurações do baú.
    - **Teleportar:** leva seu personagem até o baú.
    - **Excluir:** remove o baú do servidor.
- **Acesso ao baú:**  
  Os jogadores interagem normalmente via ox_target, respeitando as restrições de job, gang, item, senha, etc.

---

## Localização

- Arquivos de idioma em `locales/en.json` e `locales/pt-br.json`.
- Adapte conforme necessário para seu servidor.

---

## Segurança

- Todas as ações administrativas são protegidas tanto no client quanto no server.
- Apenas quem possui permissão definida em `Config.AdminPerms` pode criar, editar ou excluir baús.

---

## Créditos

- [wNpcCreator](https://github.com/WhereiamL/wNpcCreator/) (menu system)
- [md-stashes](https://github.com/Mustachedom/md-stashes) (base)
- [ox_doors](https://github.com/overextended/ox_doors/) (raycast system)

---

# English Version

# mri_Qstashes

Advanced stash system for FiveM servers, fully manageable in-game by administrators, with configurable permissions, ox_inventory integration, contextual menus and multi-language support.

---

## Features

- **Create, edit, teleport and delete stashes** directly in-game via the admin menu.
- **Configurable admin permissions** via ace or custom groups.
- **Full protection**: only admins can access and perform administrative actions.
- **Intuitive menu**: all stashes listed, with a submenu for each action (edit, teleport, delete, move).
- **Easy configuration** of slots, weight, password, job, gang, rank, required item, citizenID, label and webhook.
- **Integration with ox_inventory** and ox_target for 3D interaction.
- **Webhook logs** for stash item movements.
- **Multi-language support** (en, pt-br).

---

## Dependencies

- [ox_lib](https://github.com/overextended/ox_lib)
- [ox_target](https://github.com/overextended/ox_target)
- [ox_inventory](https://github.com/overextended/ox_inventory)
- [qbx_core](https://github.com/qbcore-framework/qb-core) (or similar)

---

## Installation

1. Download and place the `mri_Qstashes` folder in `resources/[mri]`.
2. Add to your `server.cfg`:
   ```
   ensure mri_Qstashes
   ```
3. Give ace permission to admins in your `server.cfg`:
   ```
   add_ace group.admin admin allow
   ```
   Or adjust according to your permission system.

---

## Configuration

File: `shared/Config.lua`
```lua
Config = {}
Config.Command = "bau" -- Command to open the admin menu
Config.Defaultslot = 50 -- Default stash slots
Config.Defaultweight = 1000 -- Default weight (in kg)
Config.DefaultMessage = "Open stash" -- Default target message
Config.Debug = false -- Enable debug
Config.AdminPerms = { "admin" } -- Ace permissions for admin (can add more, e.g.: {"admin", "god"})
```

---

## How to use

- **Open admin menu:**  
  Use the configured command (`/bau` by default) in chat. Only admins can open.
- **In the menu:**  
  - "Create new stash": allows you to create a new stash at the desired location (using raycast).
  - Click any listed stash to open the submenu:
    - **Edit:** change all stash settings.
    - **Move:** change the stash location.
    - **Teleport:** teleport your character to the stash.
    - **Delete:** remove the stash from the server.
- **Accessing the stash:**  
  Players interact normally via ox_target, respecting job, gang, item, password, etc. restrictions.

---

## Localization

- Language files in `locales/en.json` and `locales/pt-br.json`.
- Adapt as needed for your server.

---

## Security

- All admin actions are protected both on client and server.
- Only those with permission defined in `Config.AdminPerms` can create, edit or delete stashes.

---

## Credits

- [wNpcCreator](https://github.com/WhereiamL/wNpcCreator/) (menu system)
- [md-stashes](https://github.com/Mustachedom/md-stashes) (base)
- [ox_doors](https://github.com/overextended/ox_doors/) (raycast system)
