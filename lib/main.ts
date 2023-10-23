import Chalk from 'chalk'
import Clear from 'clear'
import Figlet from 'figlet'
import Inquirer from 'inquirer'

import { install as nvmInstall } from './handlers/nvm'
import { install as homebrewInsall } from './handlers/homebrew'
import { install as hyperInstall } from './handlers/hyper'
import { install as vscodeInstall } from './handlers/vscode'
import { install as codiumInstall } from './handlers/codium'
import { install as zshInstall } from './handlers/zsh'
import { install as powerlineFontsInstall } from './handlers/powerlineFonts'
import { install as postmanInstall } from './handlers/postman'
import { install as rectangleInstall } from './handlers/rectangle'

const handlers = new Map<string, () => void>([
  ['nvm', nvmInstall],
  ['homebrew', homebrewInsall],
  ['hyper', hyperInstall],
  ['vscode', vscodeInstall],
  ['codium', codiumInstall],
  ['oh-my-zsh', zshInstall],
  ['powerline-fonts', powerlineFontsInstall],
  ['postman', postmanInstall],
  ['rectangle', rectangleInstall],
])

const installMethods = new Map<string, (choices: Array<string>) => Promise<Array<string>>>([
  ['golden gun', async (choices) => [...choices]],
  ['à la carte', async (choices) => {
    const { tooling } = await Inquirer.prompt([
      {
        name: 'tooling',
        type: 'checkbox',
        message: 'Select the tooling you would like to install (homebrew and nvm required on system):',
        choices
      }
    ])

    return tooling
  }]
])

Clear()
console.log(
  Chalk.redBright(
    Figlet.textSync(
      'dotfiles',
      {
        horizontalLayout: 'full',
        verticalLayout: 'fitted'
      }
    )
  )
)

const run = async () => {
  const { chosenMethod } = await Inquirer.prompt([
    {
      name: 'chosenMethod',
      type: 'list',
      message: 'Select the install method',
      choices: [...installMethods.keys()]
    }
  ])

  let tooling: Array<string>

  tooling = await installMethods.get(chosenMethod)!([...handlers.keys()])

  try {
    for (const tool of tooling) {
      console.log(Chalk.blueBright.bold(`Installing ${tool}...`))
      handlers.get(tool)!()
    }
    console.log(Chalk.greenBright.bold('dotfiles setup complete'))
  } catch (error) {
    console.log(Chalk.redBright.bold(`Error installing tools.`))
    console.log(error)
  }
}

export { run }
