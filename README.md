# dotfiles
A set of vim, zsh, git, and tmux configuration files.

## Install ctags
```apt install exuberant-ctags```

## Install silversearcher
```apt install silversearcher-ag```

## Install fonts
```
git clone https://github.com/ryanoasis/nerd-fonts.git --depth=1
cd nerd-fonts
./install.sh Hack
cd ../
rm -rf nerd-fonts/
```

## Configure fonts
Open Terminal -> Right Click -> Profiles -> Profile Preferences -> General
Select Custom font -> Hack Regular

## Install zsh
```
apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)
vim ~/.zshrc
```

## Install fzf
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
export FZF_DEFAULT_OPTS="--reverse --height=40%"
```

## Haskell dev
```
curl -sSL https://get.haskellstack.org/ | sh
stack install hindent
stack install hlint
```

## Install pyenv
```
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshenv
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshenv
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshenv
echo -e 'if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then\n\tsource "${VIRTUAL_ENV}/bin/activate"\nfi' >> ~/.zshenv
exec "$SHELL"
pyenv update
```

## Install python neovim
```
pyenv install 2.7.15
pyenv install 3.7.1
pyenv virtualenv 2.7.15 neovim2
pyenv virtualenv 3.7.1 neovim3
pyenv activate neovim2
pip install neovim
pyenv activate neovim3
pip install neovim
```

## Install node.js
```
apt install nodejs
apt install npm
```

## Install neovim for node.js
```
npm install -g neovim
npm -g install typescript
```

## Install nvim
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
source ~/.config/nvim/init.vim
```

## Configure nvim
```
:PlugInstall
:UpdateRemotePlugins
:checkhealth
```

## Install flake8
```
apt install flake8
vim ~/.config/flake8
```

## Install tmux
```
apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
vim ~/.tmux.conf
source ~/.tmux.conf
```

## Configure tmux
```
$ tmux
C-b I
```
