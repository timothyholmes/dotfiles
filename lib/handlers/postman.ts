const sh = require('shelljs')
const Chalk = require('chalk')

function install(): void {
  if (sh.test('-d', '/Applications/Postman.app')) {
    console.log(Chalk.magenta('postman already installed'))
    return
  }

  if (sh.which('brew')) {
    sh.exec('brew reinstall --cask postman')
    return
  }

  console.log(Chalk.bgRed.bold('brew required to install postman'))
}

export { install }
