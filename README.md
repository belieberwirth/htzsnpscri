# htzsnpscri - USE AT YOUR OWN RISK
A BASH-Script to automate taking a snapshot of your Virtual Hetzner Server and deleting the oldest one

# what the script does

- the script is taking the first / oldest snapshot and deletes it
- then it is creating a new snapshot
- it is very simple and it just takes the first number in the JSON Response it can find, so be careful, if Hetzner is ever chaning their server response, this script might not work any more

# usage

- just chmod the file to 755 
- put your hetzner credentials in
- use whatever cron-job-scheduler you like
- enjoy :)

# what could be improved

- might be nice if the script get's more "intelligent" and actually creates an array of the snapshot-ids and looks for the lowest one
