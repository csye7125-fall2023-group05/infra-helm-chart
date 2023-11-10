# Infrastructure Helm Chart

This helm chart is to deploy a highly reliable and highly available [Kafka](https://kafka.apache.org/documentation/#quickstart) cluster.

This makes use of [Bitnami's Kafka Helm Chart](https://github.com/bitnami/charts/tree/main/bitnami/kafka) as a dependency.

- Adding the `bitnami/kafka` chart as a dependency:

```yaml
# Chart.yaml
dependencies:
  - name: kafka
    version: "26.4.x"
    repository: "https://charts.bitnami.com/bitnami"
```

- Install/update dependencies:

```bash
# adds the bitnami/kafka dependency chart in charts/ directory
helm dependency update
```

- The `values.yaml` overrides the configurations for the `kafka` dependency chart to create 3 brokers (along with other configurations).

```yaml
# values.yaml
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
  kraft:
    enabled: false
  zookeeper:
    enabled: true
    persistence:
      size: 1Gi
```
