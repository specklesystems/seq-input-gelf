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
| replicaCount | int | `1` | The number of instances of seq-input-gelf to deploy |
| resources | object | `{}` |  |
| seq.apiKey.secretKey | string | `"api-key"` | The key in the Kubernetes secret containing the Seq API key |
| seq.apiKey.secretName | string | `"seq-api-key"` | The name of the Kubernetes secret containing the Seq API key |
| seq.diagnosticLogging | bool | `true` | Whether to enable diagnostic logging |
| seq.rustBackTrace | int | `0` | Whether to enable backtrace logging (used for debugging). 0 = disabled, 1 = enabled. |
| seq.tls.certificateSecretKey | string | `"tls.crt"` | The key in the Kubernetes secret containing the TLS certificate |
| seq.tls.enabled | bool | `false` | If true it enables TLS for the connection to gelf-input-seq. This will only be enabled if `service.protocol` is 'TCP'. |
| seq.tls.privateKeySecretKey | string | `"tls.key"` | The key in the Kubernetes secret containing the TLS private key |
| seq.tls.secretName | string | `"seq-tls"` | The name of the Kubernetes secret containing the TLS certificate |
| seq.url | string | `"http://seq:5341"` | The URL of the Seq server to send events to |
| service.port | int | `12201` | The port on which seq-input-gelf will listen for GELF messages |
| service.protocol | string | `"TCP"` | The protocol (either TCP or UDP) used by seq-input-gelf to listen for GELF messages |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` |  |

