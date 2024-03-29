# flux-alerts

![Version: 1.0.2](https://img.shields.io/badge/Version-1.0.2-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

Helm chart for configuring Flux Alerts

This Helm chart can be used to configure [Flux v2 alerts and providers](https://fluxcd.io/flux/guides/notifications/) for Slack.

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
			<td id="cluster"><a href="./values.yaml#L3">cluster</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
"Flux v2"
</pre>
</div>
			</td>
			<td>The name of the cluster. Used in the Slack message. Optional.</td>
		</tr>
		<tr>
			<td id="eventSeverity"><a href="./values.yaml#L13">eventSeverity</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
"info"
</pre>
</div>
			</td>
			<td>Set the event severity to be notified about. Valid values are: info, warning, error. Default is info.</td>
		</tr>
		<tr>
			<td id="eventSources"><a href="./values.yaml#L16">eventSources</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
[
  {
    "kind": "GitRepository",
    "name": "*"
  },
  {
    "kind": "Kustomization",
    "name": "*"
  },
  {
    "kind": "HelmRepository",
    "name": "*"
  },
  {
    "kind": "HelmChart",
    "name": "*"
  },
  {
    "kind": "HelmRelease",
    "name": "*"
  },
  {
    "kind": "ImageRepository",
    "name": "*"
  },
  {
    "kind": "ImagePolicy",
    "name": "*"
  },
  {
    "kind": "ImageUpdateAutomation",
    "name": "*"
  },
  {
    "kind": "Bucket",
    "name": "*"
  },
  {
    "kind": "OCIRepository",
    "name": "*"
  }
]
</pre>
</div>
			</td>
			<td>Defines a list of Flux v2 event sources. Optional. Default is sending notifications for all event sources.</td>
		</tr>
		<tr>
			<td id="exclusionList"><a href="./values.yaml#L38">exclusionList</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
[
  "Dependencies do not meet ready condition"
]
</pre>
</div>
			</td>
			<td>Defines a list of Flux v2 event messages to exclude.</td>
		</tr>
		<tr>
			<td id="slack"><a href="./values.yaml#L8">slack</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 400px;">
<pre lang="json">
{
  "channel": "",
  "token": ""
}
</pre>
</div>
			</td>
			<td>Slack channel and token to send notifications to. Channel name is required. Token is optional. The token must be a SealedSecret.encryptedData value. If no token is provided, a Secret or SealedSecret with the same name as the HelmRelease must be added separately.</td>
		</tr>
	</tbody>
</table>

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
