# Pull base image
From tomcat:8-jre8

# Maintainer
MAINTAINER "xxx <xxx@gmail.com">

# Copy to images tomcat path
ADD target/ContactInfo2.war /usr/local/tomcat/webapps/ContactInfo2.war
