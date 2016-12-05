#!/bin/bash
#delete all exited dockers 

docker ps -a > docker.txt
id=( $(cut -d ' ' -f 1 "./docker.txt") )
size=${id[@]}
for (( i=1; i <= $size; ++i ))
do
    docker rm ${id[$i]}
done
