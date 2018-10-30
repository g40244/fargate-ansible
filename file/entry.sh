#!/bin/sh
aws s3 cp s3://ansiblefiles.g40244.site/$1/* . --recursive
shift 1
exec $*
exit 0
