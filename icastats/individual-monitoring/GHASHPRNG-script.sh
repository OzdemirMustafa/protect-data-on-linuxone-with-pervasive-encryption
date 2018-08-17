#!/bin/bash
ESserverIP="18.195.202.50" #<--- Change with your IP address here

ESindex=monitor-ghashprng
EStype=icastats

EShost="$(hostname)"

function sendToES {
        now="$(date --utc +%Y-%m-%dT%T.%3NZ)"
        curl -XPOST "${ESserverIP}:9200/${ESindex}/${EStype}" -H "content-type:application/json" -d '
        {
                "Host":"'${EShost}'",
                "@timestamp":"'${now}'",
                "timesec":'$1',
                "GHASH":'$2',
                "P_RNG":'$3'
        }
        '
}

while true
do

EStimesec="$(date +%s)"

INFOS="$(icastats | grep GHASH)"
VALUE1="$(echo ${INFOS} | gawk '{print $3}')" #GHASH Hardware

INFOS="$(icastats | grep P_RNG)"
VALUE2="$(echo ${INFOS} | gawk '{print $3}')" #P_RNG Hardware

sendToES "${EStimesec}" "${VALUE1}" "${VALUE2}"

echo sendToES "${EStimesec}" "${VALUE1}" "${VALUE2}"

sleep 5

done

