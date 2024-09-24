#!/bin/bash

# /home/st/REPOBARE/_repo/d1cv8/.d/.arb/scr.arb/pr_4_21_1.ram/.grot/.data/002_less_d2/001_part/.md/_cntt/001.start.d

data_dir=${HOME}/REPOBARE/_repo/d1cv8/.d/.arb/scr.arb/pr_4_21_1.ram/.grot/.data

for ((i = 2; i <= 9; i++)); do
    # echo $i
    echo ${data_dir}/00${i}_less_d${i}/001_part/.md/_cntt/001.start.d
    rm -r ${data_dir}/00${i}_less_d${i}/001_part/.md/_cntt/001.start.d
    echo ${data_dir}/00${i}_less_d${i}/001_part/.md/_cntt/099.end.d
    rm -r  ${data_dir}/00${i}_less_d${i}/001_part/.md/_cntt/099.end.d

done

for ((i = 10; i <= 21; i++)); do
    # echo $i
    rm -r ${data_dir}/0${i}_less_d${i}/001_part/.md/_cntt/001.start.d
    rm -r  ${data_dir}/0${i}_less_d${i}/001_part/.md/_cntt/099.end.d

done
