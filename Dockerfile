FROM tomcat:latest
LABEL maintainer "mr.shabuddinshaik@gmail.com"
COPY target/*.war /usr/local/tomcat/webapps/
