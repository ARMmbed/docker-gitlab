#!/bin/bash

source oauth_keys

NAME=mbed-code
PARAMS=""
PARAMS="$PARAMS --name $NAME"
PARAMS="$PARAMS -e GITLAB_PORT=10080"
PARAMS="$PARAMS -e GITLAB_SSH_PORT=10022"
PARAMS="$PARAMS -e GITLAB_EMAIL=noreply@code.mbed.com"
PARAMS="$PARAMS -e GITLAB_GRAVATAR_ENABLED=false"
PARAMS="$PARAMS -e OAUTH_MBED_API_KEY=$GITLAB_OAUTH_KEY"
PARAMS="$PARAMS -e OAUTH_MBED_APP_SECRET=$GITLAB_OAUTH_SECRET"
PARAMS="$PARAMS -p 10022:22"
PARAMS="$PARAMS -p 10080:80"
PARAMS="$PARAMS -v /var/run/docker.sock:/run/docker.sock"
PARAMS="$PARAMS -v $(which docker):/bin/docker"
PARAMS="$PARAMS -v /home/git/data"

exec docker run -it --link=postgresql-gitlab:postgresql --link=redis-gitlab:redisio --rm $PARAMS mbed/gitlab
