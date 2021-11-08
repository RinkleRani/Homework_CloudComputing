#!/bin/sh
sysbench --num-threads=16 --test=fileio --file-total-size=3G --file-test-mode=rndrw prepare &&
sysbench --num-threads=16 --test=fileio --file-total-size=3G --file-test-mode=rndrw run &&
sysbench --num-threads=16 --test=fileio --file-total-size=3G --file-test-mode=rndrw cleanup &&
sysbench --num-threads=1 --test=fileio --file-total-size=1G --file-test-mode=rndrd --max-time=30 --max-requests=0 --file-extra-flags=direct prepare &&
sysbench --num-threads=1 --test=fileio --file-total-size=1G --file-test-mode=rndrd --max-time=30 --max-requests=0 --file-extra-flags=direct run &&
sysbench --num-threads=1 --test=fileio --file-total-size=1G --file-test-mode=rndrd --max-time=30 --max-requests=0 --file-extra-flags=direct cleanup &&
sysbench --num-threads=2 --test=fileio --file-total-size=2G --file-test-mode=seqrd --max-time=30 prepare &&
sysbench --num-threads=2 --test=fileio --file-total-size=2G --file-test-mode=seqrd --max-time=30 run &&
sysbench --num-threads=2 --test=fileio --file-total-size=2G --file-test-mode=seqrd --max-time=30 cleanup
