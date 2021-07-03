#!/bin/bash

BASEDIR=$(dirname "$0")
DOWNDIR=$BASEDIR/tmp

source $BASEDIR/common.sh

rm -rf $DOWNDIR; mkdir -p $DOWNDIR

## https://releases.hashicorp.com/consul/1.10.0/consul_1.10.0_linux_amd64.zip
## https://releases.hashicorp.com/consul-template/0.26.0/consul-template_0.26.0_linux_amd64.zip


uname_s=$(uname -s | tr '[:upper:]' '[:lower:]')
CONSUL_PLATFORM="${uname_s}_amd64"

CONSUL_VERSION=$(get_github_latest_release hashicorp/consul)
CONSUL_FNAME="consul_${CONSUL_VERSION}_${CONSUL_PLATFORM}.zip"
CONSUL_URL="https://releases.hashicorp.com/consul/${CONSUL_VERSION}/$CONSUL_FNAME"

CONSUL_TEMPLATE_VERSION=$(get_github_latest_release hashicorp/consul-template)
CONSL_T_FNAME="consul-template_${CONSUL_TEMPLATE_VERSION}_${CONSUL_PLATFORM}.zip"
CONSUL_TEMPLATE_URL="https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/$CONSL_T_FNAME"

echo
echo ${CONSUL_URL}
echo ${CONSUL_TEMPLATE_URL}
echo

{ type "consul" &> /dev/null && echo "'consul' is INSTALLED!"; } || \
{
  echo "'consul' Not INSTALLED!";
  curl -o $DOWNDIR/$CONSUL_FNAME -fSL $CONSUL_URL;
  unzip $DOWNDIR/$CONSUL_FNAME -d $DOWNDIR
  ls -la $DOWNDIR;
  sudo mv -v $DOWNDIR/consul /usr/local/bin;
  rm $DOWNDIR/$CONSUL_FNAME;
}

echo
{ type "consul-template" &> /dev/null && echo "'consul-template' is INSTALLED!"; } || \
{
  echo "'consul-template' Not INSTALLED!";
  curl -o $DOWNDIR/$CONSL_T_FNAME -fSL $CONSUL_TEMPLATE_URL;
  unzip $DOWNDIR/$CONSL_T_FNAME -d $DOWNDIR
  ls -la $DOWNDIR;
  sudo mv -v $DOWNDIR/consul-template /usr/local/bin;
  rm $DOWNDIR/$CONSL_T_FNAME;
}

