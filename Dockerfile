FROM andyshinn/firehose

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q
RUN apt-get install -q -y unzip

WORKDIR /

ADD config/Procfile /firehose/Procfile
ADD scripts/start_serf.sh /usr/local/bin/start_serf.sh
ADD https://dl.bintray.com/mitchellh/serf/0.5.0_linux_amd64.zip serf.zip

RUN unzip serf.zip
RUN rm serf.zip
RUN mv serf /usr/local/bin/
RUN chmod +x /usr/local/bin/start_serf.sh

EXPOSE 7946/tcp 7946/udp

CMD ["/usr/local/bin/foreman", "start", "-d", "/firehose"]

