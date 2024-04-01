#!/bin/bash

log_file="website_status_log.txt"

sites=(
        "https://www.google.com"
        "https://www.facebook.com"
        "https://www.twitter.com"
      )

for site in "${sites[@]}"; do
    response=$(curl --connect-timeout 5 -o /dev/null -s -w "%{http_code}\n" "$site")

    if [ $response -eq 200 ]; then
        echo "$site is UP" >> "$log_file"
    else
        echo "$site is DOWN" >> "$log_file"
    fi
done

echo "The response result was written to $log_file"