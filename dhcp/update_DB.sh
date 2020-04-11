#!/bin/bash
. /usr/local/sbin/update.conf

echo ""
echo "USER: $DB_USER"
echo "IP of MYSQL: $DB_IP"
echo ""

mysql DB_IP -u $DB_USER -p$DB_PASSWORD -h $DB_IP << EOF
INSERT INTO ip(ip, opt) VALUES ("$2", "A");
EOF
