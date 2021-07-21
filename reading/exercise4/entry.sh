#!/bin/bash
BASEDIR=$(dirname "$0")


mkdir -p tmp/exercise4

bash "${BASEDIR}/consul-demo/gradlew" -p "${BASEDIR}/consul-demo/" clean bootRun


