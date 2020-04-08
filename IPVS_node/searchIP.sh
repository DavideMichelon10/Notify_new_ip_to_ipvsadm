#!/bin/bash

. /home/ubuntu/searchIP.conf
echo ""
echo "USER: $DB_USER"
echo "IP of MYSQL: $DB_IP"
echo ""

while true; do
	mysql DB_IP -u $DB_USER -p$DB_PASSWORD -h $DB_IP <<< 'select id, opt, ip from ip' 2>/dev/null |

	while IFS='\n' read list; do
		vars=( $list )
		id=${vars[0]}
		ip=${vars[2]}
		opt=${vars[1]}

		if [ id = "id" ]
		then
			if [ opt = "A" ]
			then
				ipvsadm -a -t $PUBLIC_IP:80 -r $ip -m
			elif [ opt = "R" ]
			then
				ipvsadm -d -t $PUBLIC_IP:80 -r $ip
			fi
		fi
	done
	mysql DB_IP -u $DB_USER -p$DB_PASSWORD -h $DB_IP <<< 'delete  from ip' 2>/dev/null |
	sleep $DELAY
done
