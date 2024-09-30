FROM maven:3-openjdk-17 AS build

RUN mkdir /app  

WORKDIR /app

COPY . .

RUN mvn clean package -Dmaven.test.skip=true

FROM openjdk:17

WORKDIR /app

COPY --from=build /app/target/jenkins-3.3.4.jar .

EXPOSE 8085

CMD ["java", "-jar", "/jenkins.jar"]