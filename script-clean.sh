#!/bin/bash                                                                                                                                                                                     
# NOTE -> USE AT OWN RISK
# IF Hetzner is ever changing the JSON Format of the server response this script may not work any more, because its just simply taking the first snapshot number!

# Type in your hetzner robot credentials
loginname='USERNAME'
passwd='PASSWORD'
serverip='YOURSERVERIP'

# Get Snapshot list and find the first id
raw=$(curl -u "$loginname":"$passwd" https://robot-ws.your-server.de/snapshot/"$serverip") 
firstnumber=$(echo $raw | grep -o -E '[0-9]+' | head -1 | sed -e 's/^0\+//')

# Delete the oldest aka lowest Snapshot (number)
curl -u "$loginname":"$passwd" https://robot-ws.your-server.de/snapshot/"$serverip"/"$firstnumber" -X DELETE

# Wait, because sometimes the deleting takes time 
sleep 20s

# Make new snapshot
echo "All done, here is your new snapshot"
curl -u "$loginname":"$passwd" https://robot-ws.your-server.de/snapshot/"$serverip" -X POST
# All done



