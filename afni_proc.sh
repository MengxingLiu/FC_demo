#!/bin/tcsh

afni_proc.py \
    -subj_id sub-01 \
    -dsets sub-01/sub-01_func_sub-01_task-affect_run-*_bold.nii\
    -copy_anat sub-01/sub-01_anat_sub-01_T1w.nii \
    -blocks tshift align tlrc volreg blur mask scale regress \
    -align_opts_aea -cost lpc+ZZ -giant_move -check_flip \
    -tlrc_base MNI152_T1_2009c+tlrc \
    -tlrc_NL_warp \
    -volreg_align_to MIN_OUTLIER \
    -volreg_align_e2a \
    -volreg_tlrc_warp \
    -mask_epi_anat yes \
    -blur_size 4 \
    -blur_in_automask \
    -regress_stim_times sub-01/AFNI_timing.times.*.txt \
    -regress_stim_labels VpAp VpAn VnAp VnAn catch \
    -regress_basis 'BLOCK(3,1)' \
    -regress_opts_3dD -jobs 2 -gltsym 'SYM: VpAp -VnAn'        \
    -glt_label 1 P-N \
    -regress_censor_motion 0.3 \
    -regress_censor_outliers 0.05 \
    -regress_3dD_stop \
    -regress_reml_exec \
    -regress_compute_fitts \
    -regress_make_ideal_sum sum_ideal.1D \
    -regress_est_blur_epits \
    -regress_est_blur_errts \
    -regress_run_clustsim no \
    -html_review_style basic \
    -execute


    
