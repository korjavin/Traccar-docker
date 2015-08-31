FROM java:7

RUN apt-get update && apt-get install -y wget git curl zip && rm -rf /var/lib/apt/lists/* && mkdir /usr/share/traccar/

WORKDIR /usr/share/traccar/

RUN wget http://freefr.dl.sourceforge.net/project/traccar/traccar-linux-64-3.1.zip && unzip traccar-linux-64-3.1.zip && ./traccar.run

RUN wget http://myultrashare.appspot.com/s/traccar-web/dev/latest/traccar-web.war && mv traccar-web.war /opt/traccar/

RUN wget https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-jndi/9.2.13.v20150730/jetty-jndi-9.2.13.v20150730.jar && mv jetty-jndi-9.2.13.v20150730.jar /opt/traccar/lib/

ADD conf/ /opt/traccar/conf

EXPOSE 8080 5055 5027

ENTRYPOINT /opt/traccar/bin/traccar start && tail -f /opt/traccar/logs/tracker-server.log


