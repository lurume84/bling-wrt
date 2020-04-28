# USB support

Get a pendrive or HDD USB big enough to store all your videos from the cloud and follow these steps:

1. Connect the USB in the Sync module
1. Execute `opkg update`
1. Execute `opkg install kmod-fs-ext4`
1. Execute `ls /dev`
1. Check if sda or sdb exists in the list. If you have sda or sdb followed by numbers like sda1 sda2 sdb1 sdb2 you have partitions in the USB. It's not a problem but you will have to decide which partition you want to use
1. Execute `mkfs.ext4 /dev/sda`. Change sda to sdb or sda1 or sdb1 depending on your values from previous step
1. Execute `mkdir /mnt/usb`
1. Execute `mount /dev/sda /mnt/usb`. We have mounted the USB in /mnt/usb folder

We have configured the USB but will do some tests before continuing

1. Execute `echo "Hello World" > /mnt/usb/hello`
1. Execute `umount /mnt/usb`. This will disconnect the device
1. Remove the USB from the Sync Module and connect it to your computer.
1. Open the USB disk and check there is a hello file containing "Hello World"

Every time you connect the USB you will have to mount it executing the `mount /dev/sda /mnt/usb` command.

We now have USB support for storing anything we want from any application...like a [Video downloader](videos.md)!
