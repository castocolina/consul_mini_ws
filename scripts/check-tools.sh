#!/bin/bash

{ type "consul" &> /dev/null && echo "'consul' is INSTALLED!"; } || \
{
  echo "'consul' Not INSTALLED!";
  exit 1
}

{ type "consul-template" &> /dev/null && echo "'consul-template' is INSTALLED!"; } || \
{
  echo "'consul-template' Not INSTALLED!";
  exit 1
}
