#!/bin/bash
#SBATCH -J go2_remote
#SBATCH -p critical
#SBATCH --cpus-per-task=4
#SBATCH -N 1
#SBATCH -t 9:30:00
#SBATCH --gres=gpu:1
#SBATCH --output=./legged_gym/run2.out
#SBATCH --error=./legged_gym/run2.err

source activate /public/home/duanxin2023/miniconda3/envs/legged_gym
cd /public/home/duanxin2023/legged_robot/legged_gym || exit
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/public/home/duanxin2023/miniconda3/envs/legged_gym/lib/
export CXX=g++
python legged_gym/scripts/train.py --task go2_remote --headless
