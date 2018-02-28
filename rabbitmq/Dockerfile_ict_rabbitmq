FROM rabbitmq:management-alpine

# ADD rabbitmq.config /etc/rabbitmq/rabbitmq.config

COPY docker_entrypoint.sh /
COPY rabbit_control.sh /hook/

ENTRYPOINT ["/docker_entrypoint.sh"]

# docker run -d --rm -p 5672:5672 -p 15672:15672 --env RABBITMQ_ADMIN_PASSWORD=<ADMIN_PASS> --env RABBITMQ_OBNL_PASSWORD=<OBNL_PASS> --env RABBITMQ_TOOL_PASSWORD=<TOOL_PASS> integrcity/rabbitmq
