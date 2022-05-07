#!/bin/sh
set -e

sdkmanager \
--cli install \
--logintype devzone \
--product Jetson \
--version 4.6.2 \
--targetos Linux \
--host \
--target JETSON_TX2_TARGETS \
--flash all \
--license accept

exec "$@"

