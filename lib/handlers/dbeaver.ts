const sh = require('shelljs')
const Chalk = require('chalk')

function install(): void {
  if (sh.test('-d', '/Applications/DBeaver.app')) {
    console.log(Chalk.magenta('dbeaver already installed'))
    return
  }

  if (sh.which('brew')) {
    sh.exec('brew reinstall --cask dbeaver-community')
    return
  }

  console.log(Chalk.bgRed.bold('brew required to install dbeaver'))
}

export { install }
