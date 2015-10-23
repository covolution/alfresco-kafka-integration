/*
 * Copyright 2015 Alfresco Software, Ltd.  All rights reserved.
 *
 * License rights for this program may be obtained from Alfresco Software, Ltd. 
 * pursuant to a written agreement and any use of this program without such an 
 * agreement is prohibited. 
 */
package org.alfresco.messaging.camel.routes;

import org.apache.camel.spring.SpringRouteBuilder;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.apache.camel.component.kafka.KafkaConstants;
import org.apache.camel.Processor;
import org.apache.camel.Exchange;

/**
 * Route builder for events going to Kafka. Works around an issue with a mandatory PARTITION_KEY
 * 
 * @author Gethin James
 */
@Component
public class KafkaEventsRouteBuilder extends SpringRouteBuilder
{
    private static Log logger = LogFactory.getLog(KafkaEventsRouteBuilder.class);
      
    @Value("${messaging.events.kafka.direct}")
    public String sourceQueue = "direct-vm:alfresco.notset.sourceQueue"; //defaults to an invalid notset value
    
    @Value("${messaging.events.kafka.endpoint}")
    public String messageQueue = "direct-vm:alfresco.notset.messageQueue"; //defaults to an invalid notset value
    
    @Override
    public void configure() throws Exception
    {
        if (logger.isDebugEnabled())
        {
            logger.debug("SourceQueue is "+sourceQueue);
            logger.debug("messageQueue is "+messageQueue);
        }
        
        Processor myProcessor = new Processor() {
            public void process(Exchange exchange) {
                exchange.getIn().setHeader(KafkaConstants.PARTITION_KEY, "someKey");
            }
        };

        //From the direct source, use Processor, to messageQueue.
        from(sourceQueue)
        .process(myProcessor)
        .to(messageQueue).routeId("SourceDirect -> Kafka");

    }
}
