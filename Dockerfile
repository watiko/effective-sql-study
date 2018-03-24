FROM mysql:5.7.21

ENV MYSQL_ALLOW_EMPTY_PASSWORD yes

ENV EFFECTIVE_SQL_SAMPLE_SRC "Effective-SQL/MySQL/Sample Databases"
ENV EFFECTIVE_SQL_SAMPLE_DEST /opt/effective-sql-sample

COPY $EFFECTIVE_SQL_SAMPLE_SRC $EFFECTIVE_SQL_SAMPLE_DEST
COPY migrate.sh /docker-entrypoint-initdb.d/migrate.sh

