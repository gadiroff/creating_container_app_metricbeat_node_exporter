FROM ubuntu:18.04

RUN apt-get update \
    && apt-get install -y openjdk-8-jdk \
    && apt-get install -y gnupg2 \
    && apt-get install -y apt-transport-https \
    && apt-get install -y ansible
RUN mkdir /java
WORKDIR /usr/local/bin
ADD ./roles /java/roles
ADD ./playbook.yml /java/playbook.yml
ADD ./node_exporter.py /java/node_exporter.py
ADD ./metricbeat_java.py /java/metricbeat_java.py
RUN /usr/bin/python /java/node_exporter.py
ADD ./node_exporter /usr/local/bin/node_exporter
RUN useradd --no-create-home --shell /bin/false node_exporter
RUN chown node_exporter:node_exporter /usr/local/bin/node_exporter
ADD ./rp /java/rp
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
ENV PATH=$PATH:$JAVA_HOME/bin
CMD ["/usr/bin/python", "/java/metricbeat_java.py"]
