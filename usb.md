# USB support

Get a Pen Drive or HDD USB big enough to store all your videos from the cloud, remove any partition and place it in the Sync Module.

Bad news are this OpenWRT version does not support NTFS so data will not be directly visible from Windows. We will have to format it to EXT2 and use an application to read its content or connect using WinSCP and move videos from USB to your computer (not a big deal).

1. Execute `ls /dev`
1. Check if sda or sdb exists. If so, remember the value sda1 or sdb1
1. Execute `mkdir /mnt/usb`
1. Execute `mount /dev/sda1 /mnt/usb`
1. 

