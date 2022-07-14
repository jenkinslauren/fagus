#!/bin/sh
#SBATCH -C [intel16|intel18]
#SBATCH -N 1 -c 1
#SBATCH -t 24:00:00
#SBATCH -o /mnt/research/TIMBER/PVMvsENM/fagus/QSTAT/evals_random_ccsm.o
#SBATCH --mem 64G
#SBATCH -J evals_random_ccsm

newgrp - TIMBER

module load GCC/8.3.0 OpenMPI/3.1.4 R/4.0.2

cd /mnt/research/TIMBER/PVMvsENM/fagus/code

Rscript model_evaluations.R random ccsm fagus 'Fagus grandifolia'

scontrol show job ${SLURM_JOB_ID}