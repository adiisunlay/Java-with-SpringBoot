# 1. Base image with JDK and Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build

# 2. Copy project files
WORKDIR /app
COPY . .

# 3. Build JAR file using Maven
RUN mvn clean package -DskipTests

# 4. Create actual runtime image
FROM eclipse-temurin:17-jdk

WORKDIR /app

# 5. Copy JAR from build stage
COPY --from=build /app/target/*.jar app.jar

# 6. Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
