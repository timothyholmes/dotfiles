const sh = require('shelljs')

function install(): void {
  sh.exec('git clone https://github.com/powerline/fonts.git --depth=1')
  sh.cd('fonts')
  sh.exec('./install.sh')
  sh.cd('..')
  sh.exec('rm -rf fonts')
}

export { install }
