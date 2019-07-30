{{/* vim: set filetype=mustache: */}}

List the environmental variables related to the project
*/}}
{{- define "env.project" -}}
- name: PROJECT_NAME
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-configuration
      key: PROJECT_NAME
- name: PROJECT_ENVIRONMENT
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-configuration
      key: PROJECT_ENVIRONMENT
{{- end -}}

{{/*
List the environmental variables related to postgresql
*/}}
{{- define "env.postgresql" -}}
- name: POSTGRESQL_DATABASE
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-configuration
      key: POSTGRESQL_DATABASE
- name: POSTGRESQL_USER
  valueFrom:
    configMapKeyRef:
      name: {{ .Release.Name }}-configuration
      key: POSTGRESQL_USER
- name: POSTGRESQL_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-postgresql
      key: postgresql-password
{{- end -}}

{{/*
List the environmental variables related to the scraper
*/}}
{{- define "env.scraper" -}}
- name: WEATHERUNLOCKED_APP_ID
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-scraper-secret
      key: WEATHERUNLOCKED_APP_ID
- name: WEATHERUNLOCKED_APP_KEY
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-scraper-secret
      key: WEATHERUNLOCKED_APP_KEY
- name: OPENWEATHERMAP_APP_ID
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-scraper-secret
      key: OPENWEATHERMAP_APP_ID
{{- end -}}
