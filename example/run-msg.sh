#!/usr/bin/env bash

#!/usr/bin/env bash

if [ "$1" = "start" ];
then

    # Build diffy
    ./sbt assembly && \

    # Deploy diffy
    java -jar ./target/scala-2.11/diffy-server.jar \
    -candidate='candidate.coupang.com:80' \
    -master.primary='primary.coupang.com:80' \
    -master.secondary='secondary.coupang.com:80' \
    -service.protocol='http' \
    -serviceName='mobile_service_gw' \
    -proxy.port=:8880 \
    -admin.port=:8881 \
    -http.port=:8882 \
    -responseMode='candidate' \
    -rootUrl='localhost:8882' &\

    sleep 3
    echo "Wait for Diffy to deploy"
    sleep 2
else
    echo "Please make sure ports 8880, 8881, & 8888 are available before running \"example/run.sh start\""
fi