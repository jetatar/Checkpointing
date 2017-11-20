#!/bin/sh
#$ -j no
#$ -q grb@compute-9-3
#$ -o ~/job-$JOB_ID.$TASK_ID.out
#$ -e ~/job-$JOB_ID.$TASK_ID.err
#$ -cwd
#$ -pe openmp 12-16
#$ -ckpt blcr

export CHECKPOINT_CLEAN_ALL_ON_SUCCESS=0

module load MATLAB/r2017b
module load blcr

cr_run /data/users/jtatar/Work/Matlab/single
