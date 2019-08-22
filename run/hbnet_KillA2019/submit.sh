#!/bin/bash

for x in a b c d e f; do
    for y in 1 2 3; do
	name=$x$y
	pdblist=hbnet_structures/a1/a1.top_100_hbnet_pdblist
	cat run.sh | sed "s&XYZ&$pdblist&g" | sed "s\XXX\killa${name}\g" > run.$name.sh
	sbatch run.$name.sh
    done
done
