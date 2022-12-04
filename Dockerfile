FROM openjdk:17-oracle
EXPOSE 7070
ADD build/libs/sspr-0.0.1-SNAPSHOT.jar sspr.jar
ENTRYPOINT ["java", "-jar", "/sspr.jar"]