# Cutter

Cutter is a tool that allows you to quickly select moments in a video like a GoPro rush.

## Restrictions

### Supported file extensions
* MP4 and mp4

### Name of the file
The file must be named like the following :

> 0.00-9.59 = <name>.mp4

or

> 0.00-5.00 = name1 / 5.01-9.59 = name2.mp4

The / being a separator (if there are multiple clips to extract)

| Name part | Meaning                     | Example                              | Limitations                                                          |
|-----------|-----------------------------|--------------------------------------|----------------------------------------------------------------------|
| 0.00      | Start time code             | I want to start at 5min25sec => 5.25 | Currently supporting only from 0.00 up to 9 min 59 sec                         |   |
| 9.59      | End time code               | I want to end at 5min25sec => 5.25   | Currently supporting only from 0.00 up to 9 min 59 sec              |
| \<name\>    | The name of the output file | Replace <name> with Double backflip  | No special characters allowed (like é or è) only letters and numbers |

## Usage

First download cutter.sh, then
```bash
chmod +x cutter.sh
```
Then create a directory (at the same level as cutter.sh) or simply run cutter.sh
```bash
./cutter.sh
```
or
```bash
sh cutter.sh
```
or
```bash
bash cutter.sh
```
