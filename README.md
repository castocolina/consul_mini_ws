# Workshop to learn using hashicorp Consul agent & template

The objective of this small workshop is only to use Consul as key/value configration store

## Overview

## Main Goals
 1. Tools installation
 1. Start Agent node
 1. Add data from CLI
 1. Exercise 1: Using templates
 1. Exercise 2: CLI Program. Use Add / Change data from UI
 1. Exercise 3: Rest program. Using config file for templating and exec behavior
 1. Exercise 4: Rest program. Spring configuration, only reload beans afected by keys/config
 1. Exercise 5: Rest program. Multiple Spring configurations, format = yaml
 1. Security


### Tools Installation

Excute:

`make install-tools`

Or visit:
- [consul v1.10](https://learn.hashicorp.com/tutorials/consul/get-started-install?in=consul/getting-started)
- [consul-template v0.2x](https://github.com/hashicorp/consul-template#installation)
- Optional [jq v1.6](https://stedolan.github.io/jq/download/)
- Optional [yq v4.x](https://github.com/mikefarah/yq#install)

### Start Agent node

Execute:
`make run-local`

Execute:
`make open-ui`
to open the consul agent UI

### Add data

Execute:
`make add-data`

### Exercise 1: Using templates

Template once. Create template and parse file from data

Execute:
`make exercise1`

### Exercise 2: CLI Program. Use Add / Change data from UI

Exec mode. Template once before start application and make changes for proccess control (kill and start)

Execute:
`make exercise2`

### Exercise 3: Rest program. Using config file for templating and exec behavior

Config options with npm sample app. Use template, start application & restart with each changes

Execute:
`cd  reading/exercise3/api-server && npm i && cd ../../../`
to install node dependencies

Execute:
`make exercise3`

Execute:
`make open-exercise3`
to open the rest endpoint

### Exercise 4: Rest program. Spring configuration, only reload beans afected by keys/config

Load the application & change the greeting message prefix

Execute:
`make exercise4`

Execute:
`make open-exercise4`
to open the rest endpoint

### Exercise 5: Rest program. Multiple Spring configurations, format = yaml

Load the application & change the greeting message for application and common settings

We have 2 yaml config keys:
- my-team/common/data
- my-team/consul-demo2/data

These have a default prefix: `my-team`

with paths:
- common
- consul-demo2

Execute:
`make exercise5`

Execute:
`make open-exercise5`
to open the endpoints

## TODO
1. Security
2. Cluster configurations

## Links:

- https://learn.hashicorp.com/tutorials/consul/get-started?in=consul/getting-started
- https://www.consul.io/commands/kv/put
- https://github.com/hashicorp/consul-template#installation
- https://github.com/hashicorp/consul-template#environment
- https://github.com/hashicorp/consul-template/blob/master/docs/templating-language.md
- https://github.com/hashicorp/consul-template/blob/master/docs/modes.md#exec-mode
- https://github.com/hashicorp/consul-template/blob/master/docs/configuration.md#exec-mode
- SpringBoot: https://docs.spring.io/spring-cloud-consul/docs/current/reference/html/#spring-cloud-consul-config
- SpringBoot: https://docs.spring.io/spring-cloud-consul/docs/current/reference/html/appendix.html
- Quarkus: https://quarkus.io/guides/consul-config
