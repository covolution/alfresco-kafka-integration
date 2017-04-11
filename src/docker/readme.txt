This uses some images that are not publicly available.
However, they are not difficult to create.

The build:
* Uses an Alfresco repository docker image
* Applies the amps
* Runs fixit.sh to change alfresco.global.properties

The required amps are:
 * kafka-integration.amp  (this project)
 * audit-events.amp (alfresco-audit-events project)

The docker-compose file runs the 4 services together
 1. Alfresco repository image
 2. Alfresco Share image (optional)
 3. A Kafka image
 4. A kafkamanager image (optional)
