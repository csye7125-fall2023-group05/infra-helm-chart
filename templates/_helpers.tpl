{{/*
Expand the name of the chart.
*/}}
{{- define "infra-helm-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "infra-helm-chart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "infra-helm-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "infra-helm-chart.labels" }}
app: {{ .Values.podLabel.app }}
{{- end }}

{{/*
DB labels
*/}}
{{- define "infra-helm-chart.db.labels" }}
app: {{ .Values.postgresql.primary.podLabels.app }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "infra-helm-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "infra-helm-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{/*
ConfigMap data
*/}}
{{- define "infra-helm-chart.configData" }}
  broker_0: "{{ .Release.Name }}-kafka-broker-0.{{ .Release.Name }}-kafka-broker-headless.{{ .Values.namespace }}.svc.cluster.local:{{ .Values.configs.kafka_port }}"
  broker_1: "{{ .Release.Name }}-kafka-broker-1.{{ .Release.Name }}-kafka-broker-headless.{{ .Values.namespace }}.svc.cluster.local:{{ .Values.configs.kafka_port}}"
  broker_2: "{{ .Release.Name }}-kafka-broker-2.{{ .Release.Name }}-kafka-broker-headless.{{ .Values.namespace }}.svc.cluster.local:{{ .Values.configs.kafka_port}}"
  dbhost: "{{ include "postgresql.v1.primary.fullname" .Subcharts.postgresql }}-0.{{ include "postgresql.v1.primary.svc.headless" .Subcharts.postgresql }}.{{ .Values.namespace }}.svc.cluster.local"
  flyway_url: "jdbc:postgresql://{{ include "postgresql.v1.primary.fullname" .Subcharts.postgresql }}-0.{{  include "postgresql.v1.primary.svc.headless" .Subcharts.postgresql }}.{{ .Values.namespace }}.svc.cluster.local:{{ .Values.configs.dbport}}/{{ .Values.configs.db }}"
  {{- with .Values.configs }}
  db: {{ .db }}
  dbport: {{ .dbport | quote }}
  client_id: {{ .client_id }}
  topic: {{ .topic }}
  app_dbschema: {{ .app_dbschema }}
  {{- end}}

{{- end }}


{{/*
Secret data
*/}}
{{- define "infra-helm-chart.secretData" }}
  {{- with .Values.secret }}
  username: {{ .username | b64enc }}
  password: {{ .password | b64enc }}
  {{- end }}
{{- end }}

{{/*
Deployment Strategy
*/}}
{{- define "infra-helm-chart.deployStrategy" }}
{{- with .Values.deployStrat }}
type: {{ .rolling }}
rollingUpdate:
  maxSurge: {{ .maxSurge }}
  maxUnavailable: {{ .maxUnavailable}}
{{- end }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "infra-helm-chart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "infra-helm-chart.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
