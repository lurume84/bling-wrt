# Factory reset

We are connected to the Sync Module but no interaction is possible. If you press Enter a message like 

`Please press Enter to activate this console`

After this factory reset, **you will lose any information stored inside Sync Module**, the same as you pressed the reset button in the external case. An onboarding will be needed again after we make some changes on the OS.

Open a connection with Putty and connect the SyncModule, after all the data is dumped, take a look at the following text:

`Press the [f] key and hit [enter] to enter failsafe mode`

This text will appear a few seconds to allow user for selection. In case you do not see this message for a couple of seconds connect and disconnect the syncmodule. 

Before this message appears, **press f and Enter**. Following console should appear

![USB to TTL](/img/tutorial/putty4.png)

After some messages, pressing Enter shall show following console

![USB to TTL](/img/tutorial/putty5.png)

write "ls" command and the following should appear

![USB to TTL](/img/tutorial/putty6.png)

Congratulations! You now have access to your Sync module. Next step is to [Persist access](access.md)
