# Alfresco platform plus Kafka
#
# VERSION	1.0

FROM docker-internal.alfresco.com/platform:5.2.1-SNAPSHOT
MAINTAINER Gethin James, gethin.james@alfresco.com

COPY ./amps/* $ALFRESCO_HOME/amps/
RUN $ALFRESCO_HOME/java/bin/java -jar $ALFRESCO_HOME/bin/alfresco-mmt.jar install $ALFRESCO_HOME/amps $ALFRESCO_HOME/tomcat/webapps/alfresco.war -directory -verbose -nobackup

ADD fixit.sh $ALFRESCO_HOME/
RUN chmod +x $ALFRESCO_HOME/fixit.sh

RUN $ALFRESCO_HOME/fixit.sh
