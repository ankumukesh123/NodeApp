# use a node base image
FROM node:7-onbuild

# set maintainer
LABEL maintainer "ankumukesh.thakur@gmail.com"

RUN apt-get update -y
RUN apt-get install procps -y
RUN apt-get install apache2 -y
COPY index.html /var/www/html/
RUN mkdir Test

ENTRYPOINT ["/usr/sbin/apache2", "-k", "start"]

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2



# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1 && [apachectl -D FOREGROUND]

# tell docker what port to expose
EXPOSE 8000 80
