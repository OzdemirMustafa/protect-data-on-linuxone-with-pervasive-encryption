#!/bin/bash
ESserverIP="18.195.202.50" #<--- Change with your IP address here

ESindex=monitor-rsa
EStype=icastats

EShost="$(hostname)"

function sendToES {
        now="$(date --utc +%Y-%m-%dT%T.%3NZ)"
        curl -XPOST "${ESserverIP}:9200/${ESindex}/${EStype}" -H "content-type:application/json" -d '
        {
                "Host":"'${EShost}'",
                "@timestamp":"'${now}'",
                "timesec":'$1',
                "RSA-ME":'$2',
                "RSA-CRT":'$3'
        }
        '
}

while true
do

INFOS="$(icastats | grep RSA)"
EStimesec="$(date +%s)"

VALUE1="$(echo ${INFOS} | gawk '{print $3}')" #RSA-ME Hardware
VALUE2="$(echo ${INFOS} | gawk '{print $8}')" #RSA-CRT Hardware

sendToES "${EStimesec}" "${VALUE1}" "${VALUE2}"

echo sendToES "${EStimesec}" "${VALUE1}" "${VALUE2}"

sleep 5

done
