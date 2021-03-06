#!/bin/bash

# Oauth keys can be found on the developer.mbed.org/admin page under
# Oauth2_Provider -> Applications -> code.mbed
source oauth_keys

NAME=mbed-code
PARAMS=""
PARAMS="$PARAMS --name $NAME"
PARAMS="$PARAMS -e GITLAB_PORT=10080"
PARAMS="$PARAMS -e GITLAB_SSH_PORT=10022"
PARAMS="$PARAMS -e GITLAB_EMAIL=noreply@code.mbed.com"
PARAMS="$PARAMS -e GITLAB_GRAVATAR_ENABLED=false"
PARAMS="$PARAMS -e OAUTH_MBED_GITLAB_KEY=$OAUTH_MBED_GITLAB_KEY"
PARAMS="$PARAMS -e OAUTH_MBED_GITLAB_SECRET=$OAUTH_MBED_GITLAB_SECRET"
PARAMS="$PARAMS -p 10022:22"
PARAMS="$PARAMS -p 10080:80"
PARAMS="$PARAMS -v /var/run/docker.sock:/run/docker.sock"
PARAMS="$PARAMS -v $(which docker):/bin/docker"
PARAMS="$PARAMS -v /home/git/data"

exec docker run -it --link=postgresql-gitlab:postgresql --link=redis-gitlab:redisio --rm $PARAMS mbed/gitlab
