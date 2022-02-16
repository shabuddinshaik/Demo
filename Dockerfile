FROM tomcat:latest
LABEL maintainer "mr.shabuddinshaik@gmail.com"
WORKDIR /var/lib/jenkins/workspace/bookstore/target/
COPY *.war /usr/local/tomcat/webapp
RUN Completed.....!!!
