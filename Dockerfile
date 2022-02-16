FROM tomcat:latest
LABEL maintainer "mr.shabuddinshaik@gmail.com"
RUN pwd
RUN exit
RUN cd /var/lib/jenkins/workspace/bookstore/target
COPY *.war /usr/local/tomcat/webapps/
RUN Completed.....!!!
