
**To install:** 

```console
$ make
```

This will create symlinks from this repo to your home folder.

# Install vim plugin manager
```bash
# Install vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Configure nvim
```bash
# Install neovim
brew install neovim

# Configure to use .vimrc config
mkdir -p ~/.config
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim
```

### Update remote plugins for NVIM
```bash
:PlugInstall
:UpdateRemotePlugins
```

### Fuzzy search
```bash
# Install jump for fuzzy directory search.
go get github.com/gsamokovarov/jump
```

For the complete version check out [jessfraz dotfiles](https://github.com/jessfraz/dotfiles)
