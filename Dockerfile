FROM openjdk:8-jre-alpine

ARG JAR_NAME hello-verticle-fatjar-3.0.0-SNAPSHOT-fat.jar
ENV VERTICLE_FILE $JAR_NAME

# Set the location of the verticles
ENV VERTICLE_HOME /usr/verticles

EXPOSE 8080

# Copy your fat jar to the container
COPY target/$VERTICLE_FILE $VERTICLE_HOME/

# Launch the verticle
WORKDIR $VERTICLE_HOME
ENTRYPOINT ["sh", "-c"]
CMD ["exec java -jar $VERTICLE_FILE"]
