FROM google/cloud-sdk:alpine

RUN apk add mysql-client rsync \
            postgresql-client \
            mongodb-tools \
            gzip

RUN wget -qO- https://binaries.cockroachdb.com/cockroach-latest.linux-musl-amd64.tgz | tar  xvz cockroach-latest
RUN cp cockroach-latest/cockroach /usr/local/bin/cockroach

