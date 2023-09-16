#!/bin/sh

cd ~/releases/CMSSW_11_3_4/src/;
eval `scramv1 runtime -sh`;
cd -;

if [ $# -lt 2 ]; then
   echo "TOO FEW PARAMETERS"
   exit
fi

if [ $1 = 0 ]; then

PostFitShapesFromWorkspace \
-w workspace_ssww.root \
-d ssww_comb.text \
--output output_histograms.root \
--postfit --sampling \
-f fitDiagnosticsssww_obs.root:fit_s \
--total-shapes

elif [ $1 = 1 ]; then

PostFitShapesFromWorkspace \
-w workspace_ww_incl_bin$2.root \
-d datacard_wwAnalysis1001_2022_bin$2.text \
--output output_histograms_bin$2.root \
--postfit --sampling \
-f fitDiagnosticsww_incl_obs.root:fit_s \
--total-shapes

elif [ $1 = 2 ]; then

PostFitShapesFromWorkspace \
-w workspace_ww_incl_alt.root \
-d datacard_wwAnalysis1001_2022_alt.text \
--output output_histograms_alt.root \
--postfit --sampling \
-f fitDiagnosticsww_incl_obs.root:fit_s \
--total-shapes

fi
