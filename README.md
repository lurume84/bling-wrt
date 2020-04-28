# Homebrew for Blink Sync Module

![Blink synchronization module](https://images-na.ssl-images-amazon.com/images/I/41J-K9G0r9L._SY355_.jpg)

## Introduction

This DIY project contains tutorials and scripts for customizing the Blink synchronization module. This device is used for creating a bridge between Blink Cloud Services and Blink cameras but there is actually a powerful embedded Linux under the hood.

Modifications described here will allow to:

* Download videos automatically to a USB connected in the Sync Module.
* Run [Bling Viewer](https://github.com/lurume84/bling-viewer) for any Mac/Linux/Windows in the local network.
* Run scheduled tasks through scripts like Snooze and any other developed by the community
* Use Sync Module as DLNA Media server, BitTorrent client and many others
* Do the same things you can do with an OpenWRT Barrier Breaker 14.07

Before continuing, you will need basic knowledge of computers and a USB to TTL device:

![USB to TTL](https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSf_r5Ou7ew-gL5mLn6-skFK9pBRMi02i3JJjeLUS7AF681WkNJc6hs9qinT6CexQtxuhymcOM&usqp=CAc)

[This](https://www.amazon.es/gp/product/B07BBPX8B8) is the one I use but any USB to TTL will work and are quite inexpensive 5~10 EUR.

Follow steps described below in order but remember:

<table>
<tr><td><img width="100" height="100" src="https://t3.ftcdn.net/jpg/01/91/66/02/240_F_191660228_OpUuyY7qnyUdUKVKrQfDRmNkPOKnky1z.jpg"></td><td>These modifications may damage your SyncModule if not done properly. Proceed at your own risk</td></tr>
</table>

## Tutorial

1. Setup
   1. [Opening covers](covers.md)
   1. [USB to TTL device](usb2ttl.md)
   1. [Establishing connection](connect.md)
   1. [Factory reset](reset.md)
1. Softening
   1. [Persist access](access.md)
   1. [Certificates](certs.md)
   1. [SSH server](sshserver.md)   
   1. [Web Server](webserver.md)
1. Applications
   1. [USB support](usb.md)
   1. [Video downloader](videos.md)
   1. [Bling viewer](viewer.md)
