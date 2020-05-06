## Run NiFi from laptop:

    docker run --name nifi -p 8080:8080 -d apache/nifi:latest

## Shell into container:

    docker exec -it nifi bash

NiFi configuration is in `/opt/nifi/nifi-current/conf`

