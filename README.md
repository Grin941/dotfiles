# dotfiles
A set of vim, zsh, git, and tmux configuration files.

## Install dotfiles
* Change **hosts** file if you need
* run command for either local or remote hosts
```
$ sudo make install_ansible
$ sudo make configure_ssh EMAIL=your@email 
$ ansible-playbook -i hosts -l local dotfiles.yml -vv --ask-become-pass
```

## Configure nvim
```
:PlugInstall
:UpdateRemotePlugins
:checkhealth
```

## Configure tmux
```
$ tmux
C-b I
```

## ctags usage
* *vim -t <tag name>* to open vim straight on the tag
* *Ctrl + ]* to jump to tag when over a word
* *g + ]* to see a list of tags
* *Ctrl + T* to pop back
* *:tselect* or *:stselect* to open
* *:tnext*, *:tprev* to go to next/prev tag file
 

## PAM: Authentfication failure error
https://askubuntu.com/questions/812420/chsh-always-asking-a-password-and-get-pam-authentication-failure/812426
