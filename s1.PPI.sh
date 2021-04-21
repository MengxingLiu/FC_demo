#!/bin/tcsh

# note location of scripts and data
set basedir = /home/mengxing/FC_demo
set scriptdir = $basedir/scripts
set subj = sub-01
set subjdir   = $basedir/"$subj".results


# ----------------------------------------
# do all of the work in the $subj.results directory...
cd $subjdir


# ----------------------------------------
# generate seed time series, ppi.seed.1D
# start with primary visual cortex V1
set seed = v1
echo -28 -96 -6 | 3dUndump -xyz -srad 5 -master stats."$subj"_REML+tlrc -prefix mask.$seed.nii.gz -
# generate ppi.seed.1D (note that mask dset is unneeded, but visually useful)
3dmaskave -quiet -mask mask.$seed.nii.gz errts."$subj"_REML+tlrc > ppi.seed.$seed.1D



# ===========================================================================
# generate PPI regressors from seed and timing files
# (script uses 'set seed = ppi.seed.1D')

tcsh $scriptdir/cmd.ppi.2.make.regs $seed

# and copy the results into the stimuli directory
cp work.$seed/p6.* ppi.seed.$seed.1D stimuli

# and just to see consider:
#    1dplot -one ppi.seed.1D work.v1/p7.v1.sum.PPI.1D
#    1dplot ppi.seed.1D work.v1/p6.*


# ===========================================================================
# create and run a 3dDeconvolve command for the PPI
# (still run from $subjdir)

# create the 3dDeconvolve command, proc.3dd.ppi.post.full
#tcsh $scriptdir/cmd.ppi.3.ap.post

# and run it
tcsh $scriptdir/proc.3dd.ppi.post.full $subj $seed



# ===========================================================================
# comments...

# - this data is not designed to capture a PPI effect
# - the results are in PPI.full.stats.FT+tlrc
