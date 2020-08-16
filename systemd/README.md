# Systemd
This directory features some of the services/daemons on my systems that are started during the bootstrapping process. 
The `*.service` files must be placed at `/etc/systemd/system/`. The `*.sh` files must be placed at `/usr/bin/`.  
If there are modifications to the service files or scripts, then reload the daemons with:
```
sudo systemctl daemon-reload
```
This ensures that the changes take effect in the init system. Afterwards, the different services, e.g. terminator service, can be started or enabled:
```
sudo systemctl enable terminator.service
```
Be aware that browsers, e.g. firefox service, should not be started as root user as this would give root privileges to the browser in case of corruption.
# Systemd services
* Firefox service: starts a firefox window on boot  
* Terminator service: starts a terminator window on boot  
* Pull git repos service: pulls files from remote repos for all local git repos on boot, thus makes sure that the local repos are up-to-date 
