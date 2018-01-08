#!/bin/bash

set -euo pipefail

# Broker to connect to
if [ -z "${KAFKA_BROKER}" ]; then
	echo "=> Please pass KAFKA_BROKER environment variable"
	exit 1
fi
# Topic to publish to
if [ -z "${KAFKA_TOPIC}" ]; then
	echo "=> Please pass KAFKA_TOPIC environment variable"
	exit 1
fi
# PubNub key to subscribe to
if [ -z "${PUBNUB_SUBSCRIBE_KEY}" ]; then
	echo "=> Please pass PUBNUB_SUBSCRIBE_KEY environment variable"
	exit 1
fi
# Colon-delimited channels
if [ -z "${PUBNUB_CHANNELS}" ]; then
	echo "=> Please pass PUBNUB_CHANNELS environment variable"
	exit 1
fi

/pubnub.py | kafkacat -b $KAFKA_BROKER $KAFKA_TOPIC
