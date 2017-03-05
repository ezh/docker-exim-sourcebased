#!/bin/bash
#

chmod a+r /dev/fd/0
chmod a+w /dev/fd/1
chmod a+w /dev/fd/2

EXIM_USER_ID=$(id -u exim)
EXIM_GROUP_ID=$(id -g exim)

# Environment variables are set before first run
# Set initial UID:GID
if [ -n "$USER_ID" -a "$USER_ID" != "$EXIM_USER_ID" ]
then
    echo Change EXIM user id from $EXIM_USER_ID to $USER_ID
    usermod -u $USER_ID exim
fi
if [ -n "$GROUP_ID" -a "$GROUP_ID" != "$EXIM_GROUP_ID" ]
then
    echo Change EXIM group id from $EXIM_GROUP_ID to $GROUP_ID
    groupmod -g $GROUP_ID exim
fi
echo Exim user defined as `id exim`

exec $@
