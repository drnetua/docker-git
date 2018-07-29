#!/usr/bin/env bash

docker container rm -f test_container

docker run -d --name test_container -p 5005:5000 -v "${PWD}"/testGitKey:/key/gitKey:ro -e REPO_LINK=git@github.com:gusa-tc/docker-python.git -e REPO_KEY=gitKey "$1"

echo "Waiting 15 sec for container to boot"

sleep 15s

echo "probe..."

response=$(curl http://127.0.0.1:5005/test/test-token)

docker container rm -f test_container

if [[ $response = *"test-token"* ]] && [[ $response = *"param"* ]]; then
echo "success"
exit 0
else
echo "failure"
exit 100
fi




