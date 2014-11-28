#!/bin/bash
cd /etc/puppet/
git add . 
git add -u 
git commit  -am "update `date`"
git push
