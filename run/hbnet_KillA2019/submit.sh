#!/bin/bash

for x in a b c d e f; do
    for y in 1 2 3; do
	while [[ `squeue -u jackmag | grep jackmag | wc -l` -gt 39 ]]; do
	    sleep 600
	done
	name=$x$y
	dir=hbnet_structures/$name
	pdblist=$name.top_100_hbnet_pdblist
	cat run.sh | sed "s&XYZ&$pdblist&g" | sed "s\XXX\kh_${name}\g" | sed "s&ABC&$dir&g" > run.$name.sh
	sbatch run.$name.sh
    done
done
