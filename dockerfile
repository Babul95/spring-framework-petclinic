FROM maven:3.6.3 as maven

WORKDIR /usr/src/app
COPY . /usr/src/app
RUN mvn package

FROM tomcat:8.5-jdk15-openjdk-oracle
ARG TOMCAT_FILE_PATH=/docker

WORKDIR /usr/local/tomcat/webapps/
COPY --from=maven /usr/src/app/target/petclinic.war /usr/local/tomcat/webapps/petclnic.war
