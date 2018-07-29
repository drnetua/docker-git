#!/usr/bin/env bash

echo ">>>>$1<<<"
docker run -d --name test_container -p 5005:5000 -v "${PWD}"/testGitKey:/key/gitKey:ro -e REPO_LINK=git@github.com:gusa-tc/docker-python.git -e REPO_KEY=gitKey "$1"



# give 1 minute to complete starting container

#sleep 1m

#response=$(curl http://127.0.0.1:5000/test/test-token)

#echo "$response"

#docker rm -f test_container


