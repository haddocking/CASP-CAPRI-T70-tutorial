#!/bin/csh
#
set atoms='CA,N,C,O'

cat /dev/null >rmsd-interface_xray.disp

foreach i (`cat file.nam`)
  if ($i:e == "gz") then
    gzip -dc $i > $i:t:r.tmp2
  else
    cp $i $i:t:r.tmp2
  endif
  $WDIR/pdb_segid-to-chain $i:t:r.tmp2 |sed -e 's/BB/CA/' >$i:t:r.tmp1
  echo $i >>rmsd-interface_xray.disp
  profit <<_Eod_ |grep RMS |sort -nr |tail -1 >>rmsd-interface_xray.disp
    refe $refeAB
    mobi $i:t:r.tmp1
    `cat $izoneAB`
    atom $atoms
    fit
    zone clear
    refe $refeAC
    mobi $i:t:r.tmp1
    `cat $izoneAC`
    atom $atoms
    fit
    zone clear
    refe $refeAD
    mobi $i:t:r.tmp1
    `cat $izoneAD`
    atom $atoms
    fit
    zone clear
    refe $refeBC
    mobi $i:t:r.tmp1
    `cat $izoneBC`
    atom $atoms
    fit
    zone clear
    refe $refeBD
    mobi $i:t:r.tmp1
    `cat $izoneBD`
    atom $atoms
    fit
    zone clear
    refe $refeCD
    mobi $i:t:r.tmp1
    `cat $izoneCD`
    atom $atoms
    fit
    quit
_Eod_
\rm $i:t:r.tmp1
\rm $i:t:r.tmp2
end
echo "#struc i-RMSD" >i-RMSD.dat
awk '{if ($1 == "RMS:" || $2 == "RMS:") {printf "%8.3f ",$NF} else {printf "\n %s ",$1}}' rmsd-interface_xray.disp |grep pdb |awk '{print $1,$2}' >> i-RMSD.dat
head -1 i-RMSD.dat >i-RMSD-sorted.dat
grep pdb i-RMSD.dat |sort -nk2  >> i-RMSD-sorted.dat
\rm rmsd-interface_xray.disp
