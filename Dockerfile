# use a node base image
FROM node:7-onbuild

# set maintainer
LABEL maintainer "ankumukesh.thakur@gmail.com"

RUN apt-get update -y
RUN apt-get install procps -y
RUN apt-get install apache2 -y
COPY index.html /var/www/html/
RUN mkdir Test


# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            #CMD curl -f http://127.0.0.1:8000 || exit 1
            CMD service apache2 start
#tell docker what port to expose
EXPOSE 8000 80
