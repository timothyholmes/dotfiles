# dotfiles

Personal machine setup framework in TypeScript

![](https://media.giphy.com/media/1ybnh8CsoWoko/giphy.gif)

## Usage

Compile TS, start, follow the prompts.

```
npm run tsc
npm start
```

Two install methods: `golden gun` and `à la carte`.

Golden gun installs all available tooling and syncs any associated settings.

À la carte presents a menu and allows a user to select and deselect applications
to install using the arrow and space bars. Use enter to run the installs once
the menu items are selected.

## Supported Tools

The following tools can be installed with Dotfiles. Settings sync occurs for hyper, bash/zsh, and VSCode. `assets/` houses all of the settings files.

- [nvm](https://github.com/nvm-sh/nvm)
- [hyper](https://hyper.is/)
- [vscode](https://code.visualstudio.com/)
- [dbeaver](https://dbeaver.io/)
- [ohmyzsh](https://ohmyz.sh/)
- [postman](https://www.postman.com/)
- [homebrew](https://brew.sh/)
- [powerline fonts](https://github.com/powerline/fonts)

## Extension

To add a new tool, create a new `handler` file that exposes and named function `install` which handles the installation and settings sync for the new tool.

Add the new handler to the `handlers` array in `lib/main.js`. 💡 Would love if this step was unnecessary, the handlers could definitely be programmatically pulled in with a code change.