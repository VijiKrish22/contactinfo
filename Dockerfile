# Pull base image
From tomcat:8-jre8

# Maintainer
MAINTAINER "xxx <xxx@gmail.com">

#RUN sed -i "s|8080|80|g" /usr/local/tomcat/conf/server.xml

# Copy to images tomcat path
ADD target/.war /usr/local/tomcat/webapps/.war

#EXPOSE 80
