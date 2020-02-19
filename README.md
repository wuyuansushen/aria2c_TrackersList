# aria2c rule
This is an instration about how to configure the enviroment about downloading torrent.

1.The configure file is `$HOME/.aria2/aria2.conf`

2.Search the project which have saved many TrackerLists Files
`https://github.com/ngosang/trackerslist`

3.In `aria2.conf` , You only need to add a line:
```
bt-tracker=<URI>,<URI>,<URI>,<URI>,<URI>....
```

# Aria2c script
1.Please move this script in `/usr/lib`

2.If you have this ability,I advise you to add it to __crontab__
