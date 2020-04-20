#!/bin/sh

[ ! -f /tmp/UnixBench/Run ] && git clone https://github.com/kdlucas/byte-unixbench.git /tmp

echo "INFO: this might take several minutes to complete"
(cd /tmp/UnixBench/ && ./Run)

