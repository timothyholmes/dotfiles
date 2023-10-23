const sh = require('shelljs')
const Chalk = require('chalk')
const Fs = require('fs')

function install(): void {
  if (sh.test('-d', '~/.nvm')) {
    console.log(Chalk.magenta('nvm already installed'))
    return
  }

  sh.exec('curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash')

  if (sh.test('-d', '~/.nvm')) {
    console.log(Chalk.green('nvm installed successfully'))
    
    for (const rcFile of ['.bashrc', '.zshrc']) {
      if (sh.test('-f', `~/${rcFile}`)) {
        Fs.appendFileSync(`~/${rcFile}`, 'export NVM_DIR="/root/.nvm"')
        Fs.appendFileSync(`~/${rcFile}`, '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm')
        sh.exec(`source ~/${rcFile}`)
      }
    }

    sh.exec('source ~/.nvm/nvm.sh')
    sh.exec('nvm install --lts')
    sh.exec('nvm install 20')
    sh.exec('nvm alias default 20')
  } else {
    console.log(Chalk.bgRed.bold('nvm install failed'))
  }
}

export { install }
