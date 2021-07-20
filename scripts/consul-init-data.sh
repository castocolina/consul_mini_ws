#!/bin/bash

consul kv put redis/config/minconns 1
consul kv put redis/config/maxconns 25
consul kv put -flags=42 redis/config/users/admin abcd1234

echo -n "Hello World" | consul kv put my-team/common/gretting -
echo -n 1 | consul kv put my-team/common/delay -


read -r -d '' MY_SAMMPLE_JSON << EOF
{
    "gretting": "Hello Sample 1", 
    "delay": 1
}
EOF
consul kv put my-team/comp1-json "${MY_SAMMPLE_JSON}"


read -r -d '' MY_SAMMPLE_YAML << EOF
gretting: Hello Sample 2
delay: 1
EOF

consul kv put my-team/comp2-yaml "${MY_SAMMPLE_YAML}"
