# firehose-docker-serf

This is a Docker image that runs [Serf][serf] service discovery next to [Firehose][firehose]. It is designed to be used with a load balancer running Serf event handlers to dynamically add and remove Firehose nodes. See https://github.com/firehoseio/firehose-docker for the Firehose base Docker image that this is based on.

## Usage

Besides Firehose, there are two variables in this image, `$SERF_CLUSTER` and `$SERF_ROLE`. Both of these default to `firehose`. They control the Serf multicast (mDNS) discovery cluster name and `role` tag. Instances running Serf must be in the same cluster name to be discoverable.

A typical way to run this image would be to pass and environment file and publish the needed ports:

`docker run --env-file /my/firehose.env -p 7946/tcp -p 7946/udp --name fh1 -h fh1 andyshinn/firehose-docker-serf`

An example `firehose.env` file might look like:

    REDIS_URL=redis://redis.b3ldn2.0001.usw3.cache.amazonaws.com:6379/0
    SERF_CLUSTER=firehose
    SERF_ROLE=firehose
    WORKER_PROCESSES=4
    LOG_LEVEL=info
    PORT=7474
    HOST=0.0.0.0
    SERVER=rainbows
    RACK_ENV=production

[firehose]: http://firehose.io/
[serf]: http://www.serfdom.io/
