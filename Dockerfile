FROM python:2.7

RUN set -eux; \
    apt-get update; \
    apt-get install -y gosu; \
    rm -rf /var/lib/apt/lists/*; \
# verify that the binary works
    gosu nobody true; \
# setup .ssh folders
    mkdir -p /root/.ssh; \
    chmod 0700 /root/.ssh; \
    mkdir -p /var/www/.ssh; \
    chown -R 33:33 /var/www;

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . ./

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["python", "-m", "gitautodeploy"]
