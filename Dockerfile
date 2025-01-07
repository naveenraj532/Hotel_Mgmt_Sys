# Use an official Tomcat image
FROM tomcat:9.0

# Copy the WAR file into the webapps directory of Tomcat
COPY target/com.hotelmgmtsys.war /usr/local/tomcat/webapps/

# Expose the Tomcat default HTTP port
EXPOSE 8080

# Start the Tomcat server
CMD ["catalina.sh", "run"]
