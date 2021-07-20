### All options at https://github.com/hashicorp/consul-template/blob/master/docs/configuration.md


########################################
## Consul Template options
########################################

# This is the maximum interval to allow "stale" data. By default, only the
# Consul leader will respond to queries; any requests to a follower will
# forward to the leader. In large clusters with many requests, this is not as
# scalable, so this option allows any follower to respond to a query, so long
# as the last-replicated data is within these bounds. Higher values result in
# less cluster load, but are more likely to have outdated data.
max_stale = "10m"

# This is amount of time in seconds to do a blocking query for.
# Many endpoints in Consul support a feature known as "blocking queries".
# A blocking query is used to wait for a potential change using long polling.
block_query_wait = "60s"

# This is the log level. This is also available as a command line flag.
# Valid options include (in order of verbosity): trace, debug, info, warn, err
log_level = "info"

# This is the quiescence timers; it defines the minimum and maximum amount of
# time to wait for the cluster to reach a consistent state before rendering a
# template. This is useful to enable in systems that have a lot of flapping,
# because it will reduce the the number of times a template is rendered.
wait {
  min = "5s"
  max = "15s"
}

# This is the path to store a PID file which will contain the process ID of the
# Consul Template process. This is useful if you plan to send custom signals
# to the process.
pid_file = "tmp/exercise3/pid"


########################################
## Consul options
########################################

# This denotes the start of the configuration section for Consul. All values
# contained in this section pertain to Consul.
consul {
    # This is the address of the Consul agent. By default, this is
  # 127.0.0.1:8500, which is the default bind and port for a local Consul
  # agent. It is not recommended that you communicate directly with a Consul
  # server, and instead communicate with the local Consul agent. There are many
  # reasons for this, most importantly the Consul agent is able to multiplex
  # connections to the Consul server and reduce the number of open HTTP
  # connections. Additionally, it provides a "well-known" IP address for which
  # clients can connect.
  address = "127.0.0.1:8500"

  # This is a Consul Enterprise namespace to use for reading/writing. This can
  # also be set via the CONSUL_NAMESPACE environment variable.
  # BETA: this is to be considered a beta feature as it has had limited testing
  namespace = ""

  # This is the ACL token to use when connecting to Consul. If you did not
  # enable ACLs on your Consul cluster, you do not need to set this option.
  #
  # This option is also available via the environment variable CONSUL_TOKEN.
  # It is highly recommended that you do not put your token in plain-text in a
  # configuration file.
  token = ""

  # This controls the retry behavior when an error is returned from Consul.
  # Consul Template is highly fault tolerant, meaning it does not exit in the
  # face of failure. Instead, it uses exponential back-off and retry functions
  # to wait for the cluster to become available, as is customary in distributed
  # systems.
  retry {
    # This enabled retries. Retries are enabled by default, so this is
    # redundant.
    enabled = true

    # This specifies the number of attempts to make before giving up. Each
    # attempt adds the exponential backoff sleep time. Setting this to
    # zero will implement an unlimited number of retries.
    attempts = 12

    # This is the base amount of time to sleep between retry attempts. Each
    # retry sleeps for an exponent of 2 longer than this base. For 5 retries,
    # the sleep times would be: 250ms, 500ms, 1s, 2s, then 4s.
    backoff = "250ms"

    # This is the maximum amount of time to sleep between retry attempts.
    # When max_backoff is set to zero, there is no upper limit to the
    # exponential sleep between retry attempts.
    # If max_backoff is set to 10s and backoff is set to 1s, sleep times
    # would be: 1s, 2s, 4s, 8s, 10s, 10s, ...
    max_backoff = "1m"
  }
}

########################################
### Templates
########################################

template {
  # This is the source file on disk to use as the input template. This is often
  # called the "Consul Template template". This option is required if not using
  # the `contents` option.
  source = "reading/exercise3/config.json.tpl"

  # This is the destination path on disk where the source template will render.
  # If the parent directories do not exist, Consul Template will attempt to
  # create them, unless create_dest_dirs is false.
  destination = "reading/exercise3/api-server/config.json"

  # This options tells Consul Template to create the parent directories of the
  # destination path if they do not exist. The default value is true.
  create_dest_dirs = true

  # This is the maximum amount of time to wait for the optional command to
  # return. If you set the timeout to 0s the command is run in the background
  # without monitoring it for errors. If also using Once, consul-template can
  # exit before the command is finished. Default is 30s.
  command_timeout = "60s"

  # Exit with an error when accessing a struct or map field/key that does not
  # exist. The default behavior will print "<no value>" when accessing a field
  # that does not exist. It is highly recommended you set this to "true" when
  # retrieving secrets from Vault.
  error_on_missing_key = true

  # This is the `minimum(:maximum)` to wait before rendering a new template to
  # disk and triggering a command, separated by a colon (`:`). If the optional
  # maximum value is omitted, it is assumed to be 4x the required minimum value.
  # This is a numeric time with a unit suffix ("5s"). There is no default value.
  # The wait value for a template takes precedence over any globally-configured
  # wait.
  wait {
    min = "2s"
    max = "10s"
  }
}


########################################
### exec
########################################

exec {
  # This is the command to exec as a child process. There can be only one
  # command per Consul Template process.
  command = "node reading/exercise3/api-server/index.js"

  # This is a random splay to wait before killing the command. The default
  # value is 0 (no wait), but large clusters should consider setting a splay
  # value to prevent all child processes from reloading at the same time when
  # data changes occur. When this value is set to non-zero, Consul Template
  # will wait a random period of time up to the splay value before reloading
  # or killing the child process. This can be used to prevent the thundering
  # herd problem on applications that do not gracefully reload.
  splay = "1s"

  env {
    
  }

  # This defines the amount of time to wait for the child process to gracefully
  # terminate when Consul Template exits. After this specified time, the child
  # process will be force-killed (effectively "kill -9"). The default value is
  # "30s".
  kill_timeout = "2s"
}
