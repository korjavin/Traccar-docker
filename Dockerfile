FROM java:8-jre

RUN apt-get update && apt-get install -y wget git curl zip && rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/share/traccar/

WORKDIR /usr/share/traccar/

RUN wget https://github.com/traccar/traccar/releases/download/v4.0/traccar-linux-4.0.zip

RUN unzip /traccar-linux-4.0.zip

RUN ./traccar.run

VOLUME /opt/traccar/conf

RUN touch /opt/traccar/logs/tracker-server.log

EXPOSE 8082

ENTRYPOINT /opt/traccar/bin/traccar start && tail -f /opt/traccar/logs/tracker-server.log
