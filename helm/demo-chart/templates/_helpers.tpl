{{- define "demo-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "demo-chart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{- define "demo-chart.labels" -}}
helm.sh/chart: {{ include "demo-chart.chart" . }}
{{ include "demo-chart.selectorLabels" . }}
{{- end }}

{{- define "demo-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "demo-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "demo-chart.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
