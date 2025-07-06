FROM openjdk:21-jdk-slim

# Set working directory
WORKDIR /app

# Pass the JAR file from Maven build
ARG JAR_FILE

# Copy the JAR file
COPY ${JAR_FILE} app.jar

# Copy dependencies
COPY target/dependency /app/libs

# Run the app with dependencies
ENTRYPOINT ["java", "-cp", "app.jar:libs/*", "com.example.Test"]