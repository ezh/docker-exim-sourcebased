#!/bin/bash
#

chmod a+r /dev/fd/0
chmod a+w /dev/fd/1
chmod a+w /dev/fd/2

exec $@
