const sh = require('shelljs')
const Chalk = require('chalk')

function install(): void {
  if (sh.which('brew')) {
    console.log(Chalk.magenta('homebrew already installed'))
    return
  }

  sh.exec('/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"')
  
  if (sh.test('-f', '~/.bashrc')) sh.exec('source ~/.bashrc')
  if (sh.test('-f', '~/.zshrc')) sh.exec('source ~/.zshrc')
}

export { install }
