# firehose-docker-serf

This is a Docker image that runs [Serf][serf] service discovery next to [Firehose][firehose]. It is designed to be used with a load balancer running Serf event handlers to dynamically add and remove Firehose nodes. See https://github.com/firehoseio/firehose-docker for the Firehose base Docker image that this is based on.

## Usage

In addition to the environment variables available to Firehose, there is one additional variable in this image, `$SERF_CLUSTER`. This controls the Serf multicast discovery cluster name. Instances running Serf must be in the same cluster name to be discoverable.

A typical way to run this image would be to pass and environment file and publish the needed ports:

```shell
docker run --rm --env-file /my/firehose.env -p 7946/tcp -p 7946/udp --name firehose1 -h firehose1 andyshinn/firehose-docker-serf
```

An example `firehose.env` file might look like:

```shell
# URI to our Redis store
REDIS_URL=redis://redis.b3ldn2.0001.usw3.cache.amazonaws.com:6379/0

# The Serf cluster to discover using mDNS
SERF_CLUSTER=firehose

# The Rainbows! worker count to run
WORKER_PROCESSES=4

# Configure the verbosity of the logger
LOG_LEVEL=info

# Firehose port binding
PORT=7474

# Firehose IP address binding
HOST=0.0.0.0

# Server can be rainbows or thin
SERVER=rainbows

# Configure a production or development environment for Rainbows! or thin
RACK_ENV=production
```