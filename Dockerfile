FROM metabrainz/base-image

RUN apt-get update \
    && apt-get install -y --no-install-recommends vsftpd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/vsftpd/empty \
 && mkdir -p /etc/vsftpd \
 && mkdir -p /var/ftp \
 && mv /etc/vsftpd.conf /etc/vsftpd.orig \
 && mkdir /etc/service/vsftpd

ADD vsftpd.sh /etc/service/vsftpd/run

VOLUME ["/var/ftp"]

EXPOSE 20-21
EXPOSE 65500-65515
