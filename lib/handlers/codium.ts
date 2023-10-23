const sh = require('shelljs')
const Chalk = require('chalk')

function install(): void {
  if (!sh.which('codium')) {
    sh.exec('brew reinstall vscodium')
    return
  } else {
    console.log(Chalk.magenta('vscode already installed'))
  }
  
  console.log(Chalk.bgMagenta('syncing vscode configs...'))

  sh.cp(`${process.cwd()}/assets/settings.json`, '~/Library/Application\\ Support/VSCodium/User/')
  sh.cp(`${process.cwd()}/assets/keybindings.json`, '~/Library/Application\\ Support/VSCodium/User/')
  sh.exec('./assets/vscode_extensions.sh')
}

export { install }
