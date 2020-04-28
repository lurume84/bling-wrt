# Video downloader

<table>
<tr><td><img width="180" src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Info_icon-72a7cf.svg/1200px-Info_icon-72a7cf.svg.png"></td><td>This application is working but is not running as a service at this moment. You will need to manually execute it until I prepare the command lines to run it periodically</td></tr>
</table>

<table>
<tr><td><img width="100" src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Info_icon-72a7cf.svg/1200px-Info_icon-72a7cf.svg.png"></td><td>Authentication token must be manually set until I prepare the login screen through the webserver</td></tr>
</table>

1. Download /apps/get_videos.lua
1. Copy file to /root/apps/bling using WinSCP
1. Install in your computer Bling Desktop and run it.
1. Login with your credentials in the application
1. In your Windows, open %userprofile%/Documents/Bling.exe/Html/viewer/data/token.json
1. Copy the contents of the file
1. Go to Putty and execute `echo 'contents' > /root/config/auth/sm_auth2`. Where contents is the whole token you copied
1. Check it is stored correctly executing `cat /root/config/auth/sm_auth2`
1. Execute `lua /root/apps/bling/get_videos.lua`

Application will show messages of the videos that downloads to the USB.
