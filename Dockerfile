
FROM maven:3.8.1-openjdk-11 AS build
COPY . /app
WORKDIR /app
RUN mvn clean package


FROM openjdk:11-jre-slim
COPY --from=build /app/target/MatrixApp-1.0-SNAPSHOT.jar /app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]