# USB to TTL device

![USB to TTL](https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSf_r5Ou7ew-gL5mLn6-skFK9pBRMi02i3JJjeLUS7AF681WkNJc6hs9qinT6CexQtxuhymcOM&usqp=CAc)

Buy one USB to TTL device, Internet is plenty of them. Here is the [link](https://www.amazon.es/gp/product/B07BBPX8B8) for the one I use. It's more expensive but it's protected against dust and comes with the cables. It will only be used to open a backdoor for later connecting through network so the cheapest one it's ok I guess.

<b>Here comes the dangerous part</b>

<table>
<tr><td><img width="100" height="100" src="https://t3.ftcdn.net/jpg/01/91/66/02/240_F_191660228_OpUuyY7qnyUdUKVKrQfDRmNkPOKnky1z.jpg"></td><td>Identify the VCC pin and <b>do not connect anything there during the whole process</td></tr>
</table>

Locate three pins in the SyncModule with the name J3 in it

![Pins](img/tutorial/IMG_20200426_224200_pins.jpg)

Identify GND, RX and TX in your USB to TTL device and:

* Connect your RX pin to the Sync Module TX pin
* Connect your TX pin to the Sync Module RX pin
* Connect your GND pin to the Sync Module GND pin

You can see my connections here

![Sync Module](img/tutorial/IMG_20200426_224135_1.jpg)
![USB to TTL](img/tutorial/IMG_20200426_225515_1.jpg)

You are done! Let's [test the connection](connect.md)
