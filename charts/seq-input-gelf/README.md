# seq-input-gelf

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.0.441-x64](https://img.shields.io/badge/AppVersion-3.0.441--x64-informational?style=flat-square)

A Helm chart for deploying seq-input-gelf to Kubernetes

**Homepage:** <https://speckle.systems/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Speckle Systems |  | <https://speckle.systems/> |

## Source Code

* <https://github.com/specklesystems/speckle-server>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"datalust/seq-input-gelf"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| seq.apiKey.secretKey | string | `"api-key"` |  |
| seq.apiKey.secretName | string | `"seq-api-key"` |  |
| seq.diagnosticLogging | bool | `true` |  |
| seq.rustBackTrace | int | `0` |  |
| seq.url | string | `"http://seq:5341"` |  |
| service.port | int | `12201` |  |
| service.protocol | string | `"TCP"` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

