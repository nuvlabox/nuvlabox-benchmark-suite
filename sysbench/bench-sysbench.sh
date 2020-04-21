#!/bin/sh

sysbench --test=cpu --cpu-max-prime=20000 --num-threads=4 run

sysbench --test=memory --memory-block-size=1M --memory-total-size=10G run

sysbench --test=threads --thread-locks=1 --max-time=20s run
