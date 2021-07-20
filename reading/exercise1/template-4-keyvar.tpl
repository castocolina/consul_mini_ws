{{ range tree "redis" }}
{{ .Key }}:{{ .Value }}{{ end }}


{{ range tree "my-team/common" }}
{{ .Key }}:{{ .Value }}{{ end }}
