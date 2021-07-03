#!/bin/bash

function get_github_latest_release(){
  REPO_NAME=$1
  DEFAULT=$2
  FULL_URL="https://api.github.com/repos/$REPO_NAME/releases/latest"
  RELEASE=$(curl --silent $FULL_URL | sed -n 's/.*"tag_name": *"\([^"]*\)".*/\1/p' | sed 's/[^0-9.]//g')
  echo ${RELEASE:-$DEFAULT};
}
