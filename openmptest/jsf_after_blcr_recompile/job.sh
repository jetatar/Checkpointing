#!/bin/bash
#$ -N TEST
#$ -q grb,grb64
#$ -pe openmp 10
#$ -j y
#$ -ckpt blcr

export CHECKPOINT_CLEAN_ALL_ON_SUCCESS=0

#module list

#which cr_restart

gcc -fopenmp hello-openmp.c -o hello

# Run the program with the ouput going to file out

./hello  > out
