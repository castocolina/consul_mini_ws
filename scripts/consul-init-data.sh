#!/bin/bash

consul kv put redis/config/minconns 1
consul kv put redis/config/maxconns 25
consul kv put -flags=42 redis/config/users/admin abcd1234

echo -n "Hello World" | consul kv put my-team/common/greeting -
echo -n 1 | consul kv put my-team/common/delay -


read -r -d '' MY_SAMMPLE_JSON << EOF
{
    "greeting": "Hello Sample 1", 
    "delay": 1
}
EOF
consul kv put my-team/comp1-json "${MY_SAMMPLE_JSON}"


read -r -d '' MY_SAMMPLE_YAML << EOF
greeting: Hello Sample 2
delay: 1
EOF

consul kv put my-team/comp2-yaml "${MY_SAMMPLE_YAML}"

### ---------------
read -r -d '' MY_SAMMPLE_YAML << EOF
greeting:
  message: "my-team > common == HellOoo, %s!"
  delay: 1
EOF

consul kv put my-team/common/data "${MY_SAMMPLE_YAML}"

read -r -d '' MY_SAMMPLE_YAML << EOF
greeting:
  message: "my-team > common,dev == HellOoo, %s!"
  delay: 1
EOF

consul kv put my-team/common,dev/data "${MY_SAMMPLE_YAML}"

read -r -d '' MY_SAMMPLE_YAML << EOF
greeting:
  message: "my-team > consul-demo2 == HellOoo, %s!"
  delay: 1
EOF

consul kv put my-team/consul-demo2/data "${MY_SAMMPLE_YAML}"

read -r -d '' MY_SAMMPLE_YAML << EOF
greeting:
  message: "my-team > consul-demo2,dev == HellOoo, %s!"
  delay: 1
EOF

consul kv put my-team/consul-demo2,dev/data "${MY_SAMMPLE_YAML}"
