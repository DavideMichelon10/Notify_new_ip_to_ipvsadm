# Notify_new_ip_to_ipvsadm

Our network is composed by:
- **dhcp** : it assign new IP addresses to servers appearing on the network and write on mysql database (located in DB_node) the new IP address. It also could notify to the DNS server the couple IP-hostname.
- **DB_node**: it contains the DB. It also creates a user for remote database access
- **IPVS_node**: It's the machine where ipvsadm runs. There is a script that check every X second the database on DB_node machine with the aim of finding new IP addresses
