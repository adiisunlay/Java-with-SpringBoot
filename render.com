# Use OpenJDK base image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the jar file
COPY target/your-app-name.jar app.jar

# Command to run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
