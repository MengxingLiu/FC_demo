#!/bin/tcsh

# apply any data directories with variables
set data1 = /home/mengxing/FC_demo/group

# note: factor A is factor Visual, B is Audio

3dANOVA2 -type 1                                                                          \
    -alevels 2                                                                            \
    -blevels 2                                                                            \
    -dset  1  1  "$data1/PPI.v1.stats.sub-01+tlrc.HEAD[PPI.VpAp#0_Coef]"                  \
    -dset  1  2  "$data1/PPI.v1.stats.sub-01+tlrc.HEAD[PPI.VpAn#0_Coef]"                  \
    -dset  2  1  "$data1/PPI.v1.stats.sub-01+tlrc.HEAD[PPI.VnAp#0_Coef]"                  \
    -dset  2  2  "$data1/PPI.v1.stats.sub-01+tlrc.HEAD[PPI.VnAn#0_Coef]"                  \
    -dset  1  1  "$data1/PPI.v1.stats.sub-02+tlrc.HEAD[PPI.VpAp#0_Coef]"                  \
    -dset  1  2  "$data1/PPI.v1.stats.sub-02+tlrc.HEAD[PPI.VpAn#0_Coef]"                  \
    -dset  2  1  "$data1/PPI.v1.stats.sub-02+tlrc.HEAD[PPI.VnAp#0_Coef]"                  \
    -dset  2  2  "$data1/PPI.v1.stats.sub-02+tlrc.HEAD[PPI.VnAn#0_Coef]"                  \
    -dset  1  1  "$data1/PPI.v1.stats.sub-03+tlrc.HEAD[PPI.VpAp#0_Coef]"                  \
    -dset  1  2  "$data1/PPI.v1.stats.sub-03+tlrc.HEAD[PPI.VpAn#0_Coef]"                  \
    -dset  2  1  "$data1/PPI.v1.stats.sub-03+tlrc.HEAD[PPI.VnAp#0_Coef]"                  \
    -dset  2  2  "$data1/PPI.v1.stats.sub-03+tlrc.HEAD[PPI.VnAn#0_Coef]"                  \
    -dset  1  1  "$data1/PPI.v1.stats.sub-04+tlrc.HEAD[PPI.VpAp#0_Coef]"                  \
    -dset  1  2  "$data1/PPI.v1.stats.sub-04+tlrc.HEAD[PPI.VpAn#0_Coef]"                  \
    -dset  2  1  "$data1/PPI.v1.stats.sub-04+tlrc.HEAD[PPI.VnAp#0_Coef]"                  \
    -dset  2  2  "$data1/PPI.v1.stats.sub-04+tlrc.HEAD[PPI.VnAn#0_Coef]"                  \
    -dset  1  1  "$data1/PPI.v1.stats.sub-05+tlrc.HEAD[PPI.VpAp#0_Coef]"                  \
    -dset  1  2  "$data1/PPI.v1.stats.sub-05+tlrc.HEAD[PPI.VpAn#0_Coef]"                  \
    -dset  2  1  "$data1/PPI.v1.stats.sub-05+tlrc.HEAD[PPI.VnAp#0_Coef]"                  \
    -dset  2  2  "$data1/PPI.v1.stats.sub-05+tlrc.HEAD[PPI.VnAn#0_Coef]"                  \
    -xmean 1 1 PPI:VpAp -xmean 1 2 PPI:VpAn -xmean 2 1 PPI:VnAp -xmean 2 2 PPI:VnAn       \
    -amean 1 PPI:Vp -amean 2 PPI:Vn -bmean 1 PPI:Ap -bmean 2 PPI:An                       \
    -acontr 1 2 PPI:Vp-Vn -bcontr 1 2 PPI:Ap-An -xdiff 1 1 2 2 PPI:VpAp-VnAn              \
    -bucket $data1/group.PPI.nii.gz

