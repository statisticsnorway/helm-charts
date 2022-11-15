# NOTES

## A note about boolean values and conditionals

There is a gotcha if one expects a boolean in a if-statement, but a string is provided:

```yaml
{{- if .Values.exposed }}
{{- end }}
```

This will evaluate to true whenever `exposed` exists and isn't zero, literal false, or an empty string. If "false" is
provided the expression will actually evaluate to true. To avoid accidentally creating a resource one should check that
the string is set AND that the toString-method on the value equals "true":

```yaml
{{- if and (eq (toString .Values.exposed) "true") .Values.exposed }}
{{- end }}
```
