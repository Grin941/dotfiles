# dotfiles
A set of vim, zsh, git, and tmux configuration files.

# install ctags
```apt install exuberant-ctags```

# install silversearcher
```apt install silversearcher-ag```

# Install fonts
```
git clone https://github.com/ryanoasis/nerd-fonts.git --depth=1
cd nerd-fonts
./install.sh Hack
cd ../
rm -rf nerd-fonts/
```

# Configure fonts
Open Terminal -> Right Click -> Profiles -> Profile Preferences -> General
Select Custom font -> Hack Regular

# install nvim
```
mkdir ~/.config/nvim
apt install software-properties-common
add-apt-repository ppa:neovim-ppa/stable
apt update
apt install neovim
apt install python-dev python-pip python3-dev python3-pip
update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
update-alternatives --config vi
update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
update-alternatives --config vim
update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
update-alternatives --config editor
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/.config/nvim
vim ~/.config/nvim/init.vim
```

# Configure vim
:Pluginstall
:checkhealth

# install flake8
```
apt install flake8
vim ~/.config/flake8
```

# Install zsh
```
apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)
vim ~/.zshrc
```

# install tmux
```
apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
vim ~/.tmux.conf
```

# Configure tmux
C-b I

# install fzf
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
export FZF_DEFAULT_OPTS="--reverse --height=40%"
```
