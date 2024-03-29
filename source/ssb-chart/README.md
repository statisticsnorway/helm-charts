# ssb-chart

![Version: 4.0.2](https://img.shields.io/badge/Version-4.0.2-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

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
			<td id="ContainerSecurityContext"><a href="./values.yaml#L278">ContainerSecurityContext</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="yaml">
# -- If processes should be allowed to gain more privileges than its parent process.
allowPrivilegeEscalation: false
# -- If processes in container can run privileged. This is equivalent to running as root on the host.
privileged: false
# -- If container should have a read-only root filesystem.
readOnlyRootFilesystem: true
# -- Container must run as a non-root user (e.g. not run as UID 0).
runAsNonRoot: true
# -- The UID to run the entrypoint of the container process.
# Defaults to the user specified in the image metadata if unspecified.
runAsUser: 1000
# -- The GID to run the entrypoint of the container process. Uses runtime default if unset.
runAsGroup: 1000
# -- (object) The capabilities to add/drop when running containers.
# Defaults to the default set of capabilities granted by the container runtime
# @notationType -- yaml
capabilities:
    drop: ["ALL"]
    add: []
# -- (object) Limit the range of system calls allowed.
# @notationType -- yaml
seccompProfile:
    # -- RuntimeDefault: As defined by the container runtime.
    type: RuntimeDefault

</pre>
</div>
			</td>
			<td>Container SecurityContext for main application. Default restricted security context for the application. If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence. Optional. Ref: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.25/#securitycontext-v1-core</td>
		</tr>
		<tr>
			<td id="ContainerSecurityContext--allowPrivilegeEscalation"><a href="./values.yaml#L280">ContainerSecurityContext.allowPrivilegeEscalation</a></td>
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
			<td>If processes should be allowed to gain more privileges than its parent process.</td>
		</tr>
		<tr>
			<td id="ContainerSecurityContext--capabilities"><a href="./values.yaml#L295">ContainerSecurityContext.capabilities</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="yaml">
drop: ["ALL"]
add: []

</pre>
</div>
			</td>
			<td>The capabilities to add/drop when running containers. Defaults to the default set of capabilities granted by the container runtime</td>
		</tr>
		<tr>
			<td id="ContainerSecurityContext--privileged"><a href="./values.yaml#L282">ContainerSecurityContext.privileged</a></td>
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
			<td>If processes in container can run privileged. This is equivalent to running as root on the host.</td>
		</tr>
		<tr>
			<td id="ContainerSecurityContext--readOnlyRootFilesystem"><a href="./values.yaml#L284">ContainerSecurityContext.readOnlyRootFilesystem</a></td>
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
			<td>If container should have a read-only root filesystem.</td>
		</tr>
		<tr>
			<td id="ContainerSecurityContext--runAsGroup"><a href="./values.yaml#L291">ContainerSecurityContext.runAsGroup</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
1000
</pre>
</div>
			</td>
			<td>The GID to run the entrypoint of the container process. Uses runtime default if unset.</td>
		</tr>
		<tr>
			<td id="ContainerSecurityContext--runAsNonRoot"><a href="./values.yaml#L286">ContainerSecurityContext.runAsNonRoot</a></td>
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
			<td>Container must run as a non-root user (e.g. not run as UID 0).</td>
		</tr>
		<tr>
			<td id="ContainerSecurityContext--runAsUser"><a href="./values.yaml#L289">ContainerSecurityContext.runAsUser</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
1000
</pre>
</div>
			</td>
			<td>The UID to run the entrypoint of the container process. Defaults to the user specified in the image metadata if unspecified.</td>
		</tr>
		<tr>
			<td id="ContainerSecurityContext--seccompProfile"><a href="./values.yaml#L300">ContainerSecurityContext.seccompProfile</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="yaml">
# -- RuntimeDefault: As defined by the container runtime.
type: RuntimeDefault

</pre>
</div>
			</td>
			<td>Limit the range of system calls allowed.</td>
		</tr>
		<tr>
			<td id="ContainerSecurityContext--seccompProfile--type"><a href="./values.yaml#L302">ContainerSecurityContext.seccompProfile.type</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
"RuntimeDefault"
</pre>
</div>
			</td>
			<td>RuntimeDefault: As defined by the container runtime.</td>
		</tr>
		<tr>
			<td id="PodSecurityContext"><a href="./values.yaml#L255">PodSecurityContext</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="yaml">
# -- Containers in pod must run as a non-root user (e.g. not run as UID 0).
runAsNonRoot:
# -- The UID to run the entrypoint of the container process.
# Defaults to the user specified in the image metadata if unspecified.
runAsUser:
# -- The GID to run the entrypoint of the container process. Uses runtime default if unset.
runAsGroup:
# -- All processes in the pod will be part of this supplementary group.
# Supported volume mounts will be owned by this group.
fsGroup:
# -- (object) Limit the range of system calls allowed.
# @notationType -- yaml
seccompProfile:
    # -- RuntimeDefault: As defined by the container runtime.
    type: RuntimeDefault

</pre>
</div>
			</td>
			<td>PodSecurityContext. Default security context for pods. If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence. Ref: https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.25/#podsecuritycontext-v1-core. Optional.</td>
		</tr>
		<tr>
			<td id="PodSecurityContext--fsGroup"><a href="./values.yaml#L265">PodSecurityContext.fsGroup</a></td>
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
			<td>All processes in the pod will be part of this supplementary group. Supported volume mounts will be owned by this group.</td>
		</tr>
		<tr>
			<td id="PodSecurityContext--runAsGroup"><a href="./values.yaml#L262">PodSecurityContext.runAsGroup</a></td>
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
			<td>The GID to run the entrypoint of the container process. Uses runtime default if unset.</td>
		</tr>
		<tr>
			<td id="PodSecurityContext--runAsNonRoot"><a href="./values.yaml#L257">PodSecurityContext.runAsNonRoot</a></td>
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
			<td>Containers in pod must run as a non-root user (e.g. not run as UID 0).</td>
		</tr>
		<tr>
			<td id="PodSecurityContext--runAsUser"><a href="./values.yaml#L260">PodSecurityContext.runAsUser</a></td>
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
			<td>The UID to run the entrypoint of the container process. Defaults to the user specified in the image metadata if unspecified.</td>
		</tr>
		<tr>
			<td id="PodSecurityContext--seccompProfile"><a href="./values.yaml#L268">PodSecurityContext.seccompProfile</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="yaml">
# -- RuntimeDefault: As defined by the container runtime.
type: RuntimeDefault

</pre>
</div>
			</td>
			<td>Limit the range of system calls allowed.</td>
		</tr>
		<tr>
			<td id="PodSecurityContext--seccompProfile--type"><a href="./values.yaml#L270">PodSecurityContext.seccompProfile.type</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
"RuntimeDefault"
</pre>
</div>
			</td>
			<td>RuntimeDefault: As defined by the container runtime.</td>
		</tr>
		<tr>
			<td id="access--egress--external"><a href="./values.yaml#L246">access.egress.external</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="access--egress--internal"><a href="./values.yaml#L247">access.egress.internal</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="access--ingress--external--gateways"><a href="./values.yaml#L243">access.ingress.external.gateways</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="access--ingress--internal"><a href="./values.yaml#L244">access.ingress.internal</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="affinity"><a href="./values.yaml#L62">affinity</a></td>
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
			<td id="apiGateway"><a href="./values.yaml#L345">apiGateway</a></td>
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
			<td id="backends"><a href="./values.yaml#L338">backends</a></td>
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
			<td id="billingProject"><a href="./values.yaml#L24">billingProject</a></td>
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
			<td id="cloudsql--enabled"><a href="./values.yaml#L311">cloudsql.enabled</a></td>
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
			<td id="cloudsql--instance"><a href="./values.yaml#L314">cloudsql.instance</a></td>
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
			<td id="cloudsql--ip"><a href="./values.yaml#L316">cloudsql.ip</a></td>
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
			<td id="cloudsql--useSqlProxy"><a href="./values.yaml#L318">cloudsql.useSqlProxy</a></td>
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
			<td id="cloudsql--version"><a href="./values.yaml#L312">cloudsql.version</a></td>
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
			<td id="configs"><a href="./values.yaml#L107">configs</a></td>
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
			<td id="domain"><a href="./values.yaml#L20">domain</a></td>
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
			<td id="environmentVariables"><a href="./values.yaml#L100">environmentVariables</a></td>
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
			<td id="extraPorts"><a href="./values.yaml#L94">extraPorts</a></td>
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
			<td id="image"><a href="./values.yaml#L30">image</a></td>
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
			<td id="image--pullPolicy"><a href="./values.yaml#L38">image.pullPolicy</a></td>
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
			<td id="image--repository"><a href="./values.yaml#L33">image.repository</a></td>
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
			<td id="image--tag"><a href="./values.yaml#L36">image.tag</a></td>
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
			<td id="metrics"><a href="./values.yaml#L206">metrics</a></td>
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
			<td id="nodeSelector"><a href="./values.yaml#L48">nodeSelector</a></td>
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
			<td id="oauth2Proxy--enabled"><a href="./values.yaml#L326">oauth2Proxy.enabled</a></td>
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
			<td id="oauth2Proxy--image"><a href="./values.yaml#L327">oauth2Proxy.image</a></td>
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
			<td id="oauth2Proxy--port"><a href="./values.yaml#L329">oauth2Proxy.port</a></td>
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
			<td id="oauth2Proxy--version"><a href="./values.yaml#L328">oauth2Proxy.version</a></td>
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
			<td id="persistence"><a href="./values.yaml#L124">persistence</a></td>
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
# -- Define owner user and owner group for the mounted volume.
# NOTE: Only use this option if setting the `PodSecurityContext.fsGroup` to the containers
# process UID (runAsUser) does NOT work.
# Optional.
owner:

</pre>
</div>
			</td>
			<td>Persistence defines whether app requires persistent volume. Once `enabled: true` is defined, corresponding sections under `volumes:` and `volumeMounts` will be automatically added to the deployment template. Only one persistent volume is supported at the moment. Optional.</td>
		</tr>
		<tr>
			<td id="persistence--accessMode"><a href="./values.yaml#L137">persistence.accessMode</a></td>
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
			<td id="persistence--createPvc"><a href="./values.yaml#L134">persistence.createPvc</a></td>
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
			<td id="persistence--enabled"><a href="./values.yaml#L127">persistence.enabled</a></td>
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
			<td id="persistence--folder"><a href="./values.yaml#L143">persistence.folder</a></td>
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
			<td id="persistence--owner"><a href="./values.yaml#L148">persistence.owner</a></td>
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
			<td>Define owner user and owner group for the mounted volume. NOTE: Only use this option if setting the `PodSecurityContext.fsGroup` to the containers process UID (runAsUser) does NOT work. Optional.</td>
		</tr>
		<tr>
			<td id="persistence--size"><a href="./values.yaml#L140">persistence.size</a></td>
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
			<td id="persistence--storageClass"><a href="./values.yaml#L131">persistence.storageClass</a></td>
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
			<td id="port"><a href="./values.yaml#L68">port</a></td>
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
			<td id="port--containerport"><a href="./values.yaml#L75">port.containerport</a></td>
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
			<td id="port--name"><a href="./values.yaml#L72">port.name</a></td>
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
			<td id="port--serviceport"><a href="./values.yaml#L78">port.serviceport</a></td>
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
			<td id="port--targetport"><a href="./values.yaml#L82">port.targetport</a></td>
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
			<td id="probes"><a href="./values.yaml#L182">probes</a></td>
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
			<td id="replicaCount"><a href="./values.yaml#L42">replicaCount</a></td>
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
			<td id="resources"><a href="./values.yaml#L169">resources</a></td>
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
			<td id="routes"><a href="./values.yaml#L356">routes</a></td>
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
			<td id="service"><a href="./values.yaml#L158">service</a></td>
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
			<td id="serviceAccount"><a href="./values.yaml#L217">serviceAccount</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="yaml">
create: true
# Two unique ID's are available for use with user/app authentication in todays platform
#
# 1. Keycloak unique client ID in the SSB Realm
#    This is "audience" referenced in the old IstioEndUserAuth config.
#    Caller and callee must agree on this authentication through the client config
#    and the validation.
#
# 2. Istio Spiffe ID/K8s SA
#   This is the "principal" referenced in AuthorizationPolicy manifest.
#
#   Applications must be referenced by their principal name
#   which is the unique Service Account name tied to a Spiffe/ID assigned by Istio.
#   This is needed to ensure the originity of the request (non-repudiation).
#
# The next (first) layer of security is Network policies. But note that these does not guarantee
# non-repuditation. Inside K8s applications in network policies are referenced by namespace and/or pod
# labels/names. These labels might not be unique.

# Policy example for an app with SA/name "app1" in namespace "n1"

</pre>
</div>
			</td>
			<td>Kubernetes service account. SA name is generated from the application name with a "-sa" suffix. Ref. https://github.com/helm/helm/blob/master/docs/chart_best_practices/rbac.md. Optional.</td>
		</tr>
		<tr>
			<td id="sidecars"><a href="./values.yaml#L153">sidecars</a></td>
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
			<td id="subdomains"><a href="./values.yaml#L362">subdomains</a></td>
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
			<td id="tolerations"><a href="./values.yaml#L54">tolerations</a></td>
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
			<td id="urlhosts"><a href="./values.yaml#L368">urlhosts</a></td>
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
			<td id="volumeMounts"><a href="./values.yaml#L117">volumeMounts</a></td>
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
			<td id="volumes"><a href="./values.yaml#L112">volumes</a></td>
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

## About Pod and Container Security

Pods are the smallest deployable Kubernetes unit and consist of one or more containers.
Pods are often a an attackers initial execution environment upon exploiting a container.
For this reason, Pods should be hardened to make exploitation more difficult and to limit
the impact of a successful compromise.

Preventing root execution by using non-root containers or a rootless container engine limits
the impact of a container compromise.

When configuring security contexts for pods and containers the aim is to be as strict as possible,
so that containers do not run as root user (UID 0) and with as few privileges as possible.

```text
If an application fails with the strict security context provided by this Helm chart,
the recommendation is to rebuild the application using a root-less container image.

For read/write access to a temporary folder use a "emptyDir" volume. See example further down.
```

### ContainerSecurityContext

This SecurityContext sets the security context for the main application.

If both the SecurityContext for a container and PodSecurityContext is set, the value specified in the
SecurityContext for the container takes precedence.

By default, this Helm chart sets a "restricted" security context for the application as shown below.
This ensures that the container follows the recommended security practice, and runs with as few privileges
as possible:

```yaml
ContainerSecurityContext:
  # If processes should be allowed to gain more privileges than its parent process.
  allowPrivilegeEscalation: false
  # If processes in container can run privileged. Setting this to `true` is equivalent
  # to running as root on the host.
  privileged: false
  # If container should have a read-only root filesystem.
  readOnlyRootFilesystem: true
  # Container must run as a non-root user (e.g. not run as UID 0).
  runAsNonRoot: true
  # The UID to run the entrypoint of the container process.
  # Defaults to the user specified in the image metadata if unspecified.
  runAsUser: 1000
  # The GID to run the entrypoint of the container process. Uses runtime default if unset.
  runAsGroup: 1000
  # The capabilities to add/drop when running containers.
  capabilities:
    drop: ["ALL"]
    add: []
  # Limit the range of system calls allowed.
  seccompProfile:
    # RuntimeDefault: As defined by the container runtime.
    type: RuntimeDefault
```

Please refer to the
[Kubernetes Guide for configuring a Security Context for a Pod or Container](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/)
documentation and the
[SecurityContext specification](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.25/#securitycontext-v1-core)
for more information.

### Workaround for read/write to temporary folders

Some applications need to read/write temporary data to a `/tmp` or a `/cache` folder. Because of this we take an optimistic
approach and mount a `/tmp` volume on all pods, such that the container don't have to override the default
`readOnlyRootFilesystem` setting. The simplest way to do to add  one or more temporary volumes (if `/tmp` is
not sufficient) is by adding `emptyDir` volumes to the HelmRelease. Example:

```
volumes:
  - name: cache-volume
    emptyDir: {}
volumeMounts:
  - name: cache-volume
    mountPath: /cache
```

The `name` must be unique, but the `mountPath` can be customized to the applications needs. Remember that data
in these volumes will be lost on pod restart.

### PodSecurityContext

A PodSecurityContext sets the default security context for all containers in a pod.

If both the SecurityContext for a container and PodSecurityContext is set, the value specified in the
SecurityContext for the container takes precedence.

The default PodSecurityPolicy sets the "seccompProfile" type to "RuntimeDefault".

See the "[Values](#values)" section for information about the available configuration options.

Please refer to the Kubernetes
[PodSecurityContext](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.25/#podsecuritycontext-v1-core)
specification for more information.

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

### backends

```yaml
backends:
  - name: "dataset-access"
    namespace: "dapla"
  - name: "backend-service"
    namespace: "backend"
```

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
