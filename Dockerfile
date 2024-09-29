FROM openjdk:17-jdk-slim AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim

WORKDIR /app

COPY - from=build /app/target/jenkins.jar .

CMD ["java", "-jar", "jenkins.jar"]