#!/usr/bin/env bash

: ${SERF_CLUSTER:="firehose"}

/usr/local/bin/serf agent -discover $SERF_CLUSTER

