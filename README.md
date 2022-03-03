## Quick start

```
bash aria2c_TrackersList/go.sh
```

## Basic usage

1. Download `.torrent` file from `magnet` link

    ```
    aria2c --bt-save-metadata=true --bt-metadata-only=true <magnetLink>
    ```

2. Show conntent list and index of torrent file

    ```
    aria2c [ -S | --show-files ] <torrentFIle>
    ```

3. Download specific files of torrent with their index

    ```
    aria2c --select-file=<INDEX> <torrentFile>
    ```

    `<INDEX>` have two types to choose multiple files with their index number showed in `--show-files`
        
    1. Multiple Individual indexes can be specified by using `,`

    2. Specify a range with `-`

    :bulb: In multiple file torrent, the adjacent files specified by this option may also be downloaded.

4. FAQ

    - Q: Encounter `cause: File name too long` error

    - A: Use `-O, --index-out=<INDEX>=<PATH>` option
        
        - This option can be used multiple times.

        - Specify an output file name of torrent downloads through its `<INDEX>` obtained from using `--show-files`.

### Other tips

- You could use `wget` to get resource downloaded by `aria2c` through Web Server.

## Theoretical basis

- This is an instration about how to configure the enviroment about downloading torrent.

1. The configure file is `$HOME/.aria2/aria2.conf`

2. Search this [project](https://github.com/ngosang/trackerslist) which have saved many TrackerLists Files

3. In `aria2.conf` , You only need to add a line:

    ```
    bt-tracker=<URI>,<URI>,<URI>,<URI>,<URI>....
    ```