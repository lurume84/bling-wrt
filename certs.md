# Certificates

Before enabling other services, we will generate self-signed certificates for securing connections. Despite being self-signed, communication will be secured. Open a conenction with the Sync Module and execute the following

`mkdir /etc/ssl`

`cd /etc/ssl`

`opkg update && opkg install openssl-util`

`openssl req -x509 -nodes -days 3000 -newkey rsa:2048 -keyout mycert.key -out mycert.crt`

Last command will ask for several parameters, put whatever you want but here is an example 

`Country Name (2 letter code) [AU]:US`

`State or Province Name (full name) [Some-State]:Massachusetts`

`Locality Name (eg, city) []:Boston`

`Organization Name (eg, company) [Internet Widgits Pty Ltd]:Amazon`

`Organizational Unit Name (eg, section) []:Blink`

`Common Name (e.g. server FQDN or YOUR name) []:*.immedia-semi.com`

`Email Address []:admin@immediasemi.com`

There are now two files in /etc/ssl that will be used for encrypting communications. In case someday you need the key encrypted in pem format you can execute following commands

`openssl pkcs12 -export -in mycert.crt -inkey mycert.key -out mycert.p12`

`openssl pkcs12 -in mycert.p12 -nodes -out mycert.pem`

We have created self-signed certificates that will secure the services we are going to start up in the section [SSH server](sshserver.md)
