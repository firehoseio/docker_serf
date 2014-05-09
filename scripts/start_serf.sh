#!/usr/bin/env bash

: ${SERF_CLUSTER:="firehose"}
: ${SERF_ROLE:="firehose"}

/usr/local/bin/serf agent -discover $SERF_CLUSTER -tag role=$SERF_ROLE

