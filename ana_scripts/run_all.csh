#!/bin/csh -f
#
if (! $?WDIR) then
  echo "Define first the target and WDIR variables by"
  echo "sourcing the set-target file in ana_scripts"
endif

cd $1/structures/it1/water/analysis
\rm *out.gz
if (-e $target'_fcc.disp') then
  $WDIR/cluster_fcc.py $target'_fcc.disp' 0.75 >cluster7.5.out
else
  $WDIR/cluster_struc $target'_rmsd.disp' 7.5 4 >cluster7.5.out
endif
cd ..
$WDIR/run_anal-it0.csh
$WDIR/fraction-native.csh `cat file.nam`
$WDIR/ana_clusters.csh -best 4 analysis/cluster7.5.out
$WDIR/cluster-scores.csh 4
$WDIR/cluster-fnat.csh 4
cd ../analysis
\rm *out.gz
if (-e $target'_fcc.disp') then
  $WDIR/cluster_fcc.py $target'_fcc.disp' 0.75 >cluster7.5.out
else
  $WDIR/cluster_struc $target'_rmsd.disp' 7.5 4 >cluster7.5.out
endif
cd ..
$WDIR/run_anal-it0.csh
$WDIR/fraction-native.csh `cat file.nam`
$WDIR/ana_clusters.csh -best 4 analysis/cluster7.5.out
$WDIR/cluster-scores.csh 4
$WDIR/cluster-fnat.csh 4
cd ../it0
$WDIR/run_anal-it0.csh
set i1=`wc -l file.nam`
@ i1-=5000
$WDIR/fraction-native.csh `head -5000 file.nam`
$WDIR/fraction-native-cont.csh `tail -$i1 file.nam`
cd ../../../





