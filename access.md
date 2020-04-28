# Persist access

System is now factory reset and console is accessible but we would lose this access right after onboarding because of security restrictions. We will apply following actions so we can access Sync Module after the onboarding process.

1. Ensure you are connected to the Sync Module with the USB to TTL device

1. Delete Sync Module from the Blink Application.

1. Add the Sync Module again from the Blink Application.

1. Wait until onboarding process has finished (you can see your cameras again in the app)

1. Execute following commands

`sed -i "s/::askconsole:\/bin\/false/::askconsole:\/bin\/ash --login/g" /etc/inittab`

`mv /root/apps/connection/check_login.lua /root/apps/connection/check_login.old.lua`

`printf "#!/usr/bin/lua\n\nfunction check_login(serial_number)\nend" > /root/apps/connection/check_login.lua`

6. Reboot Sync Module

7. After boot is completed, press Enter and you should go to the console instead of receiving the previous message

We have persisted the access to the Sync Module after the onboarding process so we are now able to make customizations to our device while the device is in its normal usage. Depending on the reasons to customize your Sync Module, you may leave the tutorial here as you have full access to your device.

However, if you are interested in the applications described in this tutorial, continue with [Certificates](certs.md)
