docker build -t intoxicate/docker-git:git-2.5.1-cpu-python3.5 -f cpu-based/Dockerfile context
docker build -t intoxicate/docker-git:git-2.5.1-gpu-python3.5-cuda9.0-cudnn7.0 gpu-based/Dockerfile context
