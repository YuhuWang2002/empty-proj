FROM maven:3.6.3-jdk-8-openj9 as builder
COPY ./settings.xml /usr/share/maven/conf/settings.xml
COPY ./demo /app
WORKDIR /app
RUN mvn package

FROM openjdk:8-jre-alpine
ENV APP_FILE demo-v1.jar
COPY --from=builder /app/target/*.jar /app/
WORKDIR /app
RUN touch xxxx
EXPOSE 8080
ENTRYPOINT ["sh", "-c"]
CMD ["exec java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005 -jar $APP_FILE"]