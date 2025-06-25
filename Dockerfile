# use official Tomcat image as base image
FROM tomact:9.0.14-jre8-alpine

LABEL maintainer="github.com/asecurityguru"

#remove deafult Tomcat application
RUN rm -rf /usr/local/tomact/webapps/ROOT/*

# copy our web application to the Tomcat webapps directory
COPY webapp/ /usr/local/tomcat/webapps/ROOT/

# change defaul shell to bash
RUN ln -sf /bin/bash/ /bin/sh

#expose deafult Tomcat port
EXPOSE 8080

#start Tomcat when the container starts
CMD ["catalina.sh","run"]