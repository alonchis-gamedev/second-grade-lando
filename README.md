# Alonso's Lando games

Open `flower-garden.sb3` in Scratch Desktop to edit it. Save the project to the same file.

On a Mac, double-click `flower-garden.command` to build the browser version. Install [Node.js](https://nodejs.org/) first. The first build installs the pinned TurboWarp Packager dependency; later builds reuse it. Upload `builds/flower-garden.zip` to the HTML game on itch.io.

For each new game named `new-game.sb3`, copy `flower-garden.command` to `new-game.command` and change the last `node build-game.js flower-garden` line to `node build-game.js new-game`.

The `.sb3` files are the editable source. The `builds/` folder contains generated files and is ignored by Git.
