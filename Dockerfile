FROM openjdk:11-jre-slim
EXPOSE 8080

ADD target/validation-devops.jar validation-devops.jar
ENTRYPOINT ["java","-jar","/validation-devops.jar"]
