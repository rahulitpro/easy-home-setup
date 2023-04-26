# easy-home-setup

need three domain entry

* CNAME record wwww pointing to your domain name.
* A record @ pointing to public ipaddress of your server
* A record * pointing to public ipaddress of your server

modify ingress rules in security list/NSG in cloud

* add port 80/TCP available for world
* add port 44/TCP available for world 
