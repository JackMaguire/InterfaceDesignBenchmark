#!/bin/bash

cat pdblist | while read line; do
    name=`basename $line`
    cat run.sh | sed "s&XYZ&$line&g" | sed "s\XXX\leg_${name}\g" > run.$name.sh
    sbatch run.$name.sh
done
