#!/bin/sh

docker_start_date=$(systemctl show docker --property=ActiveEnterTimestamp | awk '{print $2" "$3}')
docker_start_date_sec=$(date -d "$docker_start_date" +%s)

system_start_date=$(uptime -s)
system_start_date_sec=$(date -d "$system_start_date" +%s)

delay_sec=$(( (docker_start_date_sec - system_start_date_sec) ))

echo -e "========== docker-service-start-delay ==========

RESULT: \

System booted at: $system_start_date
Docker started at: $docker_start_date

==> Docker service start delay: $delay_sec seconds
"