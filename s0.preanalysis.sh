#!/bin/bash


basedir=/home/mengxing/FC_demo
subj=sub-01

# dataset fMRI: Audiovisual Valence Congruence downloaded from openneuro
# somehow afni thinks it's in TLRC space, but actually it's in ORIG space
# first step, fix it!

# change space from TLRC to ORIG
3drefit -space ORIG $basedir/$subj/"$subj"_func_"$subj"_task*bold.nii

# convert timing files from BIDS to AFNI format
timing_tool.py -multi_timing_3col_tsv \
        $basedir/$subj/sub-01_func_sub-01_task-affect_run-*events.tsv \
        -write_multi_timing $basedir/$subj/AFNI_timing.


