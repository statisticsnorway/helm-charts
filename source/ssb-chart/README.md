# ssb-chart v1.3.0

SSB-Chart is a generic Helm Chart template to use as basis for applications to be deployed on the SSB Platform.

**This version of the chart is adapted to changes in Istio v1.10 - if unsure what version to use, ask team Stratus**

## Introduction

Use this template as basis for Flux deployment, and update the values in the Kubernetes manifest file

## Chart version changelog

### v1.3.0

- All bolean variables tested to work both as string and non-string values.

### v1.2.0

- Added support for custom application names/urlhosts. Follow [this link](https://github.com/statisticsnorway/ssb-developer-guide/blob/master/docs/deploy/gitops/helm-operator.md) for more information.

### v1.1.0

- Added support for custom subdomain name. Follow [this link](https://github.com/statisticsnorway/ssb-developer-guide/blob/master/docs/deploy/gitops/helm-operator.md) for more information.

### v1.0.0

- Initial release of ssb-chart

## Installing the Chart

To use the SSB-chart, define the chart in the Flux release file (Change __your-app-name__ to a unique name for your application, and select chart version; the highest available version number is recomended, i.e. `helm/charts/ssb-cart/v1.3.0`)

```YAML
spec:
  chart:
    git: "ssh://git@github.com/statisticsnorway/platform-dev"
    ref: "master"
    path: "helm/charts/ssb-chart/__chart-version__"
  releaseName: __your-app-name__
```

The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list --all-namespaces`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the ssb-chart and their default values.

Parameter | Description | Default
--- | --- | ---
`type`| Kubernetes deployment type |`deployment`
`name`| Name of the application (also used for naming other Kubernetes resources) |
`appType`| The type of application. Important as it decides the authentication. `backend` and `frontend` are the only valid options for now |
`cluster`| Name of the Kubernetes cluster |
`exposed`| Boolean to control whether or not to expose the application to the Internet (requires Istio service mesh) | `false`
`domain`| Domain to use for exposed services (this depends on where the Kubernetes cluster is running) | `ssb.no`
`billingProject` | What SSB project should resources be billed to |
`image.repository` | URL to the repository for the image | `_REPOSITORY_`
`image.tag` | Image tag | `_TAG_`
`ìmage.pullPolicy`| Update image automatically? | `Always`
`replicaCount`| Number of replicas to run |`1`
`port.name`| The name of the service port |`http-main`
`port.serviceport`| The service port of the service |`80`
`port.containerport`| The container port of the service |`80`
`port.targetport`| The target port of the service |
`extraPorts`| List of additional application ports (see `values.yaml` for example) | `[]`
`environmentVariables` | Environment variables for the app |
`configs` | Configs available to mount from `ConfigMap` | `[]`
`volumes` | Volumes available for mounting in the pods | `[]`
`volumesMounts` | Volume mounts for the main container in the pod | `[]`
`sidecars`| Defines additional containers to run in a pod |
`service.enabled`| Create a service object for loadbalancing of pods | `true`
`service.type`| Service type: ClusterIP or NodePort | `ClusterIP`
`resources.enabled` | Enable restrictions on resources requested and consumed by a single container | `true`
`resources.limits.cpu` | Restrict CPU resources limits for a single pod | `100m`
`resources.limits.memory` | Restrict memory resources limits for a single pod | `128Mi`
`resources.requests.cpu` | Specify CPU resources requested when starting a pod | `100m`
`resources.requests.memory` | Specify memory resources requested when starting a pod | `128Mi`
`probes.liveness.enabled` | Set liveness probe for container | `false`
`probes.liveness.livenessProbe.httpGet.port:` | Liveness probe port |
`probes.liveness.livenessProbe.httpGet.path:` | Liveness probe path |
`probes.liveness.livenessProbe.initialDelaySeconds:` | Liveness probe initial delay after creation | 60
`probes.liveness.livenessProbe.periodSeconds:` | Liveness probe period in seconds | 30
`probes.readiness.enabled` | Set readiness probe for container | `false`
`probes.readiness.livenessProbe.httpGet.port:` | Readiness probe port |
`probes.readiness.livenessProbe.httpGet.path:` | Readiness probe path |
`probes.readiness.livenessProbe.initialDelaySeconds:` | Readiness probe initial delay after creation | 60
`probes.readiness.livenessProbe.periodSeconds:` | Readiness probe period in seconds | 30
`metrics.enabled`| Enable metrics endpoint | `true`
`metrics.port`| Metrics endpoint port| `8081`
`metrics.path`| Metrics endpoint path| `/prometheus`
`metrics.scheme`| Metrics endpoint scheme | `https`
`serviceAccount.create` | Specifies whether a ServiceAccount should be created | `true`
`serviceAccount.name` | Override default name for the ServiceAccount | `<app.name>-sa`
`serviceAccount.annotations` | Set annotations on ServiceAccount | `{}`
`networkpolicy.enabled` | Define whether simple ingress NetworkPolicy will be generated | `true`
`networkpolicy.overrideDefaultPolicy` | Allows manual definition of a NetworkPolicy. **NB! Use with caution !** | `empty`
`PodSecurityContext.enabled`| Specify whether to consider PodSecurityContext template fragment in deployment.yaml| `false`|
`PodSecurityContext.runAsNonRoot`| [Documentation](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.13/#podsecuritycontext-v1-core)| `true`|
`PodSecurityContext.runAsUser`| [Documentation](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.13/#podsecuritycontext-v1-core) | `{}`, depends on container image and available users there|
`PodSecurityContext.fsGroup`| [Documentation](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.13/#podsecuritycontext-v1-core) | `{}`|
`ContainerSecurityContext.enabled`| Specify whether to consider ContainerSecurityContext template fragment deployment.yaml | `false`|
`ContainerSecurityContext.allowPrivilegeEscalation`| [Documentation](#links) | `false`|
`ContainerSecurityContext.privileged`| [Documentation](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.13/#securitycontext-v1-core) | `false`|
`ContainerSecurityContext.readOnlyRootFilesystem`| [Documentation](#links) | `false`|
`ContainerSecurityContext.runAsNonRoot`| [Documentation](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.13/#securitycontext-v1-core) | `true`|
`ContainerSecurityContext.runAsUser`| [Documentation](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.13/#securitycontext-v1-core) | `{}`|
`annotations` | [Documentation](https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/) | `{}`
`lifecycle.postStartCommand` | [Documentation](https://kubernetes.io/docs/tasks/configure-pod-container/attach-handler-lifecycle-event/#define-poststart-and-prestop-handlers) | `{}`
`hostAliases` | [Documentation](https://kubernetes.io/docs/concepts/services-networking/add-entries-to-pod-etc-hosts-with-host-aliases) | `{}`
`persistence.enabled` | Define whether to add a persistent volume and mount it under defined folder | `false`
`persistence.createPvc` | Define whether to generate and provision PersistentVolumeClaim using Helm. Set to false and provide PVC in a separate manifest to persist the data even if the HelmRelease is deleted | `true`
`persistence.size` | Define size of persistent volume | `1Gi` |
`persistence.folder` | Define mount folder | /data |
`persistence.accessMode` | [Documentation](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes) | `ReadWriteOnce`
`persistence.owner` | Define user and group owner of the mounted volume in `chown` command format, for example: "1000:1000" | Not defined
`deploymentStrategy` | [Documentation](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) | `rollingUpdate`
`egress` | A list of HTTPS services you need to reach outside of the service mesh | `[]`
`cloudsql` | Dictionary to control whether or not to set up a Cloud SQL Proxy sidecar that can connect to an external database | See values.yaml
`backends` | List of backend services that an application should be able to talk to (using an Nginx API Gateway) | `[]`
`apiGateway` | Configuration dictionary for the Nginx API Gateway (only used if `backends` is populated) | See below
`apiGateway.image` | The Docker image to use for the Nginx API Gateway sidecar | `bitnami/nginx`
`apiGateway.version` | The Docker image version to use for the Nginx API Gateway sidecar | `1.16`
`apiGateway.port` | The container port to use for the Nginx API Gateway sidecar | `1.16`
`nodeSelector` | [Documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#nodeselector) | nodeSelector.ssb-node=standard
`affinity` | [Documentation](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity) | {}
`tolerations` | [Documentation](https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/)| []
`istioEndUserAuth` | Configuration for overriding default [Policy for Istio end user auth](https://archive.istio.io/v1.4/docs/reference/config/security/istio.authentication.v1alpha1/) | See below
`istioEndUserAuth.enabled` | Enabled by default for "backend" applications | `true`
`istioEndUserAuth.includePaths` | Only require authentication for selected paths | `[]`
`istioEndUserAuth.excludePaths` | Do not require authentication for selected paths | `[]`
`istioEndUserAuth.audience` | Override default audience that must match "aud" claim in token | `<application name>`
`subdomains` | A optional list of subdomains where the application will be available (subdomains must be created in forehand by team Stratus) | `[]`
`urlhosts` | A optional list of hostnames to which the service will answer. If used in combination with subdomains, the names will be created in each subdomain. If used alone, the names will be created in 'ssb.no' in production environment, and in 'staging.ssb.no' in staging environment. | `[]`

## A note about boolean values and conditionals

There is a gotcha if one expects a boolean in a if-statement, but a string is provided:

```bash
{{- if .Values.exposed }}
````

This will evaluate to true whenever `exposed` exists (isn't Go nil) and isn't zero, literal false, or an empty string. If "false" is provided the expression will actually evaluate to true!
To avoid accidentally creating a resource one should check that the string is set AND that the toString-method on the value equals "true":

```bash
{{- if and (eq (toString .Values.exposed) "true") .Values.exposed }}
```

## Unit testing the Helm Chart

To be able to confidently change or refactor the `ssb-chart` templates, unit tests for the templates exists in the folder `helm/charts/ssb-chart/<version>/tests`.
The tests are run with the Helm plugin [airflow-helm-unittest](https://github.com/apache/airflow-helm-unittest), see [install guide](https://github.com/apache/airflow-helm-unittest#install) for installation.

To run the tests:

```bash
cd helm/charts/
helm unittest ssb-chart/<version>
```

### Values

There are two ways of specifying values that should override the default values in the chart:

* Using the `set` tag directly in the test
* Specifying a `values` file

Examples on both can be found in the [documentation](https://github.com/apache/airflow-helm-unittest/blob/development/DOCUMENT.md#test-job). The values files for the tests in `ssb-chart` can be found in the directory `helm/charts/ssb-chart/<version>/tests/values`.

### Release values

The values for the `release` itself are placed in the `release` tag in each test. See the [documentaion](https://github.com/apache/airflow-helm-unittest/blob/development/DOCUMENT.md#test-job)

### Asserting results

There are a number of ways to assert that the actual values generated are as to be expected. Please refer to the docs on [assertion types](https://github.com/apache/airflow-helm-unittest/blob/development/DOCUMENT.md#assertion-types) to see all possibilities.

One "special" kind of assertion is the `matchSnapshot` which saves the value for the path in a snapshot file in the `__snapshot__` directory. On the subsequent runs of the test, the value for the path will be compared to the saved snapshot. If there are changes in the template that makes the value for the path different, run the tests with the `-u` parameter to update the snapshot:

```bash
cd helm/charts/
helm unittest ssb-chart/<version> -u
```

### Tips, tricks and gotcha's writing unit tests

* Rembember it's all `yaml`, so indentation really(!) matters on all levels. As an example, if the error `invalid memory address or nil pointer dereference` is raised there is probably an indentation error in the test
* The file containing the test must reside in the folder `helm/charts/ssb-chart/<version>/tests/`
* The file containing the test must be suffixed `_test.yaml`, or else it will not be run
* If it is hard to calculate what actually is generated, the `matchSnapshot` assertion can be used to create a temporary snapshot file to view the output

## CI for the chart

There is a [pipeline](https://dev.azure.com/statisticsnorway/Stratus/_build?definitionId=175&_a=summary) in the Team Stratus' project on Azure Pipelines, which run the unit tests described above. It also runs the test defined for the `manifestvalidator.sh` script.

The unit test job installs the [Helm unittest](https://github.com/quintush/helm-unittest) plugin and runs the unittests defined in the `tests` directory. The job to test the `manifestvalidator.sh` script installs Kind and YQ, and creates a `Kind` Kubernetes cluster. It also installs all namespaces and CRDs on the cluster. This job is quite like the pipeline for validating new/changed `HelmRelease` manifests. See the CI-paragraph in the [testing](https://github.com/statisticsnorway/ssb-developer-guide/blob/master/docs/deploy/testing.md) documentation. These two jobbs run i parallell.

Both jobs publish test results as a JUnit xml file which means the test runs can be viewed in the `Tests` tab on the run in Azure Pipelines.
