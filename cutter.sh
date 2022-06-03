#!/usr/bin/env bash

# Format files with the following name : 0.00-9.59 = name.mp4 or 0.00-5.00 = name1 / 5.01-9.59 = name2.mp4
# Note .MP4 also works
# Specials characters such as é or è doesn't work at the moment

IFS=$'\n';

if [ ! -d "input" ]
then
  mkdir "input";
  echo "input direcory created please put your files inside.";
  exit 1;
fi;

if [ ! -d "output" ]
then
  mkdir "output";
fi;

for element in $(ls input)
do
  if [[ "$element" =~ ^([0-9]+\.[0-9]+-[0-9]+\.[0-9]+( )?=( )?[a-z|A-Z|0-9| ]+( )?(:)?( )?)+(\.MP4|\.mp4)$ ]]
  then
    ext=$(echo $element | rev | cut -d "." -f 1 | rev)
    element=$(echo $element | rev | cut -d "." -f 2- | rev)
    readarray -d : -t elements <<< "$element";
    for (( n=0; n < ${#elements[*]}; n++))
      do
        timecodes=$(echo "${elements[n]}" | cut -d "=" -f 1 | xargs)
        name=$(echo "${elements[n]}" | cut -d "=" -f 2 | xargs)
        # | xargs is for trimming the preceding and trailing spaces
        timecode_start=$(echo $timecodes | cut -d "-" -f 1)
        timecode_start="00:0${timecode_start//\./:}"
        echo $timecode_start
        timecode_end=$(echo $timecodes | cut -d "-" -f 2)
        timecode_end="00:0${timecode_end//\./:}"
        echo $timecode_end
        echo $name

        ffmpeg -i "input/$element.$ext" -ss $timecode_start -to $timecode_end -c:v copy -c:a copy "output/$name.mp4"
      done;
  else
    echo "$element : Wrong format";
  fi;
done;
