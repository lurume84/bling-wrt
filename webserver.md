# Web Server

This service is not mandatory unless you want to run [Bling Viewer](https://github.com/lurume84/bling-viewer) or expose information related with the Sync Module in a web server accessible in your intranet. This is very interesting for IFTTT and many other ideas.

There is a webserver already installed but disabled by default. Happens the same as with the SSH Server, any person connected to your wifi could access the webserver. We cannot avoid an access but at least we can encrypt them using certificates. If you plan to use Bling viewer that project will take care of the access because of its login so both cases are covered.

1. Execute following command to remove HTTP so HTTPS is the only server available:

`sed -i "s/list listen_http '0.0.0.0:80'//g" /etc/config/uhttpd`

2. Point to the certificates generated before

`sed -i "s/uhttpd.crt/ssl\/mycert.crt/g" /etc/config/uhttpd`
`sed -i "s/uhttpd.key/ssl\/mycert.key/g" /etc/config/uhttpd`

3. Start the service

`/etc/init.d/uhttpd start`

4. Open a browser in your computer and navigate to https://<synmodule_ip>. A security warning should appear informing that the certificate is not trusted (it is self-signed). Click on more info and continue.

5. A couple of links are shown, this is the Sync Module's www folder. Click in ssids

6. Click on the left of the navigation bar where says "Not secure", then click on Certificate and check it is the one you generated

7. Set the service to start automatically

`/etc/init.d/uhttpd enable`

`sed -i 's/os.execute("\/etc\/init.d\/uhttpd stop")//g' /root/apps/connection/sync_module`

8. Reboot the device and check web application is accessible

We are all set! Next step is to add [USB support](usb.md) 
