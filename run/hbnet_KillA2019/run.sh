#!/bin/bash
 
#SBATCH --time=3-0:00:00
#SBATCH -p skylake,528_queue
#SBATCH -N 2
#SBATCH --ntasks-per-node=40
#SBATCH -o XXX.%j.log

dir=ABC
input=XYZ

cd $dir
srun --mpi=pmi2 -n 80 rosetta_scripts.mpiserialization.linuxgccrelease -l $input -mute all -mpi_tracer_to_file mpi -ignore_unrecognized_res 1 -nstruct 10 -parser:protocol /nas/longleaf/home/jackmag/scratch/InterfaceDesignBenchmark/scripts/run.xml -parser:script_vars script=KillA2019 -out:prefix hbnet_KillA2019_
 
# END FILE HERE
