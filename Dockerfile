FROM openjdk:8-jdk-alpine
# Create a group and user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Tell docker that all future commands should run as the appuser user
USER appuser
ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS
WORKDIR /home/appuser/jpos
RUN pwd
RUN ls -la
EXPOSE 8000
CMD java -server \
    -Xmx1G \
    -Dcom.sun.management.jmxremote \
    -jar jpos-2.1.1-SNAPSHOT.jar --pid=jpos.pid "$@"
