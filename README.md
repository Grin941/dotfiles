# dotfiles
A set of vim, zsh, git, and tmux configuration files.

## Local machine configuration
```
$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
$ eval "$(ssh-agent -s)"
$ ssh-add ~/.ssh/id_rsa
$ sudo apt install ansible
```

## Target machine configuration
Copy ssh key to remote machine
```
$ [ cat /home/local_user/.ssh/id_rsa.pub >> /home/remote_user/.ssh/authorized_keys ]
$ ssh-copy-id username@hostname
```
Set permissions on the target machine
```
$ chmod 755 ~/.ssh
$ chmod 600 ~/.ssh/authorized_keys
```

Install python on remote machine for Ansible
```
$ sudo apt update
$ sudo apt upgrade
$ sudo apt install -y python
```

## Install dotfiles
* Change hosts if you need
* run comman for either local or remote hosts
```
$ ansible-playbook -i hosts -l local dotfiles.yml -vv --ask-become-pass
```
If you have error with ssh keys try to run:
```
$ ssh-keygen -f "/home/local_user/.ssh/known_hosts" -R "remote_ip"
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
* vim -t <tag name> to open vim straight on the tag
* Ctrl+] to jump to tag when over a word
* g+] to see a list of tags
* Ctrl+T to pop back
* :tselect or :stselect to open
* :tnext, :tprev to go to next/prev tag file
