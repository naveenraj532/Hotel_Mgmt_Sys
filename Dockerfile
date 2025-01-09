# Use an official Tomcat base image
FROM tomcat:9.0

# Set the working directory inside the container
WORKDIR /usr/local/tomcat/webapps/

# Copy your application files (JSP and others) into the container's webapps directory
COPY . /usr/local/tomcat/webapps/ROOT/

# Expose port 8080 for accessing the application
EXPOSE 8080

# Default command to start Tomcat
CMD ["catalina.sh", "run"]
