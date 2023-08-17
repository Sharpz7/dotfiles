#!/bin/bash

git remote add upstream $REPO || true
git fetch upstream
git checkout master
git merge upstream/master
git push origin master
