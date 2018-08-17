#!/bin/bash
ESserverIP="18.195.202.50" #<--- Change with your IP address here

ESindex=monitor-des
EStype=icastats

EShost="$(hostname)"

function sendToES {
        now="$(date --utc +%Y-%m-%dT%T.%3NZ)"
        curl -XPOST "${ESserverIP}:9200/${ESindex}/${EStype}" -H "content-type:application/json" -d '
        {
                "Host":"'${EShost}'",
                "@timestamp":"'${now}'",
                "timesec":'$1',
                "DES-ECB":'$2',
                "DES-CBC":'$3',
                "DES-OFB":'$4',
                "DES-CFB":'$5',
                "DES-CTR":'$6',
                "DES-CMAC":'$7',
		"3DES-ECB":'$8',
                "3DES-CBC":'$9',
                "3DES-OFB":'$10',
                "3DES-CFB":'$11',
                "3DES-CTR":'$12',
                "3DES-CMAC":'$13'
        }
        '
}

while true
do

INFOS="$(icastats | grep DES)"
EStimesec="$(date +%s)"

VALUE1="$(echo ${INFOS} | gawk '{print $4}')" #DES-ECB Hardware
VALUE2="$(echo ${INFOS} | gawk '{print $12}')" #DES-CBC Hardware
VALUE3="$(echo ${INFOS} | gawk '{print $20}')" #DES-OFB Hardware
VALUE4="$(echo ${INFOS} | gawk '{print $28}')" #DES-CFB Hardware
VALUE5="$(echo ${INFOS} | gawk '{print $36}')" #DES-CTR Hardware
VALUE6="$(echo ${INFOS} | gawk '{print $44}')" #DES-CMAC Hardware

VALUE7="$(echo ${INFOS} | gawk '{print $52}')" #3DES-ECB Hardware
VALUE8="$(echo ${INFOS} | gawk '{print $60}')" #3DES-CBC Hardware
VALUE9="$(echo ${INFOS} | gawk '{print $68}')" #3DES-OFB Hardware
VALUE10="$(echo ${INFOS} | gawk '{print $76}')" #3DES-CFB Hardware
VALUE11="$(echo ${INFOS} | gawk '{print $84}')" #3DES-CTR Hardware
VALUE12="$(echo ${INFOS} | gawk '{print $92}')" #3DES-CMAC Hardware

sendToES "${EStimesec}" "${VALUE1}" "${VALUE2}" "${VALUE3}" "${VALUE4}" "${VALUE5}" "${VALUE6}" "${VALUE7}" "${VALUE8}" "${VALUE9}" "${VALUE10}" "${VALUE11}" "${VALUE12}"

echo sendToES "${EStimesec}" "${VALUE1}" "${VALUE2}" "${VALUE3}" "${VALUE4}" "${VALUE5}" "${VALUE6}" "${VALUE7}" "${VALUE8}" "${VALUE9}" "${VALUE10}" "${VALUE11}" "${VALUE12}"

sleep 5

done

