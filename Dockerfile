FROM alpine
LABEL "AUTHOR" "multiwebview"
LABEL "VERSION" "0.0.1"
ENV REFRESHED_AT "2020-02-21"

WORKDIR /root

# install dependency
RUN apk update && apk add --no-cache tzdata openjdk8 unzip curl

# set time zone
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata

RUN tag_name=$(curl -sX GET "https://api.github.com/repos/zhaojun1998/zfile/releases/latest" | awk '/tag_name/{print $4;exit}' FS='[""]') \
    && file_name="zfile-${tag_name}.war" \
    && curl -O -L https://github.com/zhaojun1998/zfile/releases/download/${tag_name}/${file_name} && mv ${file_name} /root \
    && cd /root \
    && mkdir zfile \
    && unzip ${file_name} -d zfile \
    && rm -rf ${file_name} \
    && apk del curl unzip

RUN chmod -R 777 /root/zfile/bin \
    && sed -i "1c #!/bin/sh" zfile/bin/*.sh \
    && echo "tail -f /dev/null" >> zfile/bin/start.sh \
    && echo "tail -f /dev/null" >> zfile/bin/restart.sh

VOLUME [ "/root/.zfile/" ]

EXPOSE 8080

ENTRYPOINT [ "/root/zfile/bin/start.sh" ]