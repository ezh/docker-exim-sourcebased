docker-exim-sourcebased [![Build Status](https://travis-ci.org/ezh/docker-exim-sourcebased.png?branch=master)](https://travis-ci.org/ezh/docker-exim-sourcebased) [![Pulls](https://img.shields.io/docker/pulls/ezh1k/exim.svg)](https://hub.docker.com/r/ezh1k/exim/) [![Releases](https://img.shields.io/github/release/ezh/docker-exim-sourcebased.svg)](https://github.com/ezh/docker-exim-sourcebased/releases) [![License](https://img.shields.io/github/license/ezh/docker-exim-sourcebased.svg)](https://github.com/ezh/docker-exim-sourcebased/blob/master/LICENSE) 
=======================

Docker compose source based exim SOHO configuration

EXIM build from source from https://github.com/exim/exim

By default it builds the stable *exim-4_87* if you use docker compose and latest unstable *master* if you build directly from Dockerfile.

[Hint #1](https://github.com/ezh/docker-exim-sourcebased/blob/master/docker/Dockerfile#L30),
[Hint #2](https://github.com/ezh/docker-exim-sourcebased/blob/master/docker-compose.yml#L7)

Image is based on `debian/jessie`, the same as an official Jenkis docker container.

Execution
---------

EXIM executed directly as PID 1 process with loggin `main` and `reject` log to `STDOUT`, and panic log to `STDERR`.


Arguments
---------

You may set exim version via `version` argument

You may set UID for exim user via `user_id` argument

Build parameters
----------------

You may alter build parameters in docker/Makefile. Please look at docker/EDITME for example.

Most notable aspects:
* databases
 * `sqllite` (for greylisting, etc...),
 * `mysql`
 * `pgsql`
 * `ldap2`
 * `redis`
* options
 * `perl`
 * `spf`
 * `srs`
 * `dmar`
 * `content scan`
 * `dkim`
 * `dcc`

```
AUTH_CRAM_MD5=yes
AUTH_CYRUS_SASL=yes
AUTH_DOVECOT=yes
AUTH_LIBS=-lsasl2
AUTH_PLAINTEXT=yes
AUTH_SPA=yes
AUTH_TLS=yes
BIN_DIRECTORY=/usr/bin
CFLAGS += -I/usr/local/include
CFLAGS_DYNAMIC=-shared -rdynamic -fPIC
COMPRESS_COMMAND=/usr/bin/gzip
COMPRESS_SUFFIX=gz
CONFIGURE_FILE=/etc/exim/exim.conf
DEFAULT_CRYPT=crypt16
EXIM_PERL=perl.o
EXIM_TMPDIR="/tmp"
EXIM_USER=ref:exim
EXPAND_DLFUNC=yes
EXPERIMENTAL_DANE=yes
EXPERIMENTAL_DCC=yes
EXPERIMENTAL_DMARC=yes
EXPERIMENTAL_DSN_INFO=yes
EXPERIMENTAL_SPF=yes
EXPERIMENTAL_SRS=yes
EXTRALIBS=-ldl -lpam -lldap -llber -lspf2 -export-dynamic
FIXED_NEVER_USERS=root
HAVE_ICONV=yes
HAVE_IPV6=yes
HEADERS_CHARSET="ISO-8859-1"
LDAP_LIB_TYPE=OPENLDAP2
LDFLAGS += -lidn
LDFLAGS += -lopendmarc
LDFLAGS += -lspf2
LDFLAGS += -lsrs_alt
LOG_FILE_PATH=/var/log/exim_%s
LOOKUP_DBM=yes
LOOKUP_DNSDB=yes
LOOKUP_DSEARCH=yes
LOOKUP_INCLUDE=-I /usr/include/ldap -I /usr/include/mysql -I`pg_config --includedir`
LOOKUP_LDAP=yes
LOOKUP_LIBS=-L/usr/local/lib -lldap -lmysqlclient -lpq -lsqlite3 -lhiredis -llber -lspf2
LOOKUP_LSEARCH=yes
LOOKUP_MODULE_DIR=/usr/lib/exim/lookups/
LOOKUP_MYSQL=yes
LOOKUP_NWILDLSEARCH=yes
LOOKUP_PASSWD=yes
LOOKUP_PGSQL=yes
LOOKUP_REDIS=yes
LOOKUP_SPF=yes
LOOKUP_SQLITE=yes
LOOKUP_SQLITE_PC=sqlite3
LOOKUP_WILDLSEARCH=yes
PCRE_CONFIG=yes
PID_FILE_PATH=/run/exim.pid
ROUTER_ACCEPT=yes
ROUTER_DNSLOOKUP=yes
ROUTER_IPLITERAL=yes
ROUTER_MANUALROUTE=yes
ROUTER_QUERYPROGRAM=yes
ROUTER_REDIRECT=yes
SPOOL_DIRECTORY=/var/spool/exim
SUPPORT_I18N=yes
SUPPORT_MOVE_FROZEN_MESSAGES=yes
SUPPORT_PAM=yes
SUPPORT_TLS=yes
SYSTEM_ALIASES_FILE=/etc/aliases
TLS_INCLUDE=-I/usr/local/openssl/include/
TLS_LIBS=-L/usr/local/openssl/lib -lssl -lcrypto
TLS_LIBS=-lssl -lcrypto
TRANSPORT_APPENDFILE=yes
TRANSPORT_AUTOREPLY=yes
TRANSPORT_PIPE=yes
TRANSPORT_SMTP=yes
USE_OPENSSL_PC=openssl
USE_READLINE=yes
WITH_CONTENT_SCAN=yes
ZCAT_COMMAND=/usr/bin/zcat
```

Copyright
---------

Copyright © 2017 Alexey B. Aksenov/Ezh. All rights reserved.
