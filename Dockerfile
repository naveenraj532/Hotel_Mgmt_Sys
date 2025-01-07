# Use the official Tomcat base image
FROM tomcat:9.0

# Copy the WAR file into the webapps directory of Tomcat
COPY target/com.hotelmgmtsys.war /usr/local/tomcat/webapps/

# Expose the Tomcat default HTTP port
EXPOSE 8081

# Use Maven to build the application
FROM maven:3.8.5-openjdk-21 as builder
WORKDIR /app
COPY . .
RUN mvn clean package

# Use Tomcat to deploy the WAR file
FROM tomcat:9.0
COPY --from=builder /app/target/com.hotelmgmtsys.war /usr/local/tomcat/webapps/
EXPOSE 8081

