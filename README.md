# Speckle Repo Management Templates

[![Twitter Follow](https://img.shields.io/twitter/follow/SpeckleSystems?style=social)](https://twitter.com/SpeckleSystems) [![Community forum users](https://img.shields.io/discourse/users?server=https%3A%2F%2Fdiscourse.speckle.works&style=flat-square&logo=discourse&logoColor=white)](https://discourse.speckle.works) [![website](https://img.shields.io/badge/https://-speckle.systems-royalblue?style=flat-square)](https://speckle.systems) [![docs](https://img.shields.io/badge/docs-speckle.guide-orange?style=flat-square&logo=read-the-docs&logoColor=white)](https://speckle.guide/dev/)

## Introduction

This repository contains a Helm Chart for deploying [DataLust's `seq-input-gelf`](https://docs.datalust.co/docs/using-gelf#enabling-gelf-in-docker) Docker image to a Kubernetes cluster.

If deploying `seq-input-gelf` alongside `seq`, please use DataLust's [official Helm Chart](https://github.com/datalust/helm.datalust.co/tree/main/charts/seq). This Helm Chart allows `seq-input-gelf` to be deployed independently of `seq`.

You may wish to deploy `seq-input-gelf` if you are exporting logs in Graylog Extended Log Format (GELF).

You may wish to deploy `seq-input-gelf` independently of `seq` if you have a multiple Kubernetes clusters, and wish to transfer log data from a source cluster to a target cluster, running `seq`. Alternatively, you may have `seq` deployed on a non-Kubernetes environment, and wish to export logs messages from Kubernetes to that external seq instance.

## Documentation

Comprehensive developer and user documentation can be found in our:

### Usage

1. You will require [Helm](https://helm.sh/docs/intro/install/) and access to a [Kubernetes](https://kubernetes.io/) cluster to which you have appropriate permissions to deploy resources.
1. Clone this repository and in a shell terminal, `cd` in to the root directory of the cloned repository.
1. Edit the file `./example/values.yaml` to include your API key for seq.
1. Run the following command to install the helm chart in your kubernetes cluster. Note that this will create a new namespace named `seq-input-gelf`:

    ```shell
    helm upgrade seq-input-gelf \
    ./charts/seq-input-gelf \
    --create-namespace \
    --namespace seq-input-gelf \
    --install \
    --values ./example/values.yaml
    ```

1. Verify that the deployment has successfully [rolled out](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#deployment-status):

    ```shell
    kubectl rollout status deployment/seq-input-gelf --namespace seq-input-gelf
    ```

### Developing & Debugging

This doesn't make sense here, but in general, we should try to provide a small "how to" guide on local development and debugging, as it lowers the barrier to contributions.

### Contributing

Please make sure you read the [contribution guidelines](.github/CONTRIBUTING.md) and [code of conduct](.github/CODE_OF_CONDUCT.md) for an overview of the practices we try to follow.

### Community

This Helm Chart is maintained by Speckle. The Speckle Community hangs out on [the forum](https://discourse.speckle.works), do join and introduce yourself & feel free to ask us questions!

## Security

For any security vulnerabilities or concerns, please contact us directly at security[at]speckle.systems.

## License

Unless otherwise described, the code in this repository is licensed under the Apache-2.0 License. Please note that some modules, extensions or code herein might be otherwise licensed. This is indicated either in the root of the containing folder under a different license file, or in the respective file's header. If you have any questions, don't hesitate to get in touch with us via [email](mailto:hello@speckle.systems).
