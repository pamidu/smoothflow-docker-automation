#!/bin/bash
#delete docker image run running container using name 
#$1=docker name need to be delete 
idarray=($(docker ps | awk '{ print $1 }'))
namearray=($(docker ps | awk '{ print $2 }'))
indexid=0
indexname=0
for i in "${namearray[@]}"
	do
		indexname=$(($indexname + 1))
		 if [ "$1" == "${namearray[$indexname]}" ]; then 
		 	indexofidneedtodelete=$indexname
		 fi
done
docker stop ${idarray[$indexofidneedtodelete]} >/dev/null 2>&1
stop=$?
docker rm ${idarray[$indexofidneedtodelete]} >/dev/null 2>&1
remove=$?
docker rmi $1 >/dev/null 2>&1
deleteimage=$?
if [ "$stop" -eq 0 ] && [ "$remove" -eq 0 ] && [ "$deleteimage" -eq 0 ];then
	echo "0"
elif [ "$stop" -eq 0 ] && [ "$remove" -eq 0 ] && [ "$deleteimage" -gt 0 ];then
	echo "1"
elif [ "$stop" -eq 0 ] && [ "$remove" -gt 0 ] && [ "$deleteimage" -eq 0 ];then
	echo "2"
elif [ "$stop" -eq 0 ] && [ "$remove" -gt 0 ] && [ "$deleteimage" -gt 0 ];then
	echo "3"
elif [ "$stop" -gt 0 ] && [ "$remove" -eq 0 ] && [ "$deleteimage" -eq 0 ];then
	echo "4"
elif [ "$stop" -gt 0 ] && [ "$remove" -eq 0 ] && [ "$deleteimage" -gt 0 ];then
	echo "5"
elif [ "$stop" -gt 0 ] && [ "$remove" -gt 0 ] && [ "$deleteimage" -eq 0 ];then
	echo "6"
elif [ "$stop" -gt 0 ] && [ "$remove" -gt 0 ] && [ "$deleteimage" -gt 0 ];then
	echo "7"
fi


