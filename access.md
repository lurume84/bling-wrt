# Persist access

First things first, execute "passwd" and set a password to your root user. Make sure you do not foget this password as will be needed for any future action. 

<table>
<tr><td><img width="100" height="100" src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Info_icon-72a7cf.svg/1200px-Info_icon-72a7cf.svg.png"></td><td>Protect root user with a password executing "passwd"</td></tr>
</table>

System is now factory reset and console is accessible but we would lose this access right after onboarding because of security restrictions. We will apply following actions so we can access Sync Module after the onboarding process.

1. Ensure you are connected to the Sync Module with the USB to TTL device

1. Delete Sync Module from the Blink Application.

1. Add the Sync Module again from the Blink Application.

1. Wait until onboarding process has finished (you can see your cameras again in the app)

1. Execute following command
`sed "s/::askconsole:\/bin\/false/::askconsole:\/bin\/ash --login/g" /etc/inittab`

1. Reboot Sync Module

1. After boot is completed, press Enter and you should go to the console instead of receiving the previous message

We have presisted the access to the Sync Module after the onboarding process so we are now able to make customizations to our device while the device is in its normal usage. Depending on the reasons to customize your Sync Module, you may leave the tutorial here as you have full access to your device. However, if you want to get access to all the resources explained in this tutorial, continue with [Certificates](certs.md)
