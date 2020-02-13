# OVH Dynamic Host
This repo contain a bash script for updating **OVH** dynamic host.

## How to use
Firstly, you must set some environments variables :
- OVH_USERNAME *(your DynHost username)*
- OVH_PASSWD *(your DynHost password)*
- OVH_HOSTNAME *(your DynHost subdomain)*

### Run the script
This script set an environment variable to store external ip address and compare it to check if your ip address have change.
The variable is **EXTERNAL_IP**.
If you want the script to work correctly you must run it like this :

```
# If you have set the environments variables (don't forget the first dot)
$ . ./dynHost.bash
# else run it with
$ OVH_USERNAME="my_username" OVH_PASSWD="my_passwd" OVH_HOSTNAME="my_hostname" . ./dynHost.bash 
```