#!/bin/bash
ESserverIP="18.195.202.50" #<--- Change with your IP address here

ESindex=monitor-sha
EStype=icastats

EShost="$(hostname)"

function sendToES {
        now="$(date --utc +%Y-%m-%dT%T.%3NZ)"
        curl -XPOST "${ESserverIP}:9200/${ESindex}/${EStype}" -H "content-type:application/json" -d '
        {
                "Host":"'${EShost}'",
                "@timestamp":"'${now}'",
                "timesec":'$1',
                "SHA-1":'$2',
                "SHA2-224":'$3',
                "SHA2-256":'$4',
                "SHA2-384":'$5',
                "SHA2-512":'$6',
                "DRBG-SHA-512":'$7'
        }
        '
}

while true
do

INFOS="$(icastats | grep SHA)"
EStimesec="$(date +%s)"

VALUE1="$(echo ${INFOS} | gawk '{print $3}')" #SHA-1 Hardware
VALUE2="$(echo ${INFOS} | gawk '{print $8}')" #SHA2-224 Hardware
VALUE3="$(echo ${INFOS} | gawk '{print $13}')" #SHA2-256 Hardware
VALUE4="$(echo ${INFOS} | gawk '{print $8}')" #SHA2-384 Hardware
VALUE5="$(echo ${INFOS} | gawk '{print $23}')" #SHA2-512 Hardware
VALUE6="$(echo ${INFOS} | gawk '{print $28}')" #DRBG-SHA-512 Hardware

sendToES "${EStimesec}" "${VALUE1}" "${VALUE2}" "${VALUE3}" "${VALUE4}" "${VALUE5}" "${VALUE6}"

echo sendToES "${EStimesec}" "${VALUE1}" "${VALUE2}" "${VALUE3}" "${VALUE4}" "${VALUE5}" "${VALUE6}"

sleep 5

done

