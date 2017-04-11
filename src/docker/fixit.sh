#!/bin/bash
# Run this AFTER you have successfully started and stopped Alfresco
pushd $(dirname $0)>/dev/null
export SCRIPTPATH=$(pwd)

echo -e '\n\n##Kafka Setup' >> $GLOBAL_PROPS \
 && echo 'audit.events.target.endpoint=kafka:kafkahost:9092?topic=alfresco.audit.events&zookeeperHost=zk&zookeeperPort=2181&groupId=group1&serializerClass=kafka.serializer.StringEncoder' >> $GLOBAL_PROPS \
 && echo 'messaging.events.published.amqp=kafka:kafkahost:9092?topic=alfresco.repo.activities&zookeeperHost=zk&zookeeperPort=2181&groupId=group1&serializerClass=kafka.serializer.StringEncoder' >> $GLOBAL_PROPS \
 && echo 'messaging.activiti.process.amqp=kafka:kafkahost:9092?topic=alfresco.repo.activiti.process&zookeeperHost=zk&zookeeperPort=2181&groupId=group1&serializerClass=kafka.serializer.StringEncoder' >> $GLOBAL_PROPS \
 && echo 'messaging.activiti.step.amqp=kafka:kafkahost:9092?topic=alfresco.repo.activiti.step&zookeeperHost=zk&zookeeperPort=2181&groupId=group1&serializerClass=kafka.serializer.StringEncoder' >> $GLOBAL_PROPS \
 && echo 'messaging.activiti.variable.amqp=kafka:kafkahost:9092?topic=alfresco.repo.activiti.variable&zookeeperHost=zk&zookeeperPort=2181&groupId=group1&serializerClass=kafka.serializer.StringEncoder' >> $GLOBAL_PROPS \
 && echo 'messaging.events.repo.node.targetTopic.endpoint=log:MessagesAreDisgarded?level=OFF' >> $GLOBAL_PROPS \
 && echo 'audit.alfresco-access.enabled=true' >> $GLOBAL_PROPS \
 && echo 'messaging.subsystem.autoStart=true' >> $GLOBAL_PROPS \
 && echo 'events.subsystem.autoStart=true' >> $GLOBAL_PROPS \
 && echo 'system.webdav.activities.enabled=true' >> $GLOBAL_PROPS
