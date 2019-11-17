FROM openjdk:8-jdk-alpine
ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS
WORKDIR /jpos
COPY  . .
RUN ls -la
EXPOSE 8000
CMD /jpos/bin/q2
