FROM ubuntu:latest

RUN apt update && apt install unzip wget cron -y

RUN mkdir /scripts/ \
    && cd /scripts/ \
    && wget https://console.amp.cisco.com/installer_store/UpdateManager/amp/linux/update-linux.zip \
    && unzip ./update-linux.zip \
    && rm ./update-linux.zip ./update-linux-i386

RUN mkdir -p /usr/share/nginx/html/

COPY entry.sh /scripts/entry.sh
COPY config.xml /scripts/config.xml
RUN chmod 755 /scripts/entry.sh

CMD ["/scripts/entry.sh"]
