const sh = require('shelljs')
const Chalk = require('chalk')

function install(): void {
  if (sh.test('-d', '/Applications/Rectangle.app')) {
    console.log(Chalk.magenta('rectangle already installed'))
    return
  }

  if (sh.which('brew')) {
    sh.exec('brew install --cask rectangle')
    return
  }

  console.log(Chalk.bgRed.bold('brew required to install rectangle'))
}

export { install }
