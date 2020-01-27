#!/bin/bash

set -x

hugo -b "http://sam.s-carter.co.uk"

printf ""
aws s3 --profile personal cp ./public/ s3://samcarterblog --recursive --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers
printf ""
sleep 3
printf ""
aws cloudfront --profile personal create-invalidation --distribution-id E38IQPAR031UV5 --paths "/*"
