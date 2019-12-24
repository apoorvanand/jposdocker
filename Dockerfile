FROM openjdk:8-jdk-alpine
ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS
WORKDIR /jpos
COPY  . .
RUN ls -la
EXPOSE 8000
CMD java -server \
    -Xmx1G \
    -Dcom.sun.management.jmxremote \
    -jar jpos-2.1.1-SNAPSHOT.jar --pid=jpos.pid "$@"
