# SSH server

Connection with Sync Module is done directly to the device using a serial communication. This is not the best way in terms of speed and ease but it is secure as physical access to the device is needed. On the other hand, moving files up and down are needed for the next steps so it is quite recommended to enable a SSH Server. This comes with a security risk as anyone connected in your local network could connect to your Sync Module since it is unprotected. That's the reason why Blink disabled this service by default.

There are two ways to secure this SSH Server:

* Password-protect user
* Certificates

If you haven't done it yet, set a password to the root user with "passwd" command. Any connection to the SSH Server with this user will ask for that password so ensure it is complex enough.

The second way implies certificates, it's the best option but at this point I will not invest time detailing it. Please check for a tutorial on setting authentication keys for Dropbear SSH Server.

1. Now that we have our user secured, execute following command

`sed -i "s/option enable       '0'/option enable       '1'/g" /etc/config/dropbear`

2. You can either reboot or manually start it with following command:

`/etc/init.d/dropbear start`

3. Execute `ifconfig` and copy the ip for wlan0 interface that appears after inet addr

4. Open another Putty application and leave the connection type as SSH, then write in Host name input that IP.

5. Click on Open and wait for credentials. User root and password the want you set before.

6. You should have access to the terminal the same as through COM.

7. Reboot and test again to confirm access is persisted

If you have access after reboot, you are safe to disconnect the USB to TTL device and put the Sync Module cover as it is no longer needed. Now it's time to set up a webserver for hosting out scripts so move to [Web Server](webserver.md) section.
