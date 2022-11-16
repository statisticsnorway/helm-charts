{{/*
Cluster name helper
*/}}
{{- define "app.cluster" -}}
{{- required "Cluster name is not defined!" .Values.cluster -}}
{{- end -}}

{{/*
Create application name
*/}}
{{- define "app.name" -}}
{{- required "Application name is not defined!" .Values.name | trunc 63 -}}
{{- end -}}

{{/*
Create generic labels
*/}}
{{- define "default.labels" -}}
app: {{ template "app.name" . }}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
release: {{ .Release.Name }}
heritage: {{ .Release.Service }}
billing-project: {{ required "Billingproject is not defined!" .Values.billingProject }}
{{- end -}}

{{/*
Create image variables
*/}}
{{- define "app.imageRepository" -}}
{{- required "Imagerepository is not defined!" .Values.image.repository -}}
{{- end -}}
{{- define "app.imageTag" -}}
{{- required "ImageTag is not defined!" .Values.image.tag -}}
{{- end -}}

{{/*
Create Prometheus labels
*/}}
{{- define "prometheus.labels" -}}
"prometheus.io/scrape": "true"
{{- if .Values.metrics.port }}
"prometheus.io/port": {{ .Values.metrics.port | quote }}
{{- end }}
{{- if .Values.metrics.path }}
"prometheus.io/path": {{ .Values.metrics.path | quote}}
{{- end }}
{{- if .Values.metrics.scheme }}
"prometheus.io/scheme": {{ .Values.metrics.scheme | quote}}
{{- end }}
{{- end -}}

{{/*
Create name of the service account to use
*/}}
{{- define "app.serviceAccountName" -}}
{{- if .Values.serviceAccount.name -}}
    {{ .Values.serviceAccount.name }}
{{- else -}}
    {{ template "app.name" . }}-sa
{{- end }}
{{- end -}}

{{/*
The "targetPort" is set in this priority

 - Set to "port.targetport" if defined
   This has the highest presendence

 - Set to "oauth2Proxy.port" if application is
   deployed with OAuth2 Proxy sidecar

 - Set to "apiGateway.port" if application
   is deployed without oauth2-proxy but
   with backends config

 - Set to "port.containerport"
   This is also the default and must be defined
*/}}
{{- define "app.targetPort" -}}
{{- if .Values.port.targetport -}}
  {{ .Values.port.targetport }}
{{- else if and .Values.oauth2Proxy.enabled (eq "frontend" .Values.appType) -}}
  {{ .Values.oauth2Proxy.port }}
{{- else if and (not .Values.oauth2Proxy.enabled) (.Values.backends) -}}
  {{ .Values.apiGateway.port }}
{{- else -}}
  {{ .Values.port.containerport }}
{{- end }}
{{- end -}}
{{/*
A restricted container security context for use in the deployment template.
See ".Values.ContainerSecurityContext" for main app security context.
*/}}
{{- define "global.ContainerSecurityContext" -}}
allowPrivilegeEscalation: false
privileged: false
readOnlyRootFilesystem: true
runAsNonRoot: true
runAsUser: 1000
runAsGroup: 1000
capabilities:
  drop: ["ALL"]
seccompProfile:
  type: RuntimeDefault
{{- end -}}
