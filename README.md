docker-exim-sourcebased [![Build Status](https://travis-ci.org/ezh/docker-exim-sourcebased.png?branch=master)](https://travis-ci.org/ezh/docker-exim-sourcebased)
=======================

Docker compose source based exim SOHO configuration

EXIM build from source from https://github.com/exim/exim

By default it builds the stable *exim-4_87* if you use docker compose and latest unstable *master* if you build directly from Dockerfile.

Image is based on `debian/jessie`, the same as an official Jenkis docker container.

Execution
---------

EXIM executed directly as PID 1 process with loggin `main` and `reject` log to `STDOUT`, and panic log to `STDERR`.


Arguments
---------

You may set exim version via `branch` argument

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
BIN_DIRECTORY=/usr/bin
CONFIGURE_FILE=/etc/exim/exim.conf
EXIM_USER=ref:exim
SPOOL_DIRECTORY=/var/spool/exim
ROUTER_ACCEPT=yes
ROUTER_DNSLOOKUP=yes
ROUTER_IPLITERAL=yes
ROUTER_MANUALROUTE=yes
ROUTER_QUERYPROGRAM=yes
ROUTER_REDIRECT=yes
TRANSPORT_APPENDFILE=yes
TRANSPORT_AUTOREPLY=yes
TRANSPORT_PIPE=yes
TRANSPORT_SMTP=yes
LOOKUP_MODULE_DIR=/usr/lib/exim/lookups/
CFLAGS_DYNAMIC=-shared -rdynamic -fPIC
LOOKUP_DBM=yes
LOOKUP_LSEARCH=yes
LOOKUP_DNSDB=yes
LOOKUP_DSEARCH=yes
LOOKUP_LDAP=yes
LOOKUP_MYSQL=yes
LOOKUP_PASSWD=yes
LOOKUP_PGSQL=yes
LOOKUP_REDIS=yes
LOOKUP_SQLITE=yes
LOOKUP_SQLITE_PC=sqlite3
LOOKUP_SPF=yes
LOOKUP_WILDLSEARCH=yes
LOOKUP_NWILDLSEARCH=yes
LDAP_LIB_TYPE=OPENLDAP2
PCRE_CONFIG=yes
LOOKUP_INCLUDE=-I /usr/include/ldap -I /usr/include/mysql -I`pg_config --includedir`
LOOKUP_LIBS=-L/usr/local/lib -lldap -lmysqlclient -lpq -lsqlite3 -lhiredis -llber -lspf2
WITH_CONTENT_SCAN=yes
EXPERIMENTAL_DCC=yes
EXPERIMENTAL_SPF=yes
CFLAGS  += -I/usr/local/include
LDFLAGS += -lspf2
EXPERIMENTAL_SRS=yes
CFLAGS  += -I/usr/local/include
LDFLAGS += -lsrs_alt
EXPERIMENTAL_DMARC=yes
CFLAGS += -I/usr/local/include
LDFLAGS += -lopendmarc
EXPERIMENTAL_DANE=yes
EXPERIMENTAL_DSN_INFO=yes
FIXED_NEVER_USERS=root
AUTH_CRAM_MD5=yes
AUTH_CYRUS_SASL=yes
AUTH_DOVECOT=yes
AUTH_PLAINTEXT=yes
AUTH_SPA=yes
AUTH_TLS=yes
AUTH_LIBS=-lsasl2
HEADERS_CHARSET="ISO-8859-1"
HAVE_ICONV=yes
DEFAULT_CRYPT=crypt16
SUPPORT_TLS=yes
USE_OPENSSL_PC=openssl
TLS_LIBS=-lssl -lcrypto
TLS_LIBS=-L/usr/local/openssl/lib -lssl -lcrypto
TLS_INCLUDE=-I/usr/local/openssl/include/
LOG_FILE_PATH=/var/log/exim_%s
COMPRESS_COMMAND=/usr/bin/gzip
COMPRESS_SUFFIX=gz
ZCAT_COMMAND=/usr/bin/zcat
EXIM_PERL=perl.o
EXPAND_DLFUNC=yes
SUPPORT_PAM=yes
EXTRALIBS=-ldl -lpam -lldap -llber -lspf2 -export-dynamic
SUPPORT_I18N=yes
LDFLAGS += -lidn
SYSTEM_ALIASES_FILE=/etc/aliases
USE_READLINE=yes
HAVE_IPV6=yes
EXIM_TMPDIR="/tmp"
PID_FILE_PATH=/run/exim.pid
SUPPORT_MOVE_FROZEN_MESSAGES=yes
```
