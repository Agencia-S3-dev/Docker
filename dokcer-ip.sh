#!/bin/sh
for N in $(docker-compose ps -q);
do
  echo "$(docker inspect -f '{{.Config.Hostname}}' "${N}") $(docker inspect -f '{{range $i, $value := .NetworkSettings.Networks}} [{{$i}}:{{.IPAddress}}]{{end}}' "${N}")";
done
