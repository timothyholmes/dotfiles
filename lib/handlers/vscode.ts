import sh from 'shelljs'
import Chalk from 'chalk'

function install(): void {
  if (!sh.which('code')) {
    sh.exec('brew reinstall visual-studio-code')
    return
  } else {
    console.log(Chalk.magenta('vscode already installed'))
  }
  
  console.log(Chalk.bgMagenta('syncing vscode configs...'))

  sh.cp(`${process.cwd()}/assets/settings.json`, '~/Library/Application\\ Support/Code/User/')
  sh.cp(`${process.cwd()}/assets/keybindings.json`, '~/Library/Application\\ Support/Code/User/')
  sh.exec('./assets/vscode_extensions.sh')
}

export { install }
