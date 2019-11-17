FROM openjdk:8-jdk-alpine
# Create a group and user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Tell docker that all future commands should run as the appuser user
USER appuser
ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS
WORKDIR /home/appuser/jpos
COPY  . .
RUN ls -la
EXPOSE 8000
CMD /home/appuser/jpos/bin/q2