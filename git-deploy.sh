#!/bin/sh

echo "Add files and do local commit"
git add .
git commit -am "Welcome to terraform-learning"

echo "Pushing to Github Repository"
git push
