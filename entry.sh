#!/bin/sh

sed -i "s/BUSINESS_GUID/${BUSINESS_GUID}/" /scripts/config.xml


set -e

CRON_SCHEDULE=${CRON_SCHEDULE:-0 * * * *}
STDOUT_LOC=${STDOUT_LOC:-/proc/1/fd/1}
STDERR_LOC=${STDERR_LOC:-/proc/1/fd/2}

echo "${CRON_SCHEDULE} /scripts/update-linux-x86-64 fetch --config /scripts/config.xml --once --mirror /usr/share/nginx/html/ > ${STDOUT_LOC} 2> ${STDERR_LOC}" | crontab -
exec cron -f -L 8
