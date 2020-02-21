# zfile-docker

> This repository is the dokcer version of zfile, based on alpine latest image, and track the latest release verison of zfile

## Usage


```shell
docker run -d --name zfile \
-p 8080:8080 \
-v ~/zfile/:/root/.zfile/ \
--restart=always \
vvision/zfile-docker
```

Thanks for [zhaojun1998/zfile](https://github.com/zhaojun1998/zfile)

