const fs = require('node:fs');
const path = require('node:path');
const Packager = require('@turbowarp/packager');

async function main() {
  const name = process.argv[2];
  if (!name || name === '.' || name === '..' || path.basename(name) !== name || name.endsWith('.sb3')) {
    throw new Error('Usage: node build-game.js <game-name> (without .sb3)');
  }

  const root = __dirname;
  const source = path.join(root, `${name}.sb3`);
  const destination = path.join(root, 'builds', `${name}.zip`);
  const project = await Packager.loadProject(fs.readFileSync(source));
  const packager = new Packager.Packager();
  packager.project = project;
  packager.options.target = 'zip';
  packager.options.autoplay = true;

  const result = await packager.package();
  if (result.type !== 'application/zip') {
    throw new Error(`Expected a ZIP, got ${result.type}`);
  }
  fs.mkdirSync(path.dirname(destination), { recursive: true });
  fs.writeFileSync(destination, result.data);
  console.log(`Built ${destination}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
