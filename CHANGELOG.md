# [1.10.0](https://github.com/csye7125-fall2023-group05/infra-helm-chart/compare/v1.9.0...v1.10.0) (2023-12-09)


### Features

* add anti pod affinity for consumer app ([1c5213f](https://github.com/csye7125-fall2023-group05/infra-helm-chart/commit/1c5213f3d41159bed11d09c05d03ce5f8075899f))

# [1.9.0](https://github.com/csye7125-fall2023-group05/infra-helm-chart/compare/v1.8.1...v1.9.0) (2023-12-08)


### Bug Fixes

* adding dynamic kafka port ([1291755](https://github.com/csye7125-fall2023-group05/infra-helm-chart/commit/12917558db7738cd833015ebb9bf90e57c69e54c))
* dynamic broker host FQDNS ([68fe120](https://github.com/csye7125-fall2023-group05/infra-helm-chart/commit/68fe1200fda76dba8f4e92b70727be4e29a77d70))


### Features

* Add Istio Mesh Virtual Service ([55bddfb](https://github.com/csye7125-fall2023-group05/infra-helm-chart/commit/55bddfbd1d11b6c3a91932ccd8c030ccab2cdf5e))

## [1.8.1](https://github.com/csye7125-fall2023-group05/infra-helm-chart/compare/v1.8.0...v1.8.1) (2023-12-08)


### Bug Fixes

* disable istio for kafka provisioning pod ([8b52696](https://github.com/csye7125-fall2023-group05/infra-helm-chart/commit/8b52696331ca337b642d73f4b0c27df996078ff2))

# [1.8.0](https://github.com/csye7125-fall2023-group05/infra-helm-chart/compare/v1.7.0...v1.8.0) (2023-12-01)


### Bug Fixes

* update cpu limits and requests to consumer app ([726552e](https://github.com/csye7125-fall2023-group05/infra-helm-chart/commit/726552eeac29f9ad880cb8a4d172f5f1d537f5d9))


### Features

* add resource limits to consumer, kafka brokers and namespace ([183f551](https://github.com/csye7125-fall2023-group05/infra-helm-chart/commit/183f551d21129c9b99ffc711203123e9bd80a45d))

# [1.7.0](https://github.com/csye7125-fall2023-group05/infra-helm-chart/compare/v1.6.1...v1.7.0) (2023-11-29)


### Features

* adding network policy for consumer db ([d9c2fd3](https://github.com/csye7125-fall2023-group05/infra-helm-chart/commit/d9c2fd35c842aaedea5801b5f5944aff3dcd5eec))

## [1.6.1](https://github.com/csye7125-fall2023-group05/infra-helm-chart/compare/v1.6.0...v1.6.1) (2023-11-24)


### Bug Fixes

* update consumer init container image ([6685a5d](https://github.com/csye7125-fall2023-group05/infra-helm-chart/commit/6685a5def2c298b5b7e1a1e36fbbcae0f894f161))

# [1.6.0](https://github.com/csye7125-fall2023-group05/infra-helm-chart/compare/v1.5.0...v1.6.0) (2023-11-22)


### Features

* update image specs as parts ([5e72db4](https://github.com/csye7125-fall2023-group05/infra-helm-chart/commit/5e72db45657124aff41f9b894beeedb7ce287af0)), closes [#15](https://github.com/csye7125-fall2023-group05/infra-helm-chart/issues/15)

# [1.5.0](https://github.com/csye7125-fall2023-group05/infra-helm-chart/compare/v1.4.0...v1.5.0) (2023-11-20)


### Bug Fixes

* re-add podLabel ([042441e](https://github.com/csye7125-fall2023-group05/infra-helm-chart/commit/042441e5d3387a2cd51c1b2fa9ccc74599419907))


### Features

* add initContainer configuration for flyway db migration ([e44f472](https://github.com/csye7125-fall2023-group05/infra-helm-chart/commit/e44f4729c31af3e42346a09a280beafe675c71d2)), closes [#13](https://github.com/csye7125-fall2023-group05/infra-helm-chart/issues/13)

# [1.4.0](https://github.com/csye7125-fall2023-group05/infra-helm-chart/compare/v1.3.0...v1.4.0) (2023-11-19)


### Features

* add busybox initContainer ([bd5f6ac](https://github.com/csye7125-fall2023-group05/infra-helm-chart/commit/bd5f6ac3eccf44e6c7afa9421d4b7fbb870cd40b)), closes [#10](https://github.com/csye7125-fall2023-group05/infra-helm-chart/issues/10)

# [1.3.0](https://github.com/csye7125-fall2023-group05/infra-helm-chart/compare/v1.2.0...v1.3.0) (2023-11-18)


### Bug Fixes

* CI validation pipeline values.yaml ([d811952](https://github.com/csye7125-fall2023-group05/infra-helm-chart/commit/d81195277960665e91c7c769f00b4d30aa080793))
* remove secrets ([e2f0bc3](https://github.com/csye7125-fall2023-group05/infra-helm-chart/commit/e2f0bc35c683e650949ff1326b2de127e6775b4d))


### Features

* add consumer app helm chart as root chart ([9991d32](https://github.com/csye7125-fall2023-group05/infra-helm-chart/commit/9991d32d23f8301c8fb4a607b03586d665cd80cf)), closes [#8](https://github.com/csye7125-fall2023-group05/infra-helm-chart/issues/8) [#9](https://github.com/csye7125-fall2023-group05/infra-helm-chart/issues/9)

# [1.2.0](https://github.com/csye7125-fall2023-group05/infra-helm-chart/compare/v1.1.0...v1.2.0) (2023-11-17)


### Features

* install bitnami/postgresql chart dependency ([b1bfd5a](https://github.com/csye7125-fall2023-group05/infra-helm-chart/commit/b1bfd5a7447ec1c809dcb8d32f64fda11911bafd)), closes [#5](https://github.com/csye7125-fall2023-group05/infra-helm-chart/issues/5)

# [1.1.0](https://github.com/csye7125-fall2023-group05/infra-helm-chart/compare/v1.0.0...v1.1.0) (2023-11-10)


### Features

* add provisioner logic to kafka dependency chart ([9bf1622](https://github.com/csye7125-fall2023-group05/infra-helm-chart/commit/9bf1622907d6806b1fb082096dbb15a9568c64d0))

# 1.0.0 (2023-11-10)


### Bug Fixes

* ci lint test ([bd48ce1](https://github.com/csye7125-fall2023-group05/infra-helm-chart/commit/bd48ce1974488f1983e54dafb66701750da04130))


### Features

* install bitnami/kafka dependency helm chart ([b5c54f3](https://github.com/csye7125-fall2023-group05/infra-helm-chart/commit/b5c54f3423fec72f077a3e2bb284b12d633f688d)), closes [#1](https://github.com/csye7125-fall2023-group05/infra-helm-chart/issues/1)
