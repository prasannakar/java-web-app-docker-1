FROM tomcat:latest
# Dummy text to test 
COPY target/jav-webapp*.war /usr/local/tomcat/webapps/javawebapp.war
