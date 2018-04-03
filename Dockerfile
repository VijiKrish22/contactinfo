# Pull base image
From tomcat:8-jre8

# Maintainer
MAINTAINER "xxx <xxx@gmail.com">

#RUN sed -i "s|8080|80|g" /usr/local/tomcat/conf/server.xml

# Copy to images tomcat path
ADD target/ContactInfo2.war /usr/local/tomcat/webapps/ContactInfo2.war

#EXPOSE 80
