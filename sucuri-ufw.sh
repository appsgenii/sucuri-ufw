#!/bin/sh

echo 192.88.134.0/23 -o /tmp/s_ips
echo 185.93.228.0/22 >> /tmp/s_ips
echo 2a02:fe80::/29 >> /tmp/s_ips
echo 66.248.200.0/22 >> /tmp/s_ips
echo 208.109.0.0/22 >> /tmp/s_ips

# Allow all traffic from Sucuri IPs (no ports restriction)
for sip in `cat /tmp/s_ips`; do ufw allow proto tcp from $sip comment 'Sucuri IP'; done

ufw reload > /dev/null

# OTHER EXAMPLE RULES
# Retrict to port 80
#for sip in `cat /tmp/s_ips`; do ufw allow proto tcp from $sip to any port 80 comment 'Sucuri IP'; done

# Restrict to port 443
#for sip in `cat /tmp/s_ips`; do ufw allow proto tcp from $sip to any port 443 comment 'Sucuri IP'; done

# Restrict to ports 80 & 443
#for sip in `cat /tmp/s_ips`; do ufw allow proto tcp from $sip to any port 80,443 comment 'Sucuri IP'; done
