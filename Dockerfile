# Step 1: Use Maven to build the application
FROM maven:3.8.5-openjdk-11 AS builder

# Set working directory inside the container
WORKDIR /app

# Copy the entire project into the container
COPY . .

# Build the project and package it into a WAR file
RUN mvn clean package

# Step 2: Use the official Tomcat base image for deployment
FROM tomcat:9.0

# Set Tomcat working directory
WORKDIR /usr/local/tomcat

# Copy the WAR file from the builder stage to the Tomcat webapps directory
COPY --from=builder /app/target/com.hotelmgmtsys.war webapps/

# Expose the Tomcat default HTTP port
EXPOSE 8080

# Start the Tomcat server
CMD ["catalina.sh", "run"]
