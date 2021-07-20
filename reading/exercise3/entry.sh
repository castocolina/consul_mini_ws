#!/bin/bash
BASEDIR=$(dirname "$0")


mkdir -p tmp/exercise3


consul-template -config "${BASEDIR}/config.hcl"
