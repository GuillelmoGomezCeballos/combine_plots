#!/bin/sh

cd ~/releases/CMSSW_11_3_4/src/;
eval `scramv1 runtime -sh`;
cd -;

~/releases/CMSSW_11_3_4/src/LatinoAnalysis/ShapeAnalysis/scripts/mkPlot.py \
--pycfg=configuration_combined.py --inputFile mytest.root \
--onlyPlot=cratio --linearOnly --showIntegralLegend=1 \
--samplesFile samples.py
