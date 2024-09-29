FROM maven:3-openjdk-17 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

FROM openjdk:17

WORKDIR /app

COPY - from=build /app/target/jenkins.jar .

CMD ["java", "-jar", "/jenkins.jar"]