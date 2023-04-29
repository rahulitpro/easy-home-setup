# easy-home-setup

need three domain entry

* CNAME record wwww pointing to your domain name.
* A record @ pointing to public ipaddress of your server
* A record * pointing to public ipaddress of your server

modify ingress rules in security list/NSG in cloud

* add port 80/TCP available for world
* add port 44/TCP available for world 
* add port 53/TCP available only for home public CIDR address like (12.34.56.78/32) 
* add port 53/UDP available only for home public CIDR address like (12.34.56.78/32) 

Run PreReq script
* sh install_prereqs.sh
* relogin to the server to set docker as a group to current user

Run script to create enviroment file .env
* sh create_enviroment_file.sh  
