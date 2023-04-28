# easy-home-setup

need three domain entry

* CNAME record wwww pointing to your domain name.
* A record @ pointing to public ipaddress of your server
* A record * pointing to public ipaddress of your server

modify ingress rules in security list/NSG in cloud

* add port 80/TCP available for world
* add port 44/TCP available for world 

Run PreReq script
* sh install_prereqs.sh
* relogin to the server to set docker as a group to current user

Run script to create enviroment file .env
* sh create_enviroment_file.sh  


errors
* time="2023-04-28T17:24:48Z" level=error msg="middleware \"authelia@docker\" does not exist" entryPointName=websecure routerName=monitor@docker
