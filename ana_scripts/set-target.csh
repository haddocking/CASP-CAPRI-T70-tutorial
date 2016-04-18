#!/bin/csh
#
setenv target complex
setenv WDIR /Users/abonvin/capri/CASP-CAPRI/CASP-CAPRI-T70-tutorial/ana_scripts
setenv refeAB $WDIR/30_70.2.AB.pdb 
setenv refeAC $WDIR/30_70.2.AC.pdb 
setenv refeAD $WDIR/30_70.2.AD.pdb 
setenv refeBC $WDIR/30_70.2.BC.pdb 
setenv refeBD $WDIR/30_70.2.BD.pdb 
setenv refeCD $WDIR/30_70.2.CD.pdb 
setenv izoneAB $WDIR/30_70.2.izoneAB
setenv izoneAC $WDIR/30_70.2.izoneAC
setenv izoneAD $WDIR/30_70.2.izoneAD
setenv izoneBC $WDIR/30_70.2.izoneBC
setenv izoneBD $WDIR/30_70.2.izoneBD
setenv izoneCD $WDIR/30_70.2.izoneCD
setenv lzone $WDIR/30_70.2.lzone
setenv CONTACT $WDIR/30_70.2.contacts5
setenv PROFIT `which profit | awk '{print $NF}'`
