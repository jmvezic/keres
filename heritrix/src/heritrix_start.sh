#!/bin/sh
export JAVA_HOME=/usr/lib/jvm/default-jvm
export HERITRIX_HOME=/wct/heritrix-version
export JAVA_OPTS=-Xmxtrixmem
$HERITRIX_HOME/bin/heritrix -j /trix_jobs -a user:pass -b /
tail -f /dev/null
