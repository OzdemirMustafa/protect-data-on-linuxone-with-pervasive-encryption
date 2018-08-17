#!/bin/bash
ESserverIP="10.3.57.112" <--- Change with the Elasticsearch ICP IP address here

ESindex=monitor-icastats
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
                "AES-XTS":'$8',
		"GHASH":'$9',
                "P_RNG":'${10}',
                "RSA-ME":'${11}',
                "RSA-CRT":'${12}',
  		"SHA-1":'${13}',
                "SHA2-224":'${14}',
                "SHA2-256":'${15}',
                "SHA2-384":'${16}',
                "SHA2-512":'${17}',
                "DRBG-SHA-512":'${18}'
        }
        '
}

while true
do

EStimesec="$(date +%s)"

INFOS="$(icastats | grep AES)"
VALUE1="$(echo ${INFOS} | gawk '{print $4}')" #AES-ECB Hardware
VALUE2="$(echo ${INFOS} | gawk '{print $12}')" #AES-CBC Hardware
VALUE3="$(echo ${INFOS} | gawk '{print $20}')" #AES-OFB Hardware
VALUE4="$(echo ${INFOS} | gawk '{print $28}')" #AES-CFB Hardware
VALUE5="$(echo ${INFOS} | gawk '{print $36}')" #AES-CTR Hardware
VALUE6="$(echo ${INFOS} | gawk '{print $44}')" #AES-CMAC Hardware
VALUE7="$(echo ${INFOS} | gawk '{print $52}')" #AES-XTS Hardware

INFOS="$(icastats | grep GHASH)"
VALUE8="$(echo ${INFOS} | gawk '{print $3}')" #GHASH Hardware

INFOS="$(icastats | grep P_RNG)"
VALUE9="$(echo ${INFOS} | gawk '{print $3}')" #P_RNG Hardware

INFOS="$(icastats | grep RSA)"
VALUE10="$(echo ${INFOS} | gawk '{print $3}')" #RSA-ME Hardware
VALUE11="$(echo ${INFOS} | gawk '{print $8}')" #RSA-CRT Hardware

INFOS="$(icastats | grep SHA)"
VALUE12="$(echo ${INFOS} | gawk '{print $3}')" #SHA-1 Hardware
VALUE13="$(echo ${INFOS} | gawk '{print $8}')" #SHA2-224 Hardware
VALUE14="$(echo ${INFOS} | gawk '{print $13}')" #SHA2-256 Hardware
VALUE15="$(echo ${INFOS} | gawk '{print $8}')" #SHA2-384 Hardware
VALUE16="$(echo ${INFOS} | gawk '{print $23}')" #SHA2-512 Hardware
VALUE17="$(echo ${INFOS} | gawk '{print $28}')" #DRBG-SHA-512 Hardware

sendToES "${EStimesec}" "${VALUE1}" "${VALUE2}" "${VALUE3}" "${VALUE4}" "${VALUE5}" "${VALUE6}" "${VALUE7}" "${VALUE8}" "${VALUE9}" "${VALUE10}" "${VALUE11}" "${VALUE12}" "${VALUE13}" "${VALUE14}" "${VALUE15}" "${VALUE16}" "${VALUE17}"

echo sendToES "${EStimesec}" "${VALUE1}" "${VALUE2}" "${VALUE3}" "${VALUE4}" "${VALUE5}" "${VALUE6}" "${VALUE7}" "${VALUE8}" "${VALUE9}" "${VALUE10}" "${VALUE11}" "${VALUE12}" "${VALUE13}" "${VALUE14}" "${VALUE15}" "${VALUE16}" "${VALUE17}"

icastats -R

sleep 5

done
