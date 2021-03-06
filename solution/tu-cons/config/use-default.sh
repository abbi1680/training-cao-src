export NS=io.confluent.monitoring.clients.interceptor
tc qdisc add dev eth0 root netem delay 10ms
kafka-console-consumer \
    --group group-with-default-settings \
    --bootstrap-server kafka-1:9092 \
    --from-beginning \
    --topic tuning-topic \
    --consumer-property "interceptor.classes=${NS}.MonitoringConsumerInterceptor" \
    --consumer-property "client.id=use-default-client"
