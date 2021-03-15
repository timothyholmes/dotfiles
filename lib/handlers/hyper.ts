const sh = require('shelljs')
const Chalk = require('chalk')

function install(): void {
  if (sh.which('hyper')) {
    console.log(Chalk.magenta('hyper already installed'))
  } else {
    sh.exec('brew update')
    sh.exec('brew reinstall --cask hyper')
  }

  console.log(Chalk.bgMagenta('syncing hyper configs...'))

  sh.cp(`${process.cwd()}/assets/hyper.js`, '~/.hyper.js')
}

export { install }
