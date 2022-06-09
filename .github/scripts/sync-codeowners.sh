#!/usr/bin/env bash

echo -e * @4ALLPORTAL

for DIR in ./charts/*; do
  FILE="$DIR/Chart.yaml"
  DIR="${DIR//\./}"
  MAINTAINERS="$(yq e '.maintainers.[].name' "$FILE" | sed 's/^/@/' | sort --ignore-case | tr '\r\n' ' ')"
  echo -e "$DIR/ $MAINTAINERS"
done