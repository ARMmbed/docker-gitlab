#!/bin/bash

NAME=mbed-code

PARAMS=""
PARAMS="$PARAMS --name $NAME"
PARAMS="$PARAMS -e GITLAB_PORT=10080"
PARAMS="$PARAMS -e GITLAB_SSH_PORT=10022"
PARAMS="$PARAMS -p 10022:22"
PARAMS="$PARAMS -p 10080:80"
PARAMS="$PARAMS -v /var/run/docker.sock:/run/docker.sock"
PARAMS="$PARAMS -v $(which docker):/bin/docker"
PARAMS="$PARAMS -v /home/git/data"

exec docker run -it --rm $PARAMS mbed/gitlab
