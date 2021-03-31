#FROM pietvandongen/docker-tomcat-development:latest
FROM tomcat:alpine

# tomcat-users.xml sets up user accounts for the Tomcat manager GUI
# and script access for Maven deployments
ADD tomcat/server.xml $CATALINA_HOME/conf/
ADD tomcat/tomcat-users.xml $CATALINA_HOME/conf/
ADD tomcat/context.xml $CATALINA_HOME/webapps/manager/META-INF/

# ADD tomcat/catalina.sh $CATALINA_HOME/bin/
ADD tomcat/run.sh $CATALINA_HOME/bin/run.sh

RUN chmod +x $CATALINA_HOME/bin/run.sh

# add MySQL JDBC driver jar
ADD tomcat/mysql-connector-java-5.1.44-bin.jar $CATALINA_HOME/lib/

# create mount point for volume with application
RUN mkdir $CATALINA_HOME/webapps/TheGamesDb

# add tomcat jpda debugging environmental variables
#ENV JPDA_OPTS="-agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n"
ENV JPDA_ADDRESS="8000"
ENV JPDA_TRANSPORT="dt_socket"

COPY ./app/target/TheGamesDb /usr/local/tomcat/webapps/TheGamesDb

# start tomcat7 with remote debugging
EXPOSE 8080
CMD ["run.sh"]
