# Vim setup
## Resources
- follow instructions from: https://www.youtube.com/watch?v=n9k9scbTuvQ
## Setup
- remove initial contents:
```
rm -rf ~/vim
rm -rf ~/.vimrc
```
- put contents of `vimrc` file into `~/.vimrc` (has to be created if not existing)    
- install plugins from within vim: `:PlugInstall`  
- go to into `~/.vim/plugged/YouCompleteMe` and execute:
```
./install.py --all
```
- afterwards you should be able to use the according plugins with autocompletion
