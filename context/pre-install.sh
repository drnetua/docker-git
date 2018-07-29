#!/usr/bin/env bash

/root/anaconda3/bin/pip install --upgrade pip

/root/anaconda3/bin/pip install flask flask_restful cntk opencv-python

apt-get install -y build-essential cmake pkg-config \
    libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev \
        libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
            libxvidcore-dev libx264-dev libsm6 libxext6

apt-get install -y libxrender-dev






