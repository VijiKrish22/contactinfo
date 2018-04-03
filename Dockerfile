# Pull base image
From tomcat:8-jre8

# Maintainer
MAINTAINER "xxx <xxx@gmail.com">

#RUN sed -i "s|8080|80|g" /usr/local/tomcat/conf/server.xml

RUN rm -r /usr/local/tomcat/webapps/ROOT

# Copy to images tomcat path
ADD target/ContactInfo.war /usr/local/tomcat/webapps/ROOT.war

#EXPOSE 80
