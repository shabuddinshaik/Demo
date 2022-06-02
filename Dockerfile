FROM tomcat:latest
LABEL maintainer "mr.shabuddinshaik123@gmail.com"
COPY target/*.war /usr/local/tomcat/webapps/
