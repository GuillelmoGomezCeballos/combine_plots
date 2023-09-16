#!/bin/sh

cd ~/releases/CMSSW_11_3_4/src/;
eval `scramv1 runtime -sh`;
cd -;

if [ $# -lt 1 ]; then
   echo "TOO FEW PARAMETERS"
   exit
fi

if [ $1 = 0 ]; then

nohup ~/ana_area/Combination/comb/runFit.sh . ssww impacts obs >& log_impacts_ssww_obs &

nohup ~/ana_area/Combination/comb/runFit.sh . ssww mlf obs >& log_mlf_ssww_obs &

elif [ $1 = 1 ]; then

nohup ~/ana_area/Combination/comb/runFit.sh . ww_incl mlf obs >& log_mlf_ww_incl_obs &

elif [ $1 = 2 ]; then

echo "nothing to do";

fi
