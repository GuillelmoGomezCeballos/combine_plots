#!/bin/sh

cd ~/releases/CMSSW_11_3_4/src/;
eval `scramv1 runtime -sh`;
cd -;

if [ $# -lt 1 ]; then
   echo "TOO FEW PARAMETERS"
   exit
fi

if [ $1 = 0 ]; then
combineCards.py -S \
SSWW_2016=datacard_ssww_2016.txt \
SSWW_2017=datacard_ssww_2017.txt \
SSWW_2018=datacard_ssww_2018.txt > ssww_comb.text;

text2workspace.py -P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel --PO verbose \
--PO 'map=.*/EWKSSWW:r_s0[1,0,10]' \
--PO 'map=.*/qqWW:r_s0[1,0,10]' \
--PO 'map=.*/EWKWZ:r_s1[1,0,10]' \
--PO 'map=.*/ggWW:r_s1[1,0,10]' \
--PO 'map=.*/WZ:r_s2[1,0,10]' \
ssww_comb.text -o workspace_ssww.root;

elif [ $1 = 1 ]; then

ANA="wwAnalysis1001"

combineCards.py -S \
datacard_${ANA}_20221_bin?.txt \
> datacard_${ANA}_2022.text

text2workspace.py -P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel \
  --PO verbose \
  --PO 'map=.*/Signal0:r_s0[1,0,3]' \
  --PO 'map=.*/Signal1:r_s0[1,0,3]' \
  --PO 'map=.*/Signal2:r_s0[1,0,3]' \
  datacard_${ANA}_2022.text \
  -o workspace_ww_incl.root;

for bin in 1 2 3 4; do
  combineCards.py -S \
  datacard_${ANA}_20221_bin${bin}.txt \
  > datacard_${ANA}_2022_bin${bin}.text

  text2workspace.py -P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel \
    --PO verbose \
    --PO 'map=.*/Signal0:r_s0[1,0,3]' \
    --PO 'map=.*/Signal1:r_s0[1,0,3]' \
    --PO 'map=.*/Signal2:r_s0[1,0,3]' \
    datacard_${ANA}_2022_bin${bin}.text \
    -o workspace_ww_incl_bin${bin}.root;
done

elif [ $1 = 2 ]; then

ANA="wwAnalysis1001"

combineCards.py -S \
datacard_${ANA}_20221_bin?_alt.txt \
> datacard_${ANA}_2022_alt.text

text2workspace.py -P HiggsAnalysis.CombinedLimit.PhysicsModel:multiSignalModel \
  --PO verbose \
  --PO 'map=.*/Signal0:r_s0[1,0,3]' \
  --PO 'map=.*/Signal1:r_s0[1,0,3]' \
  --PO 'map=.*/Signal2:r_s0[1,0,3]' \
  datacard_${ANA}_2022_alt.text \
  -o workspace_ww_incl_alt.root;

fi
