#!/bin/bash

BASEDIR=$(dirname "$0")
DOWNDIR=$BASEDIR/../tmp

source $BASEDIR/common.sh

rm -rf $DOWNDIR; mkdir -p $DOWNDIR

## https://releases.hashicorp.com/consul/1.10.0/consul_1.10.0_linux_amd64.zip
## https://releases.hashicorp.com/consul-template/0.26.0/consul-template_0.26.0_linux_amd64.zip


uname_s=$(uname -s | tr '[:upper:]' '[:lower:]')
OS_PLATFORM="${uname_s}_amd64"

CONSUL_VERSION=$(get_github_latest_release hashicorp/consul)
CONSUL_FNAME="consul_${CONSUL_VERSION}_${OS_PLATFORM}.zip"
CONSUL_URL="https://releases.hashicorp.com/consul/${CONSUL_VERSION}/$CONSUL_FNAME"

CONSUL_TEMPLATE_VERSION=$(get_github_latest_release hashicorp/consul-template)
CONSUL_T_FNAME="consul-template_${CONSUL_TEMPLATE_VERSION}_${OS_PLATFORM}.zip"
CONSUL_TEMPLATE_URL="https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/$CONSUL_T_FNAME"

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
  curl -o $DOWNDIR/$CONSUL_T_FNAME -fSL $CONSUL_TEMPLATE_URL;
  unzip $DOWNDIR/$CONSUL_T_FNAME -d $DOWNDIR
  ls -la $DOWNDIR;
  sudo mv -v $DOWNDIR/consul-template /usr/local/bin;
  rm $DOWNDIR/$CONSUL_T_FNAME;
}



YQ_VERSION=$(get_github_latest_release mikefarah/yq)
YQ_FNAME="yq_${OS_PLATFORM}"
YQ_URL="https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/$YQ_FNAME"

echo
{ type "yq" &> /dev/null && echo "'yq' is INSTALLED!"; } || \
{
  echo "'yq' Not INSTALLED!";
  curl -o $DOWNDIR/$YQ_FNAME -fSL $YQ_URL && \
  ls -la $DOWNDIR && \
  sudo mv -v $DOWNDIR/${YQ_FNAME} /usr/local/bin/yq && \
  chmod +x /usr/local/bin/yq
}


JQ_VERSION=$(get_github_latest_release stedolan/jq)
JQ_PLATF="${OS_PLATFORM/linux_amd64/linux64}"
JQ_FNAME="jq-${JQ_PLATF}"
JQ_URL="https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/$JQ_FNAME"

echo
{ type "jq" &> /dev/null && echo "'jq' is INSTALLED!"; } || \
{
  echo "'jq' Not INSTALLED!";
  curl -o $DOWNDIR/$JQ_FNAME -fSL $JQ_URL && \
  ls -la $DOWNDIR && \
  sudo mv -v $DOWNDIR/${JQ_FNAME} /usr/local/bin/jq && \
  chmod +x /usr/local/bin/jq
}
