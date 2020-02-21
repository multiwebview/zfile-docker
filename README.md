# zfile-docker

> This repository is the dokcer version of zfile, based on alpine latest image, and track the latest release verison of zfile

## Usage
```shell
docker run --name test \
-p 8080:8080 \
-v ~/zfile/:/root/.zfile/ \
unknown10/zfile-docker
```

