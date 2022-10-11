FROM tomcat:latest
# Dummy text to test 
COPY target/javawebapp*.war /usr/local/tomcat/webapps/javawebapp.war
