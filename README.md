## Docker-git

Docker image that clones sources from git and executes them. 

## Pre-requisites

Repository cloned should contain boot.sh that will be executed after cloning.

Sample boot.sh
``` 
#!/usr/bin/env bash
/root/anaconda3/bin/pip install --no-cache-dir -r requirements.txt
/root/anaconda3/bin/python app.py
```

## Environment variables

### required
`REPO_LINK` - github or bitbucket repository SSH clone link

It is also required to mount a volume where the repository will be cloned from local file system into container `/repository` folder.

In case of private repositories you also have to mount deployment SSH key authorized to clone code repository

### optional
`TAG` - clone specified tag

`BRANCH` - clone specified branch (defaults to master)

`REPO_KEY` - RSA key filename (defaults to id_rsa)

if cloning using repository username/password instead SSH deployment key, please provide `REPO_LINK` without leading `https://`

`REPO_USER` - authorized user to clone requested repository

`REPO_PASS` - authorized user password to clone requested repository

## Example run

```
docker run --rm -ti \
    -p 5000:5000
    -v /path/to/clone/repository:/repository \
    -v ${PWD}/gitKey:/key/gitKey:ro \
    -e REPO_LINK=git@github.com:{user}/{repo}.git \
    -e REPO_BRANCH=master \    
    intoxicate/docker-git:git-2.5.1-gpu-python3.5-cuda9.0-cudnn7.0
```

## Example docker-compose
```
version: '3'
services:
  altris:
    image: intoxicate/docker-git:git-2.5.1-gpu-python3.5-cuda9.0-cudnn7.0
    ports:
      - "5000:5000"
    volumes:
      - ${PWD}/gitKey:/key/gitKey:ro
    environment:    
      REPO_LINK: git@github.com:{user}/{repo}.git
      REPO_KEY: gitKey  
``` 
## Build/Test

```bash
sudo ./build.sh build test 
```

Will rebuild image locally, start container and test that repo was cloned and server up and responding at http://127.0.0.1:5005/test/<test string> with JSON containing "param":"test string"

```bash
curl http://127.0.0.1:5005/test/test-token

{
    "status": "ok",
    "param": "test-token"
}

```



## Credits

Image based on [crunchgeek/git-clone](https://github.com/markhilton/docker-git-clone).

## TODOs

* load parameters and/or key from secrets
* implement sparse checkout, see [stackoverflow](https://stackoverflow.com/questions/4114887/is-it-possible-to-do-a-sparse-checkout-without-checking-out-the-whole-repository)
* parametrise entry point instead of hardcoded /boot.sh
 