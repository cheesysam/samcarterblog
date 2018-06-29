#!/bin/bash

set -x

hugo -b "http://d27j66pmjudaqa.cloudfront.net/"

printf ""
aws s3 cp ./public/ s3://samcarterblog --recursive --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers
printf ""
sleep 3
printf ""
aws cloudfront create-invalidation --distribution-id E38IQPAR031UV5 --paths /*
