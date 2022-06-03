FROM gradle:7-jdk11 AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle shadowJar --no-daemon

FROM openjdk:11
EXPOSE 8080:8080
RUN mkdir /app
COPY /uploads /uploads
RUN rm /uploads/**
COPY --from=build /home/gradle/src/build/libs/*.jar /app/image_uploader_backend.jar
ENTRYPOINT ["java","-jar","/app/image_uploader_backend.jar"]
