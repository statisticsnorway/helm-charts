# ssb-chart

![Version: 2.3.4](https://img.shields.io/badge/Version-2.3.4-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

Generic chart for SSB applications

## Values

<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td id="ContainerSecurityContext"><a href="./values.yaml#L247">ContainerSecurityContext</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="yaml">
enabled: false
allowPrivilegeEscalation: false
privileged: false
readOnlyRootFilesystem: false
runAsNonRoot: true
runAsUser: {}

</pre>
</div>
			</td>
			<td>Container SecurityContext for main application. Ref: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.13/#securitycontext-v1-core. Optional.</td>
		</tr>
		<tr>
			<td id="PodSecurityContext"><a href="./values.yaml#L237">PodSecurityContext</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="yaml">
enabled: false
runAsNonRoot: true
runAsUser: {}
fsGroup: {}

</pre>
</div>
			</td>
			<td>PodSecurityContext. Ref: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.13/#podsecuritycontext-v1-core. Optional.</td>
		</tr>
		<tr>
			<td id="affinity"><a href="./values.yaml#L66">affinity</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
{}
</pre>
</div>
			</td>
			<td>Node affinity is a set of rules used by the scheduler to determine where a pod can be placed. The rules are defined using custom labels on nodes and label selectors specified in pods. Node affinity allows a pod to specify an affinity (or anti-affinity) towards a group of nodes it can be placed on. See examples section below for more details. Optional.</td>
		</tr>
		<tr>
			<td id="apiGateway"><a href="./values.yaml#L303">apiGateway</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="yaml">
image:
version:
port:

</pre>
</div>
			</td>
			<td>This is used together with the 'backends' config to specify which container image and port should be used for the backend-for-frontend (API gateway). NOTE: Do not add default values here. Default values for apiGateway is set in a shared config. Optional.</td>
		</tr>
		<tr>
			<td id="appType"><a href="./values.yaml#L12">appType</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
""
</pre>
</div>
			</td>
			<td>Application type: `"backend"` or `"frontend"`. Notet that this setting will impact how authentication is configured. Required.</td>
		</tr>
		<tr>
			<td id="backends"><a href="./values.yaml#L296">backends</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
[]
</pre>
</div>
			</td>
			<td>The 'backends' list is used to configure a backend-for-frontend (API gateway) to enable authenticated requests to other applications/API's. The proxy will forward request headers, including the authorization header. This will allow the app to make authenticated requests to the applications listed. Note that the application receiving the request must have the calling app in it's allowed audience list. A "backend" application is identified by a service name and a namespace. Required fields: "name" and "namespace". See examples section below for more details. Optional.</td>
		</tr>
		<tr>
			<td id="billingProject"><a href="./values.yaml#L28">billingProject</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
"default"
</pre>
</div>
			</td>
			<td>What billing project to use as label for the objects. Required.</td>
		</tr>
		<tr>
			<td id="cloudsql--enabled"><a href="./values.yaml#L269">cloudsql.enabled</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
false
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="cloudsql--instance"><a href="./values.yaml#L272">cloudsql.instance</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
null
</pre>
</div>
			</td>
			<td>Required.</td>
		</tr>
		<tr>
			<td id="cloudsql--ip"><a href="./values.yaml#L274">cloudsql.ip</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
null
</pre>
</div>
			</td>
			<td>Required.</td>
		</tr>
		<tr>
			<td id="cloudsql--useSqlProxy"><a href="./values.yaml#L276">cloudsql.useSqlProxy</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
true
</pre>
</div>
			</td>
			<td>Optional. Set to false if using Google connectors directly to omit adding a cloudsql-proxy.</td>
		</tr>
		<tr>
			<td id="cloudsql--version"><a href="./values.yaml#L270">cloudsql.version</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
null
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="cluster"><a href="./values.yaml#L16">cluster</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
null
</pre>
</div>
			</td>
			<td>Which Kubernetes cluster the app will be deployd to. Required.</td>
		</tr>
		<tr>
			<td id="configs"><a href="./values.yaml#L111">configs</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
[]
</pre>
</div>
			</td>
			<td>Defines a set of configs that should be deployed as a ConfigMap. Note that all configs will be created within one ConfigMap called <application_name>-config, but can be mounted to separate locations. See examples section below for more details. Optional.</td>
		</tr>
		<tr>
			<td id="domain"><a href="./values.yaml#L24">domain</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
"ssb.no"
</pre>
</div>
			</td>
			<td>Which domain the app will belong to. Optional.</td>
		</tr>
		<tr>
			<td id="egress"><a href="./values.yaml#L260">egress</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
[]
</pre>
</div>
			</td>
			<td>Defines a list of external https resources you need to be able to reach from your application. Wildcard is supported, but the Helm chart will replace '*' with 'wildcard' to avoid errors. See examples section below for more details. Optional.</td>
		</tr>
		<tr>
			<td id="environmentVariables"><a href="./values.yaml#L104">environmentVariables</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
null
</pre>
</div>
			</td>
			<td>Defines a set of environment variables for a main container of an app. In case of referring to volumes/secrets/configmaps remember to create those resources first See examples section below for more details. Optional.</td>
		</tr>
		<tr>
			<td id="exposed"><a href="./values.yaml#L20">exposed</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
false
</pre>
</div>
			</td>
			<td>Set to `true´ to expose application publicly through the ingress gateway. Optional.</td>
		</tr>
		<tr>
			<td id="extraPorts"><a href="./values.yaml#L98">extraPorts</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
[]
</pre>
</div>
			</td>
			<td>List of extra application ports in case the application needs to expose ports in addition to the normal application port. Usually not needed, unless using things like 'grpc' in addition to 'http'. For these extra ports it usually makes sense to use the same port for 'containerport' and 'targetport' to avoid collision with the normal application port. This should only be used if your application exposes more than one port. If your application exposes more than one port, you should override 'port' to suit your needs (e.g. if you only need 'http' or 'grpc'). See examples section below for more details. Optional.</td>
		</tr>
		<tr>
			<td id="image"><a href="./values.yaml#L34">image</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
{
  "pullPolicy": "Always",
  "repository": "",
  "tag": ""
}
</pre>
</div>
			</td>
			<td>Application image. Required.</td>
		</tr>
		<tr>
			<td id="image--pullPolicy"><a href="./values.yaml#L42">image.pullPolicy</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
"Always"
</pre>
</div>
			</td>
			<td>Image pullPolicy. Optional.</td>
		</tr>
		<tr>
			<td id="image--repository"><a href="./values.yaml#L37">image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="">
""
</pre>
</div>
			</td>
			<td>Image repository. Required.</td>
		</tr>
		<tr>
			<td id="image--tag"><a href="./values.yaml#L40">image.tag</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="">
""
</pre>
</div>
			</td>
			<td>Image tag. Required.</td>
		</tr>
		<tr>
			<td id="istioEndUserAuth"><a href="./values.yaml#L316">istioEndUserAuth</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="yaml">
# -- Enable or disable authentication.
# Istio end-user auth is enabled by default for "AppType: backend".
enabled: true

</pre>
</div>
			</td>
			<td>Application authentication with Istio policies. Skip authentication for selected paths with "excludePaths". Require authentication for selected paths with "includePaths". Note that "includePaths" have precedence over "excludePaths". Customize which apps that can authenticate to get access using "audience". See examples section below for more details. Optional.</td>
		</tr>
		<tr>
			<td id="istioEndUserAuth--enabled"><a href="./values.yaml#L319">istioEndUserAuth.enabled</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
true
</pre>
</div>
			</td>
			<td>Enable or disable authentication. Istio end-user auth is enabled by default for "AppType: backend".</td>
		</tr>
		<tr>
			<td id="metrics"><a href="./values.yaml#L208">metrics</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="yaml">
enabled: false
port: 80
path: "/metrics"
scheme: "https"

</pre>
</div>
			</td>
			<td>If "enabled: true", sets prometheus label to a service to enable scraping by prometheus server. Don't put quotes on boolean and numerical values. Optional.</td>
		</tr>
		<tr>
			<td id="name"><a href="./values.yaml#L7">name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
"myapp"
</pre>
</div>
			</td>
			<td>Name of the application (also used for naming other Kubernetes resources). Required.</td>
		</tr>
		<tr>
			<td id="networkpolicy"><a href="./values.yaml#L228">networkpolicy</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="yaml">
enabled: true
# -- Optionally create your own NetworkPolicy for the current application.
overrideDefaultPolicy: {}

</pre>
</div>
			</td>
			<td>Generates a simple "ingress" network policy (i.e. restrict incoming traffic to the application), that only allows traffic to 'port.containerport' (default) or 'port.targetport' (if specified), as well as any 'extraPorts'. This is a simple "ingress" network policy, "egress" traffic is not restricted here. See examples section below for more details. Optional.</td>
		</tr>
		<tr>
			<td id="networkpolicy--overrideDefaultPolicy"><a href="./values.yaml#L231">networkpolicy.overrideDefaultPolicy</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
{}
</pre>
</div>
			</td>
			<td>Optionally create your own NetworkPolicy for the current application.</td>
		</tr>
		<tr>
			<td id="nodeSelector"><a href="./values.yaml#L52">nodeSelector</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
{}
</pre>
</div>
			</td>
			<td>Node selector for selecting where the to schedule the workload. Standard nodes are labeled "ssb-node: standard". Jupyter nodes are labeled "ssb-node: jupyter". See examples section below for more details. Optional.</td>
		</tr>
		<tr>
			<td id="oauth2Proxy--enabled"><a href="./values.yaml#L284">oauth2Proxy.enabled</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
null
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="oauth2Proxy--image"><a href="./values.yaml#L285">oauth2Proxy.image</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
null
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="oauth2Proxy--port"><a href="./values.yaml#L287">oauth2Proxy.port</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
null
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="oauth2Proxy--version"><a href="./values.yaml#L286">oauth2Proxy.version</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
null
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="persistence"><a href="./values.yaml#L128">persistence</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="yaml">
# -- Enable persistent volume.
# Optional.
enabled: false
# -- Supported storage classes: "standard", "ssd"
# @default -- "standard"
# Optional.
storageClass:
# -- Create PVC. Set to "false" to use existing manifest file.
# Optional.
createPvc: true
# -- Set access mode: "ReadWriteOnce", "ReadOnlyMany", "ReadWriteMany", "ReadWriteOncePod".
# Required if "createPvc: true".
accessMode: ReadWriteOnce
# -- PVC disk size.
# Required if "createPvc: true".
size: 1Gi
# -- Mount path.
# Required.
folder: /data
# Define owner user and owner group for the mounted volume.
# Optional.
owner:

</pre>
</div>
			</td>
			<td>Persistence defines whether app requires persistent volume. Once `enabled: true` is defined, corresponding sections under `volumes:` and `volumeMounts` will be automatically added to the deployment template. Only one persistent volume is supported at the moment. Optional.</td>
		</tr>
		<tr>
			<td id="persistence--accessMode"><a href="./values.yaml#L141">persistence.accessMode</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
"ReadWriteOnce"
</pre>
</div>
			</td>
			<td>Set access mode: "ReadWriteOnce", "ReadOnlyMany", "ReadWriteMany", "ReadWriteOncePod". Required if "createPvc: true".</td>
		</tr>
		<tr>
			<td id="persistence--createPvc"><a href="./values.yaml#L138">persistence.createPvc</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
true
</pre>
</div>
			</td>
			<td>Create PVC. Set to "false" to use existing manifest file. Optional.</td>
		</tr>
		<tr>
			<td id="persistence--enabled"><a href="./values.yaml#L131">persistence.enabled</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
false
</pre>
</div>
			</td>
			<td>Enable persistent volume. Optional.</td>
		</tr>
		<tr>
			<td id="persistence--folder"><a href="./values.yaml#L147">persistence.folder</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
"/data"
</pre>
</div>
			</td>
			<td>Mount path. Required.</td>
		</tr>
		<tr>
			<td id="persistence--size"><a href="./values.yaml#L144">persistence.size</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
"1Gi"
</pre>
</div>
			</td>
			<td>PVC disk size. Required if "createPvc: true".</td>
		</tr>
		<tr>
			<td id="persistence--storageClass"><a href="./values.yaml#L135">persistence.storageClass</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="">
"standard"
</pre>
</div>
			</td>
			<td>Supported storage classes: "standard", "ssd" Optional.</td>
		</tr>
		<tr>
			<td id="port"><a href="./values.yaml#L72">port</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="yaml">
# -- name must start with protocol name (i.e.http or tcp). The name field is
# automatically truncated to 15 symbols.
# Optional.
name: "http-main"
# -- Port exposed by container.
# Optional.
containerport: 80
# -- Port exposed by service object.
# Optional.
serviceport: 80
# -- The target port on the POD to redirect traffic from the Service. This will usually be the
# applications container port.
# Optional.
targetport:

</pre>
</div>
			</td>
			<td>Main application port. Use 'extraPorts' for additional ports. This was separated to simplify the automation for developer usage. Optional.</td>
		</tr>
		<tr>
			<td id="port--containerport"><a href="./values.yaml#L79">port.containerport</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
80
</pre>
</div>
			</td>
			<td>Port exposed by container. Optional.</td>
		</tr>
		<tr>
			<td id="port--name"><a href="./values.yaml#L76">port.name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
"http-main"
</pre>
</div>
			</td>
			<td>name must start with protocol name (i.e.http or tcp). The name field is automatically truncated to 15 symbols. Optional.</td>
		</tr>
		<tr>
			<td id="port--serviceport"><a href="./values.yaml#L82">port.serviceport</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
80
</pre>
</div>
			</td>
			<td>Port exposed by service object. Optional.</td>
		</tr>
		<tr>
			<td id="port--targetport"><a href="./values.yaml#L86">port.targetport</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
null
</pre>
</div>
			</td>
			<td>The target port on the POD to redirect traffic from the Service. This will usually be the applications container port. Optional.</td>
		</tr>
		<tr>
			<td id="probes"><a href="./values.yaml#L184">probes</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="yaml">
liveness:
    enabled: false
    # Original formatting starts here
    livenessProbe:
        httpGet:
            port: ""
            path: ""
        initialDelaySeconds: 60
        periodSeconds: 30
readiness:
    enabled: false
    # Original formatting starts here
    readinessProbe:
        httpGet:
            port: ""
            path: ""
        initialDelaySeconds: 60
        periodSeconds: 30

</pre>
</div>
			</td>
			<td>Readiness and liveness probes for containers. Used format: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes. Don't put quotes on boolean and numerical values.</td>
		</tr>
		<tr>
			<td id="replicaCount"><a href="./values.yaml#L46">replicaCount</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
1
</pre>
</div>
			</td>
			<td>Number of pods to scale to (not HPA). Optional.</td>
		</tr>
		<tr>
			<td id="resources"><a href="./values.yaml#L171">resources</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="yaml">
enabled: true
limits:
    #cpu: 100m
    memory: 128Mi
requests:
    cpu: 100m
    memory: 128Mi

</pre>
</div>
			</td>
			<td>Defines restrictions on resources requested and consumed by a single pod. Total calculated resources = resources*replicaCount. Ref:  * https://kubernetes.io/docs/tasks/configure-pod-container/assign-memory-resource/  * https://kubernetes.io/docs/tasks/configure-pod-container/assign-cpu-resource/ Optional.</td>
		</tr>
		<tr>
			<td id="routes"><a href="./values.yaml#L327">routes</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
[]
</pre>
</div>
			</td>
			<td>Support for adding additional matching rules and routes to the Istio VirtualService object. Route traffic to a path specified in `name` to the service port specified `serviceport`. Note that "serviceport" must be unique and different from the default service port specified in "port.serviceport". See examples section below for more details. Optional.</td>
		</tr>
		<tr>
			<td id="service"><a href="./values.yaml#L160">service</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="yaml">
enabled: true
type: "ClusterIP"

</pre>
</div>
			</td>
			<td>Defines whether to create a service object for loadbalancing of pods and sets service type. Optional.</td>
		</tr>
		<tr>
			<td id="serviceAccount"><a href="./values.yaml#L219">serviceAccount</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="yaml">
create: true

</pre>
</div>
			</td>
			<td>Kubernetes service account. SA name is generated from the application name with a "-sa" suffix. Ref. https://github.com/helm/helm/blob/master/docs/chart_best_practices/rbac.md. Optional.</td>
		</tr>
		<tr>
			<td id="sidecars"><a href="./values.yaml#L155">sidecars</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
null
</pre>
</div>
			</td>
			<td>Defines additional containers to run in a pod. Bundles container settings into one yaml structure for simplicity. Follows the Kubernetes container spec. Optional.</td>
		</tr>
		<tr>
			<td id="subdomains"><a href="./values.yaml#L333">subdomains</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
[]
</pre>
</div>
			</td>
			<td>Alternative subdomains for the application. The default subdomain is `<cluster-name>`. Note that subdomains must be added to DNS for this to work. See examples section below for more details. Optional.</td>
		</tr>
		<tr>
			<td id="tolerations"><a href="./values.yaml#L58">tolerations</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
[]
</pre>
</div>
			</td>
			<td>Tolerations allow the scheduler to schedule pods on nodes with matching taints. The following taints exists for jupyter nodepools: `ssb-node=jupyter` See examples section below for more details. Optional.</td>
		</tr>
		<tr>
			<td id="type"><a href="./values.yaml#L3">type</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
"deployment"
</pre>
</div>
			</td>
			<td>Kubernetes deployment type. Optional.</td>
		</tr>
		<tr>
			<td id="urlhosts"><a href="./values.yaml#L339">urlhosts</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
[]
</pre>
</div>
			</td>
			<td>Alternative hostnames for the application. The default hostname is `<application name>`. Note that urlhosts must be added to DNS for this to work. See examples section below for more details. Optional.</td>
		</tr>
		<tr>
			<td id="volumeMounts"><a href="./values.yaml#L121">volumeMounts</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
[]
</pre>
</div>
			</td>
			<td>Defines volume mounts for the application. See examples section below for more details. Optional.</td>
		</tr>
		<tr>
			<td id="volumes"><a href="./values.yaml#L116">volumes</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
[]
</pre>
</div>
			</td>
			<td>Defines volumes available for mounting in pods. See examples section below for more details. Optional.</td>
		</tr>
	</tbody>
</table>

## Example values

### nodeSelector

Standard nodes are labeled "ssb-node: standard". Jupyter nodes are labeled "ssb-node: jupyter".

```yaml
nodeSelector:
  ssb-node: "jupyter"
```
See [nodeSelector](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#nodeselector)
for more information.

### tolerations

Example of "toleration" to ensure POD is scheduled on a jupyter nodepool:
```yaml
tolerations:
  effect: "NoSchedule"
  key: "ssb-node"
  operator: "Equal"
  value: "ssb-jupyter"
```
See [taints and toleration](https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/)
for more information.

### affinity

Alternative to nodeSelector.

Example: Avoid scheduling to a specific node:
```yaml
affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
        - matchExpressions:
          - key: "ssb-node"
            operator: NotIn
            values: ["jupyter"]
```
Example: Schedule new pods on dedicated node for "jupyter":
```yaml
affinity:
  nodeAffinity:
    preferredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
        - matchExpressions:
          - key: "ssb-node"
            operator: In
            values: ["jupyter"]
```
See [affinity and anti-affinity](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity)
for more information.

### extraPorts

```yaml
extraPorts:
    # Name of port must start with the protocol (i.e. 'grpc').
    # The value is automatically truncated to 15 symbols.
    # Required.
  - name: "grpc-main"
    # Container port. Must not be the same as application containerport or any
    # other defined containerport.
    # Optional.
    containerport: 1408
    # Service port. Must not be the same as application serviceport or any
    # other defined serviceport.
    # Optional.
    serviceport:
    # Target port in the POD to redirect traffic to. If not specified this will
    # default to containerport.
    # Optional.
    targetport:
```

### environmentVariables:

```yaml
environmentVariables:
  - name: TEST_ENV_VARIABLE
    value: "I_AM_A_VALUE"
```

### configs

```yaml
configs:
  - name: application.properties
    mountPath: /etc
    config: |
      key1=value1
      key2=value2
  - name: config.yaml
    mountPath: /config
    config: |
      key1: value1
      key2: value2
```

### volumes

```yaml
volumes:
  - name: test-volume
    hostPath:
      path: /data
  - name: secret-data
    secret:
      # Secret must already exist
      secretName: my-secret-data
      items:
      - key: username
        path: my-group/my-username
```
See [usage and formatting](https://kubernetes.io/docs/concepts/storage/volumes/) for more details.

### volumeMounts

```yaml
volumeMounts:
  - name: test-volume
    mountPath: "/media/test-volume"
    readOnly: true
    # resulting file "username" will be stored under /media/secret-data/my-group/my-username/
  - name: secret-data
    mountPath: "/media/secret-data"
    readOnly: true
```

See [mounting configmap as volume](https://kubernetes.io/docs/concepts/storage/volumes/#configmap)
for more details.

### networkpolicy

Example using overrideDefaultPolicy:
```yaml
networkpolicy:
  enabled: true
  overrideDefaultPolicy:
    ingress:
      # Allow ingress traffic on port 80 from all namespaces / pods of the cluster
      - ports:
          - port: 80
            protocol: TCP
        from:
          - namespaceSelector: {}

    egress:
      # Allow egress traffic to the Kubernetes DNS service
      - ports:
          - port: 53
            protocol: UDP
          - port: 53
            protocol: TCP
        to:
          - namespaceSelector: {}
            podSelector:
              matchLabels:
                k8s-app: kube-dns
```

Please refer to the [kubernetes documentation](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
for details.

### egress

```yaml
egress:
  - "dataproc.googleapis.com"
  - "*.cloudfront.net"
```

### backends

```yaml
backends:
  - name: "dataset-access"
    namespace: "dapla"
  - name: "backend-service"
    namespace: "backend"
```

### istioEndUserAuth

Skip authentication for selected paths:
```yaml
istioEndUserAuth:
  excludePaths:
    - "/public"   # Matches exactly "/public" path
    - "/public/*" # Matches everything under the "/public/" path
                  # but not the "/public/" path itself
```
Require authentication for selected paths use includePaths:
```yaml
istioEndUserAuth:
  includePaths:
    - "/auth"   # Matches exactly "/auth" path
    - "/auth/*" # Matches everything under "/auth/" path
```
Customize apps that can authenticate to get access:
```yaml
istioEndUserAuth:
  audience:
    - custom-audience-1
    - custom-audience-2
```

Please refer to the Istio documentation for more details:
- https://istio.io/latest/docs/reference/config/security/authorization-policy/
- https://istio.io/latest/docs/reference/config/security/request_authentication/

### routes

```yaml
routes:
  - name: "/auth"
    type: "prefix"
    serviceport: 8080
```

Please refer to the
[Kubernetes documentation](https://istio.io/docs/reference/config/networking/virtual-service/#StringMatch)
for valid values of "name" and "type".

### subdomains

```yaml
subdomains:
  - subdomain1
  - subdomain2
```

### urlhosts

```yaml
urlhosts:
  - testurl1
  - testurl2
```

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
