#!/usr/bin/env bash

build_image() {
echo "Building from >$1< with tag=>$2<";
docker build --no-cache --rm --build-arg FROM_IMAGE="$1" --tag "$2" -f ./Dockerfile context
}

BUILD_ARG="$1/$2/$3/$3"

if [[ $BUILD_ARG = *"build"* ]]; then
     FROM_IMAGE_REPO="microsoft/cntk"
     FROM_IMAGE_CPU_VERSION="2.5.1-cpu-python3.5"
     FROM_IMAGE_GPU_VERSION="2.5.1-gpu-python3.5-cuda9.0-cudnn7.0"

     FROM_IMAGE_NAME="$FROM_IMAGE_REPO:$FROM_IMAGE_CPU_VERSION"
     CPU_TAG="intoxicate/docker-git:git-$FROM_IMAGE_CPU_VERSION"
     build_image "$FROM_IMAGE_NAME" "$CPU_TAG"

     if [[ $? -ne 0 ]]
     then
       unset -v CPU_TAG
     fi

     FROM_IMAGE_NAME="$FROM_IMAGE_REPO:$FROM_IMAGE_GPU_VERSION"
     GPU_TAG="intoxicate/docker-git:git-$FROM_IMAGE_GPU_VERSION"
     build_image "$FROM_IMAGE_NAME" "$GPU_TAG"
     if [[ $? -ne 0 ]]
     then
       unset -v GPU_TAG
     fi
fi

if [[ $BUILD_ARG = *"test"* ]]; then

fi

if [[ $BUILD_ARG = *"push"* ]]; then
     if [ ! -z "$CPU_TAG" ]; then
          docker push "$CPU_TAG"
     fi

     if [ ! -z "$GPU_TAG_TAG" ]; then
          docker push "$CPU_TAG"
     fi
fi