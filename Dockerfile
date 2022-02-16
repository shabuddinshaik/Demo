FROM tomcat:latest
LABEL maintainer "mr.shabuddinshaik@gmail.com"
RUN pwd
RUN cd webapps
COPY /var/lib/jenkins/workspace/bookstore/target/*.war /usr/local/tomcat/webapps
RUN Completed.....!!!
