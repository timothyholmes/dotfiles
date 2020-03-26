const sh = require('shelljs')
const Chalk = require('chalk')

function install(): void {
  if (sh.test('-d', '~/.oh-my-zsh')) {
    console.log(Chalk.magenta('oh-my-zsh already installed'))
  } else {
    sh.exec('sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"')
    sh.exec('npm i -g spaceship-prompt')
  }

  console.log(Chalk.bgMagenta('syncing zsh configs...'))

  sh.cp(`${process.cwd()}/assets/zshrc`, '~/.zshrc')
  sh.cp(`${process.cwd()}/assets/aliases`, '~/.aliases')
  sh.cp(`${process.cwd()}/assets/vimrc`, '~/.vimrc')
}

export { install }
