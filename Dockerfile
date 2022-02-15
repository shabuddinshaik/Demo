FROM tomcat:latest
COPY /var/lib/jenkins/workspace/bookstore/target/*.war /usr/share/tomcat/webapp
