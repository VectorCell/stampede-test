#!/bin/bash

# Author: Brandon Smith

#SBATCH --job-name=LLVM
#SBATCH --output=log/01-serial_%j.out
#SBATCH --error=log/01-serial_%j.err
#SBATCH -p normal
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 00:00:10
#SBATCH -A Galois
#SBATCH --exclusive

module load gcc/4.9.3
#module load python/2.7.12

./01-serial
