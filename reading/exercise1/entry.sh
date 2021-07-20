#!/bin/bash

mkdir -p tmp/exercise1

consul-template \
    -template "reading/exercise1/template-4-json.tpl:tmp/exercise1/out.json" \
    -template "reading/exercise1/template-4-yaml.tpl:tmp/exercise1/out.yaml" \
    -template "reading/exercise1/template-4-keyvar.tpl:tmp/exercise1/common.txt" \
    -log-level debug -once

printf "\n\n\n\n"

{ type "yq" &> /dev/null && yq e -I4 tmp/exercise1/out.yaml; } || \
{
  cat tmp/exercise1/out.yaml
}

{ type "jq" &> /dev/null && jq '.' tmp/exercise1/out.json; } || \
{
  cat tmp/exercise1/out.json
}

cat tmp/exercise1/common.txt
