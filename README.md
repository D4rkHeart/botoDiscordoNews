# Discord Botonews

The principle of this repo is to retrieve data from botonews using an API and display data on discord.

![](https://i.imgur.com/T72orS0.png)

## Goals

- `/botonews`: displays the default news from the Botonews API from the `/news` endpoint
- `/botonews help`: displays all the bot commands
- `/botonews [source]`: displays the 3 latest news of the source (e.g. `/botonews actu`)
- `/botonews [source] [x]`: displays the x latest news of the source (e.g. `/botonews actu 10`)
- `/botonews [source1,source2,source3]`: displays the 3 latest news of the source1, source2, source3, etc... (e.g. `/botonews actu,goepfl,hackernews`)
- `/botonews [source1,source2,source3] [x]`: displays the x latest news of the sourcea, source2, source3, etc... (e.g. `/botonews actu,goepfl,hackernews 10`)
- `/botonews random`: displays some random news
- `/botonews random [x]`: displays x number of random news

Note:
  - Should uses the slash commands (https://discord.com/blog/slash-commands-are-here), which can use option arguments (https://discord.com/developers/docs/interactions/application-commands#slash-commands)
![](https://i.imgur.com/sRHUTwB.png)

  - Subcommands and Subcommand Groups can be helpful too: https://discord.com/developers/docs/interactions/application-commands#subcommands-and-subcommand-groups


## Used technology

- [Ruby](https://www.ruby-lang.org)
- [discrodrb](https://github.com/shardlab/discordrb)
- [dotenv](https://www.npmjs.com/package/dotenv)
- [botonews API](https://github.com/ponsfrilus/botonews/blob/main/ROUTES.md)
- [Docker](https://www.docker.com/)