FROM google/cloud-sdk:alpine as gcp

FROM gcp as mysql
RUN apk add mysql-client

FROM gcp as psql
RUN apk add postgresql-client

FROM gcp as mongodb
RUN apk add mongodb-tools

FROM psql as cockroach
RUN wget -qO- https://binaries.cockroachdb.com/cockroach-v20.1.5.linux-amd64.tgz | tar  xvz
RUN cp -i cockroach-v20.1.5.linux-amd64/cockroach /usr/local/bin/

FROM gcp as all
RUN apk add mysql-client \
    postgresql-client \
    mongodb-tools \
    gzip

RUN wget -qO- https://binaries.cockroachdb.com/cockroach-v20.1.5.linux-amd64.tgz | tar  xvz
RUN cp -i cockroach-v20.1.5.linux-amd64/cockroach /usr/local/bin/
