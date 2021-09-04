# syntax=docker/dockerfile:1
FROM openjdk:8
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG HERITRIX_USER
ARG HERITRIX_PASS
ARG WCT_VERSION
ARG WCT_REFRESH
ARG WCT_MAX_HARVEST
ARG WCT_WEBAPP_MAX_MEM
ARG WCT_AGENT_MAX_MEM
ARG WCT_STORE_MAX_MEM
RUN apt-get update && apt-get -y install nano
RUN mkdir -p /wct
RUN wget -q https://github.com/WebCuratorTool/webcurator/releases/download/v${WCT_VERSION}/wct-binary-${WCT_VERSION}.tar.gz
RUN mv wct-binary-${WCT_VERSION}.tar.gz /wct/wct-binary-${WCT_VERSION}.tar.gz && cd /wct && tar -xzvf wct-binary-${WCT_VERSION}.tar.gz
#webapp
RUN mkdir -p /wct/wct-binary-${WCT_VERSION}/lib/webapp
RUN cd /wct/wct-binary-${WCT_VERSION}/lib && mv webcurator-webapp-${WCT_VERSION}.war webapp/webcurator-webapp-${WCT_VERSION}.war
RUN cd /wct/wct-binary-${WCT_VERSION}/lib/webapp && jar -xvf webcurator-webapp-${WCT_VERSION}.war
RUN rm /wct/wct-binary-${WCT_VERSION}/lib/webapp/webcurator-webapp-${WCT_VERSION}.war
#store
RUN mkdir -p /wct/wct-binary-${WCT_VERSION}/lib/store
RUN cd /wct/wct-binary-${WCT_VERSION}/lib/ && mv webcurator-store-${WCT_VERSION}.war store/webcurator-store-${WCT_VERSION}.war
RUN cd /wct/wct-binary-${WCT_VERSION}/lib/store && jar -xvf webcurator-store-${WCT_VERSION}.war
RUN rm /wct/wct-binary-${WCT_VERSION}/lib/store/webcurator-store-${WCT_VERSION}.war
#H3 agent
RUN mkdir -p /wct/wct-binary-${WCT_VERSION}/lib/agent
RUN cd /wct/wct-binary-${WCT_VERSION}/lib/ && mv webcurator-harvest-agent-h3-${WCT_VERSION}.jar agent/webcurator-agent-${WCT_VERSION}.jar
RUN cd /wct/wct-binary-${WCT_VERSION}/lib/agent && jar -xvf webcurator-agent-${WCT_VERSION}.jar
RUN rm /wct/wct-binary-${WCT_VERSION}/lib/agent/webcurator-agent-${WCT_VERSION}.jar
#copy and edit
COPY ./src /wct/wct-binary-${WCT_VERSION}/lib
COPY ./src/runtime /wct
RUN sed -i -e "s|dbuser|${MYSQL_USER}|" /wct/wct-binary-${WCT_VERSION}/lib/webapp/WEB-INF/classes/application-local+mysql.properties
RUN sed -i -e "s|dbpassword|${MYSQL_PASSWORD}|" /wct/wct-binary-${WCT_VERSION}/lib/webapp/WEB-INF/classes/application-local+mysql.properties
RUN sed -i -e "s|h3Wrapper.userName=user|h3Wrapper.userName=${HERITRIX_USER}|" /wct/wct-binary-${WCT_VERSION}/lib/agent/BOOT-INF/classes/application.properties
RUN sed -i -e "s|h3Wrapper.password=pass|h3Wrapper.password=${HERITRIX_PASS}|" /wct/wct-binary-${WCT_VERSION}/lib/agent/BOOT-INF/classes/application.properties
RUN sed -i -e "s|checkProcessorTrigger.repeatInterval=3000|checkProcessorTrigger.repeatInterval=${WCT_REFRESH}|" /wct/wct-binary-${WCT_VERSION}/lib/webapp/WEB-INF/classes/application.properties
RUN sed -i -e "s|harvestAgent.maxHarvests=6|harvestAgent.maxHarvests=${WCT_MAX_HARVEST}|" /wct/wct-binary-${WCT_VERSION}/lib/agent/BOOT-INF/classes/application.properties
RUN sed -i -e "s/version/${WCT_VERSION}/g" /wct/start.sh
RUN sed -i -e "s/webappmem/${WCT_WEBAPP_MAX_MEM}/g" /wct/start.sh
RUN sed -i -e "s/storemem/${WCT_STORE_MAX_MEM}/g" /wct/start.sh
RUN sed -i -e "s/agentmem/${WCT_AGENT_MAX_MEM}/g" /wct/start.sh
#make wars and jars again
RUN cd /wct/wct-binary-${WCT_VERSION}/lib/webapp && jar -0Mcvf ../webcurator-webapp-${WCT_VERSION}-1.war *
RUN cd /wct/wct-binary-${WCT_VERSION}/lib/store && jar -0Mcvf ../webcurator-store-${WCT_VERSION}-1.war *
RUN cd /wct/wct-binary-${WCT_VERSION}/lib/agent && jar -0Mcvf ../webcurator-agent-${WCT_VERSION}-1.jar *
EXPOSE 8080
CMD bash /wct/start.sh
