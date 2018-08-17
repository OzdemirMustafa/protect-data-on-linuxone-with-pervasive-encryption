#!/bin/bash
ESserverIP="127.0.0.1" #<--- Change with your IP address here

ESindex=monitor-vmstat
EStype=vmstat

EShost="$(hostname)"

function sendToES {
        now="$(date --utc +%Y-%m-%dT%T.%3NZ)"
        curl -XPOST "${ESserverIP}:9200/${ESindex}/${EStype}" -H "content-type:application/json" -d '
        {
                "Host":"'${EShost}'",
                "@timestamp":"'${now}'",
                "timesec":'$1',
                "procs-r":'$2',
                "procs-b":'$3',
                "memory-swpd":'$4',
                "memory-free":'$5',
                "memory-buff":'$6',
                "memory-cache":'$7',
                "swap-si":'$8',
		"swap-so":'$9',
                "io-bi":'${10}',
                "io-bo":'${11}',
                "system-in":'${12}',
                "system-cs":'${13}',
                "cpu-us":'${14}',
                "cp-sy":'${15}',
		"cpu-id":'${16}',
                "cpu-wa":'${17}',
                "cpu-st":'${18}'
        }
        '
}

while true
do

INFOS="$(vmstat -w 1 2)"

EStimesec="$(date +%s)"
#procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
# r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
#20  0      0  21996 188972 1686828    0    0     0     0    1    1  0  0 100  0  0


VALUE1="$(echo ${INFOS} | gawk '{print $41}')" #procs-r
VALUE2="$(echo ${INFOS} | gawk '{print $42}')" #procs-b
VALUE3="$(echo ${INFOS} | gawk '{print $43}')" #memory-swpd
VALUE4="$(echo ${INFOS} | gawk '{print $44}')" #memory-free
VALUE5="$(echo ${INFOS} | gawk '{print $45}')" #memory-buff
VALUE6="$(echo ${INFOS} | gawk '{print $46}')" #memory-cache
VALUE7="$(echo ${INFOS} | gawk '{print $47}')" #swap-si
VALUE8="$(echo ${INFOS} | gawk '{print $48}')" #swap-so
VALUE9="$(echo ${INFOS} | gawk '{print $49}')" #io-bi
VALUE10="$(echo ${INFOS} | gawk '{print $50}')" #io-bo
VALUE11="$(echo ${INFOS} | gawk '{print $51}')" #system-in
VALUE12="$(echo ${INFOS} | gawk '{print $52}')" #system-cs
VALUE13="$(echo ${INFOS} | gawk '{print $53}')" #cpu-us
VALUE14="$(echo ${INFOS} | gawk '{print $54}')" #cpu-sy
VALUE15="$(echo ${INFOS} | gawk '{print $55}')" #cpu-id
VALUE16="$(echo ${INFOS} | gawk '{print $56}')" #cpu-wa
VALUE17="$(echo ${INFOS} | gawk '{print $57}')" #cpu-st

sendToES "${EStimesec}" "${VALUE1}" "${VALUE2}" "${VALUE3}" "${VALUE4}" "${VALUE5}" "${VALUE6}" "${VALUE7}" "${VALUE8}" "${VALUE9}" "${VALUE10}" "${VALUE11}" "${VALUE12}" "${VALUE13}" "${VALUE14}" "${VALUE15}" "${VALUE16}" "${VALUE17}"

echo sendToES "${EStimesec}" "${VALUE1}" "${VALUE2}" "${VALUE3}" "${VALUE4}" "${VALUE5}" "${VALUE6}" "${VALUE7}" "${VALUE8}" "${VALUE9}" "${VALUE10}" "${VALUE11}" "${VALUE12}" "${VALUE13}" "${VALUE14}" "${VALUE15}" "${VALUE16}" "${VALUE17}"

sleep 5

done
