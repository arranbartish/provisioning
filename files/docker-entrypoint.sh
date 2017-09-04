#!/bin/bash


echo "PLAYBOOK_LOCATION:  $PLAYBOOK_LOCATION"
echo "HOSTS_LOCATION:     $HOSTS_LOCATION"


eval exec "$@"