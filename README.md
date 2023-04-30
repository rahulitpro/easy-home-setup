# easy-home-setup

* This is tested on oracle cloud always free arm64 ubuntu with 4 CPU 24 GB RAM and 200 GB Storage
* According to performance I believe we can we can run it on 6 GB RAM also, but not tested.
* Mostly works on x86_64 also 

Need three domain entry

* CNAME record www pointing to your domain name.
* A record @ pointing to public ipaddress of your server
* A record * pointing to public ipaddress of your server

Modify ingress rules in security list/NSG in cloud

* add port 80/TCP available for world
* add port 44/TCP available for world 
* add port 53/TCP available only for home public CIDR address like (12.34.56.78/32) 
* add port 53/UDP available only for home public CIDR address like (12.34.56.78/32) 
* add port 51820/UDP available for world so you can connect wireguard vpn from anyware 

Run PreReq script
* sh install_prereqs.sh
* relogin to the server to set docker as a group to current user

Run script to create enviroment file .env
* sh create_enviroment_file.sh  
* it will ask so many questions and please dont leave any answer blank, no default answers set.

Install Pre-Req Dockers Traefik, Authelia and mariaDB

1. Run ./install_traefik.sh
2. Run ./install_authelia.sh
3. Run ./install_mariadb.sh

After this you can run any Install scripts in your required order or your can leave any of that if you do not need that application. Please let me know if you find any bug :) 
