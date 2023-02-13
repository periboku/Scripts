#!/bin/bash
nragentlog='/home/ec2-user/newrelic_agent.log'
combinedlog='stat -c%s /home/ec2-user/combined.log'



[ $(stat --printf '%s' "$nragentlog") -gt 20000000000 ] && rm -rf /home/ec2-user/newrelic_agent.log && touch /home/ec2-user/newrelic_agent.log && sudo chown ec2-user:ec2-user
[ $(stat --printf '%s' "$combinedlog") -gt 10000000000 ] && echo "tamam"
