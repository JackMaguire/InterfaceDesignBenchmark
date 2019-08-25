#!/bin/bash

analyze_pose(){
    filename=$1

    per_res_energy=$(grep 'per_residue_energy_int' $filename | awk '{print $2}' | tail -n1 )

    pol_selection_count=$(grep 'pol_selection_count' $filename | awk '{print $2}' | tail -n1 )
    des_selection_count=$(grep 'des_selection_count' $filename | awk '{print $2}' | tail -n1 )
    polarity=$( echo "$pol_selection_count / $des_selection_count" | bc -l )

    BUNS_H=$(grep 'BUNS_H' $filename | awk '{print $2}' | tail -n1 )
    BUNS_bb_heavy=$(grep 'BUNS_bb_heavy' $filename | awk '{print $2}' | tail -n1 )
    BUNS_sc_heavy=$(grep 'BUNS_sc_heavy' $filename | awk '{print $2}' | tail -n1 )
    nres_int=$(grep 'nres_int' $filename | awk '{print $2}' | tail -n1 )
    unsats=$( echo "($BUNS_bb_heavy + $BUNS_sc_heavy) / $nres_int" | bc -l )

    echo $per_res_energy $polarity $unsats
}

for x in a b c d e f; do
    for y in 1 2 3; do
	name=$x$y
	name_of_best_pose=$(grep per_residue_energy_int hbnet_structures/$name/hbnet_KillA2019_${name}_*.pdb | sort -nk2 | head -n1 | awk -F: '{print $1}')
	echo $name `analyze_pose $name_of_best_pose`
    done
done
