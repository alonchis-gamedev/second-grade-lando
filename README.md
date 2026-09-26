# Alonso's Lando games

Open any `.sb3` in Scratch Desktop to edit it. Save the project to the same file.

On a Mac, double-click `build.command`, choose a game by number, and it will create `builds/<game-name>.zip`. Install [Node.js](https://nodejs.org/) first. The first build installs the pinned TurboWarp Packager dependency; later builds reuse it. Upload that ZIP to the game's HTML page on itch.io.

To add a game, place its `.sb3` in the same folder and run `build.command` again. The menu finds it automatically. You can also run `node build-game.js "game-name"` directly.

The `.sb3` files are the editable source. The `builds/` folder contains generated files and is ignored by Git.
