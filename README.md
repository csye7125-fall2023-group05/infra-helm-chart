# Infrastructure Helm Chart

This helm chart is to deploy a highly reliable and highly available [Kafka](https://kafka.apache.org/documentation/#quickstart) cluster.

This makes use of [Bitnami's Kafka Helm Chart](https://github.com/bitnami/charts/tree/main/bitnami/kafka) as a dependency.

- Adding the `bitnami/kafka` and `bitnami/postgresql` charts as a dependencies:

```yaml
# Chart.yaml
dependencies:
  - name: kafka
    version: 26.4.x
    repository: "https://charts.bitnami.com/bitnami"
  - name: postgresql
    version: 13.1.5
    repository: "https://charts.bitnami.com/bitnami"
```

- Install/update dependencies:

```bash
# adds the bitnami/kafka and bitnami/postgresql dependency charts in charts/ directory
helm dependency update
```

- The `values.yaml` overrides the configurations for the `kafka` and `postgresql` dependency charts to create 3 brokers and 1 postgres pod (along with other configurations).

```yaml
# values.yaml
psql:
  version: "13.1.5"
  repository: https://charts.bitnami.com/bitnami
  enabled: true
  image: postgres
  tag: 14-alpine

postgresql:
  auth:
    username:
    password:
    database:
  primary:
    persistence:
      size: 1Gi

kafka:
  listeners:
    client:
      protocol: PLAINTEXT
    controller:
      protocol: PLAINTEXT
    interbroker:
      protocol: PLAINTEXT
    external:
      protocol: PLAINTEXT
  controller:
    replicaCount: 0
  broker:
    replicaCount: 3
    persistence:
      size: 1Gi
  serviceAccount:
    create: false
  provisioning:
    enabled: true
    numPartitions: 3
    replicationFactor: 1
    topics:
      - name: healthcheck
        partitions: 3
        replicationFactor: 1
        config:
          max.message.bytes: 64000
          flush.messages: 1
  kraft:
    enabled: false
  zookeeper:
    enabled: true
    persistence:
      size: 1Gi
```

- In order to check the number of partitions created for a particular topic:

```bash
kubectl exec -it <your-kafka-broker-pod-name> -- /bin/bash
# run the following commands once you're inside the pod:
cd /opt/bitnami/kafka/bin/
kafka-topics.sh --describe --bootstrap-server \
  <broker-ip-address>:<broker-port-number> \
  --topic <topic-name>
# kafka-topics.sh --describe --bootstrap-server \
#   infra-helm-release-kafka-broker-1.infra-helm-release-kafka-broker-headless.webapp.svc.cluster.local:9094 \
#   --topic healthcheck
```

You should see an output similar to the one shown below:

``` output
Topic: healthcheck       TopicId: YcLqdlRVR6yF4kvdf6eXwg PartitionCount: 3       ReplicationFactor: 1    Configs: flush.messages=1,max.message.bytes=64000
  Topic: healthcheck       Partition: 0    Leader: 102     Replicas: 102   Isr: 102
  Topic: healthcheck       Partition: 1    Leader: 101     Replicas: 101   Isr: 101
  Topic: healthcheck       Partition: 2    Leader: 100     Replicas: 100   Isr: 100
```
