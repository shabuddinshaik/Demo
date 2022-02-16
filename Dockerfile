FROM tomcat:latest
LABEL maintainer "mr.shabuddinshaik@gmail.com"
WORKDIR /var/lib/jenkins/workspace/bookstore/target/
RUN make
COPY *.war /usr/local/tomcat/webapp
