# Pull base image
From tomcat:8-jre8

# Maintainer
MAINTAINER "xxx <xxx@gmail.com">

RUN value=`cat /usr/local/tomcat/conf/server.xml` && echo "${value//8080/80}" >| /usr/local/tomcat/conf/server.xml

# Copy to images tomcat path
ADD target/ContactInfo2.war /usr/local/tomcat/webapps/ContactInfo2.war

EXPOSE 80
