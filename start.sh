#!/bin/bash
echo "HOSTNAME"
hostname
echo "IP ADDRESS:"
hostname -i

#export RLM_LICENSE=/opt/rlm/licenses

cp /opt/rlm/licenses/* /usr/local/rlm/

echo "Y" | /usr/local/rlm/rlm -iai
