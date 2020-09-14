# Jibs z shell config

- Jib also uses Oh-My-Zsh:
    - https://www.howtogeek.com/362409/what-is-zsh-and-why-should-you-use-it-instead-of-bash/#:~:text=ZSH%2C%20also%20called%20the%20Z,switching%20over%20is%20a%20breeze.
- Which was installed via this command:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
- NB: installing oh-my-zsh will overwrite any existing `~/.zshrc`
- The ./apply.sh script appends the contents to `./zshrc`
- More customisation to come! 