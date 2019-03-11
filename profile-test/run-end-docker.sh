#!/bin/bash
name=$1
opt/e2e/bin/ktc --enable-ext2 --save-temps $name -L. -llogs -lmbench  -w --link -g
./a.out
opt/e2e/bin/ktc --enable-ext3 --save-temps $name -L. -llogs -lmbench -w --link -g
/opt/e2e/timed-c-e2e-sched-analysis/build/nptest -r job.csv > output
cp job.rta.csv output.rta
cp job.csv input
/opt/e2e/sensitivity/bin/sensitivity-analysis

