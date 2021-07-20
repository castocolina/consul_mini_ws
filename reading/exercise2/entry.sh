#!/bin/bash

mkdir -p tmp/exercise2

consul-template \
    -template "reading/exercise2/config.json.tpl:tmp/exercise2/config.json" \
    -template "reading/exercise2/config.properties.tpl:tmp/exercise2/config.properties" \
    -log-level debug \
    -exec "bash reading/exercise2/program.sh"

printf "\n\n\n\n"

{ type "jq" &> /dev/null && jq '.' tmp/exercise2/config.json; } || \
{
  cat tmp/exercise2/config.json
}

cat tmp/exercise2/config.properties
