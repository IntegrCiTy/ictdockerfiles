#!/usr/bin/env bash
set -e

(
# Execute list_users until service is up and running
while ! nc -vz localhost 5672; do sleep 1; done

source /hook/rabbit_control.sh
echo "setup completed"

) &

# Call original entrypoint
exec docker-entrypoint.sh rabbitmq-server $@
