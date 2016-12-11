FROM buildpack-deps:jessie-curl

RUN set -x && \
    apt-get update -y && apt-get -y install apt-utils && \
    apt-get -y install git ca-certificates wget spf-tools-perl file automake libsqlite3-dev sqlite3 \
        libpcre3-dev build-essential libdb-dev libopendmarc-dev libmysqlclient-dev libspf2-dev libsasl2-dev \
        libldap2-dev libdkim-dev libgnutls28-dev pkg-config libidn11-dev libpam-dev libperl-dev && \
    apt-get clean && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* /download/directory && \
    mkdir -p /etc/exim && \
    mkdir -p /opt/exim/scr/Local && \
    mkdir -p /usr/lib/exim/lookups && \
    mkdir -p /var/spool/exim && \
    cd /opt && git clone https://github.com/LynxChaus/libsrs-alt && \
    cd libsrs-alt && ./configure && make && make install && cp /usr/local/lib/libsrs* /usr/lib/ && \
    rm -rf /opt/libsrs-alt

COPY Makefile /opt/exim/src/Local/
COPY entrypoint.sh /

ARG branch=master
ARG user_id=798
RUN set -x && \
    useradd -r -s /bin/false -u ${user_id} exim && \
    cd /opt/exim/ && git init . && git remote add -t \* -f origin https://github.com/exim/exim && \
    git checkout ${branch} && cd /opt/exim/src && make && make install && \
    rm -rf /opt/exim && \
    ln -sf /dev/stdout /var/log/exim_main && \
    ln -sf /dev/stdout /var/log/exim_reject && \
    ln -sf /dev/stderr /var/log/exim_panic && \
    chmod a+x /entrypoint.sh

VOLUME ["/etc/exim", "/var/spool/exim"]

COPY config/ /etc/exim/

ENTRYPOINT ["/entrypoint.sh"]

CMD ["exim", "-bdf", "-q15m"]
