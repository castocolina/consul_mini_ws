#!/bin/bash
BASEDIR=$(dirname "$0")


mkdir -p tmp/exercise5

bash "${BASEDIR}/consul-demo2/gradlew" -p "${BASEDIR}/consul-demo2/" bootRun


