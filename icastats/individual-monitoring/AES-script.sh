#!/bin/bash
ESserverIP="18.195.202.50" #<--- Change with your IP address here

ESindex=monitor-aes
EStype=icastats

EShost="$(hostname)"

function sendToES {
        now="$(date --utc +%Y-%m-%dT%T.%3NZ)"
        curl -XPOST "${ESserverIP}:9200/${ESindex}/${EStype}" -H "content-type:application/json" -d '
        {
                "Host":"'${EShost}'",
                "@timestamp":"'${now}'",
                "timesec":'$1',
                "AES-ECB":'$2',
                "AES-CBC":'$3',
                "AES-OFB":'$4',
                "AES-CFB":'$5',
                "AES-CTR":'$6',
                "AES-CMAC":'$7',
                "AES-XTS":'$8'
        }
        '
}

while true
do

INFOS="$(icastats | grep AES)"
EStimesec="$(date +%s)"

VALUE1="$(echo ${INFOS} | gawk '{print $4}')" #AES-ECB Hardware
VALUE2="$(echo ${INFOS} | gawk '{print $12}')" #AES-CBC Hardware
VALUE3="$(echo ${INFOS} | gawk '{print $20}')" #AES-OFB Hardware
VALUE4="$(echo ${INFOS} | gawk '{print $28}')" #AES-CFB Hardware
VALUE5="$(echo ${INFOS} | gawk '{print $36}')" #AES-CTR Hardware
VALUE6="$(echo ${INFOS} | gawk '{print $44}')" #AES-CMAC Hardware
VALUE7="$(echo ${INFOS} | gawk '{print $52}')" #AES-XTS Hardware

sendToES "${EStimesec}" "${VALUE1}" "${VALUE2}" "${VALUE3}" "${VALUE4}" "${VALUE5}" "${VALUE6}" "${VALUE7}"

echo sendToES "${EStimesec}" "${VALUE1}" "${VALUE2}" "${VALUE3}" "${VALUE4}" "${VALUE5}" "${VALUE6}" "${VALUE7}"

sleep 5

done
