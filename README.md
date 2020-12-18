# Start Quickly

```
bash aria2c_TrackersList/go.sh
```

## Aria2c Usage of torrent

1.Show conntent list and index of torrent file

```
aria2c [ -S | --show-files ] <torrentFIle>
```

2.Download specific files of torrent with their index

```
aria2c --select-file=<index> <torrentFile>
```

`<index>` have two types to choose multiple files with their index number showed in `--show-files`:

1.Multiple Individual indexes can be specified by using `,`

2.Specify a range with `-`

# Reference (Advanced)

## Aria2c rule
This is an instration about how to configure the enviroment about downloading torrent.

1.The configure file is `$HOME/.aria2/aria2.conf`

2.Search this [project](https://github.com/ngosang/trackerslist) which have saved many TrackerLists Files

3.In `aria2.conf` , You only need to add a line:
```
bt-tracker=<URI>,<URI>,<URI>,<URI>,<URI>....
```

## Aria2c script


1.We advise you locate this script in `/usr/lib`

2.If you have this ability,I advise you to add it to __crontab__

## Crontab Configuration

1.Check the Time of the server
```
date
```

2.Select the editor of the __crontab__

```
select-editor
```

3.use __crontab__

Look at crontab:
```
crontab -l
```
Add task to crontab:
```
crontab -e
```
Add the Task,such as(Update on 4:00am every 2 days)
```
# m h  dom mon dow   command
0 4 */2 * * bash /usr/lib/TLUpdate.sh

#固定时间重启设备示例
0 4 * * * /sbin/reboot
```

4. (Optional) Get/Discard __crontab log__

Get:
```
apt install mailutils
```

Discard:
```
apt purge mailutils
```
