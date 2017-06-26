# External ip script
This is a simple script to push your external ip to Pushbullet (if your ip changes)

The main reason to do this is because Ziggo tends to change your external ip once in a while, and without any notification you suddenly can’t use some of your services at home.(vpn for instance, gameserver etc) 

## Requirements
- Bash
- Crontab
- Curl

All of the above is found in almost every Linux Distribution, including Raspberry pi’s.

## Installation
Very simple, clone the script to a directory (I’m using /opt/scrips)

To be sure, create the directory:
```
mkdir -p /opt/scripts
```
Cd to the directory
```
cd /opt/scripts
```
Now clone the git repo the the directory
```
git clone https://github.com/patatman/external-ip.git
```
Or download the file manually if you don’t have git (don’t forget to unpack)
```
wget https://github.com/patatman/external-ip/archive/master.zip
```


## Configuration
Now you need to create a pushbullet api. Go to [Pushbullet API](https://docs.pushbullet.com/#api-quick-start)
And get your self a Api to use the script.

Now at the top of the script, edit the pushapi string to your own api.
If you’d like you can also adjust the temporary file where the ip is saved.
You can even use a different ip checker if you like, but the default is fine.

You need to make the script executable:
```
chmod +x /opt/scripts/external-ip.sh
```

## Usage
Now you can use the script as is, and execute it manually:
```
./opt/scripts/external-ip.sh
```

Or you could use it the way it’s intended, in a cronjob.
Open your crontab:
```
crontab -e
```

Add the following entry:
```
30 * * * * /opt/scripts/external-ip.sh
```

This runs the script every hour on the 30th minute. 

Now save the crontab, and your script is going to alert you if your external ip changes.
