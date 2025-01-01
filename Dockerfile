FROM python:3.11
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt install vim sudo apt-transport-https ca-certificates dirmngr debconf -y
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 8919F6BD2B48D754
RUN echo "deb https://packages.clickhouse.com/deb stable main" | tee /etc/apt/sources.list.d/clickhouse.list
RUN apt update -y && apt install clickhouse-server clickhouse-client -y

RUN mkdir -p /data /app /src
CMD ["clickhouse-server", "--config-file=/etc/clickhouse-server/config.xml"]