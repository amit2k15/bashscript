#!/bin/bash

service_name="your_service_name"

status=$(systemctl is-active $service_name)

if [[ $status == "active" ]]; then
    echo "$service_name is running."
elif [[ $status == "inactive" ]]; then
    echo "$service_name is not running."
else
    echo "Unable to determine the status of $service_name."
fi
