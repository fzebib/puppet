#!/bin/bash
git add . && \
git add -u && \
git commit -am "update `date`"
git push
