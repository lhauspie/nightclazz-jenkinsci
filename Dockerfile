FROM openjdk:8-jre-alpine

COPY ./target/demoapp.jar /app.jar

EXPOSE 8080

ENTRYPOINT ["java"]
CMD ["-jar","/app.jar"]
