#!/bin/sh
sysbench --num-threads=4 --test=cpu --cpu-max-prime=9000 run &&
sysbench --num-threads=4 --test=cpu --cpu-max-prime=14000 run &&
sysbench --num-threads=4 --test=cpu --cpu-max-prime=17000 run
