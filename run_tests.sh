#!/usr/bin/env bash

DEFAULT_ACCESS_TOKEN=myawesometoke

: ${ACCESS_TOKEN:=${DEFAULT_ACCESS_TOKEN}}

docker run --rm \
           -e USERNAME="John Doe" \
           -e ACCESS_TOKEN=${ACCESS_TOKEN} \
           --net=host \
           -v "$PWD/output":/output \
           -v "$PWD/suites":/suites \
           -v "$PWD/scripts":/scripts \
           -v "$PWD/reports":/reports \
           --security-opt seccomp:unconfined \
           --shm-size "256M" \
           ypasmk/robot-framework
