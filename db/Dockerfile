# syntax=docker/dockerfile:1
FROM mysql:5.7
ARG DB_DEFAULT
ADD ./wct_patch/wct3_${DB_DEFAULT}.sql /docker-entrypoint-initdb.d
