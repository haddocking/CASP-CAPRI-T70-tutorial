#!/bin/csh -f
#
if (! $?WDIR) then
  echo "Define first the target and WDIR variables by"
  echo "sourcing the set-target file in ana_scripts"
endif

foreach i (file.nam)
  $WDIR/i-rmsd_to_xray.csh
  $WDIR/ana_structures.csh
  echo "#structure Dfire-Ebinding[kcal/mol] dfire-score" >dfire-score.lis
  echo "#structure Fastcontact-elec Fastcontact-desolv" >fastcontact-score.lis
  echo "#structure probe-score probe-score/A**2" >probe-score.lis
  foreach j (`cat file.nam`)
    echo $i | awk '{print $1, 0.0, 0.0}' >>dfire-score.lis
    echo $i | awk '{print $1, 0.0, 0.0}' >>fastcontact-score.lis
    echo $i | awk '{print $1, 0.0, 0.0}' >>probe-score.lis
  end
  paste structures_haddock-sorted.stat fastcontact-score.lis dfire-score.lis probe-score.lis| head -1 |\
    awk '{print $1,$3,$2,$5,$6,$7,$8,$9,$21,$22,$23,$25,$26,$28,$31,$32}' >structures.scores
  paste structures_haddock-sorted.stat fastcontact-score.lis dfire-score.lis probe-score.lis| grep -v "#" |\
    awk '{aa=($31+$33)/2;bb=($32+$34)/2;print $1,$3,$2,$5,$6,$7,$8,$9,$21,$22,$23,$25,$26,$28,aa,bb}' >>structures.scores
  head -1 structures.scores | awk '{print $1,$2,$3,$9,$11,$12,$13,$14,$15,$16,"combined-score"}' > structures.ranking
  grep pdb structures.scores | awk '{if ($15<=0){sc=0.01}else{sc=$15};print $1,$2,$3,$9,$11,$12,$13,$14,$15,$16,($3+$12+(5*$13)+0*$14-0*$15)}'| sort -g -k11>>structures.ranking
  head -1 structures.scores | awk '{print $1,$2,$3,$9,$11,$12,$13,$14,$15,$16,"combined-score"}' > structures.ranking-unsorted
  grep pdb structures.scores | awk '{if ($15<=0){sc=0.01}else{sc=$15};print $1,$2,$3,$9,$11,$12,$13,$14,$15,$16,($3+$12+(5*$13)+0*$14-0*$15)}' >> structures.ranking-unsorted
end
