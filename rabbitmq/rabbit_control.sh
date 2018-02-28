# Delete default user even if accessible only via localhost
rabbitmqctl delete_user guest

# Delete default vhost 
rabbitmqctl delete_vhost /

# Create a dedicatetd virtual host for OBNL
rabbitmqctl add_vhost obnl_vhost
# Create a dedicatetd virtual host for the bakcend
rabbitmqctl add_vhost backend_vhost


# Create an admin user to manage rabbit for obnl vhost
rabbitmqctl add_user admin ${RABBITMQ_ADMIN_PASSWORD}
rabbitmqctl set_user_tags admin administrator
rabbitmqctl set_permissions -p obnl_vhost admin  ".*" ".*" ".*"
rabbitmqctl set_permissions -p backend_vhost admin  ".*" ".*" ".*"

# Create the obnl user for obnl vhost
rabbitmqctl add_user obnl ${RABBITMQ_OBNL_PASSWORD}
rabbitmqctl set_permissions -p obnl_vhost obnl  ".*" ".*" ".*"

# Create the tool user for backend vhost
rabbitmqctl add_user tool ${RABBITMQ_TOOL_PASSWORD}
rabbitmqctl set_permissions -p backend_vhost tool  ".*" ".*" ".*"

# WARNING: This execution can be run after the run of the RabbitMQ Server.
# It could be necessary to wait until this is done to connect with obnl user.
# It is possible to have this information on INFO REPORT.

