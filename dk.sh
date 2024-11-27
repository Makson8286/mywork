!/bin/bash
docker network create zabbix-net

docker run -d --name zabbix-postgres \
  --network zabbix-net \
  postgres:alpine

docker run -d --name zabbix-server \
  --network zabbix-net \
  -p 10051:10051 \
  zabbix/zabbix-server-pgsql:alpine-6.4-latest

docker run -d --name zabbix-web \
  --network zabbix-net \
  -p 80:8080 \
  -p 443:8443 \
  zabbix/zabbix-web-nginx-pgsql:alpine-6.4-latest
