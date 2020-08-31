# My Linux Journey
This repository features all my adventures, configurations and experiments on Linux. Refer to the `README` files in the different sub-directories for more information.

# Current Setup
![](./desktop-screenshot.png)

## Install Script
You can use the script `install_script.sh` to automatically get the same setup. If you just want to execute it, make sure to follow this order:  
1. execute the install script:
```
./install_script.sh
```  
2. When `oh-my-zsh` is downloaded enter `Y` for zsh to become the default shell.
3. Afterwards execute the `install_script.sh` again. This should install the rest.  
4. The `.vimrc` file will have some issues with plugin installs, that is why a manual vim configuration is recommended. Enter `vim` in the command line and in vim itself type `:PlugInstall`. This should install all the missing plugins. Afterwards enter `~/.vim/plugged/YouCompleteMe/install.py`. 
5. Log out and log in again with `i3` workspace selected. 
6. Now everything should be configured exactly like my setup.  
