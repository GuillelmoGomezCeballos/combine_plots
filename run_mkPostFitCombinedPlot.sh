#!/bin/sh

cd ~/releases/CMSSW_11_3_4/src/;
eval `scramv1 runtime -sh`;
cd -;

if [ $# -lt 2 ]; then
   echo "TOO FEW PARAMETERS"
   exit
fi

if [ $1 = 0 ]; then

~/releases/CMSSW_11_3_4/src/LatinoAnalysis/ShapeAnalysis/scripts/mkPostFitCombinedPlot.py \
--inputFilePostFitShapesFromWorkspace output_histograms.root \
--outputFile mytest.root \
--kind P \
--cutName combinedMy \
--variable mll \
--structure auxiliar/structure.py \
--plotFile auxiliar/plot.py \
--lumiText '137 /fb'

~/releases/CMSSW_11_3_4/src/LatinoAnalysis/ShapeAnalysis/scripts/mkPostFitControlPlots.py \
--inputFileHisto mytest.root \
--outputFileHistoClone mytest_backup.root \
--listOfFilesOriginal ssww_2016_input.root,ssww_2017_input.root,ssww_2018_input.root \
--plotFile plot_combined.py \
--cutName combinedMy \
--variable mll

elif [ $1 = 1 ]; then

~/releases/CMSSW_11_3_4/src/LatinoAnalysis/ShapeAnalysis/scripts/mkPostFitCombinedPlot.py \
--inputFilePostFitShapesFromWorkspace output_histograms_bin$2.root \
--outputFile mytest_bin$2.root \
--kind P \
--cutName combinedMy \
--variable mll \
--structure auxiliar/structure.py \
--plotFile auxiliar/plot.py \
--lumiText '21 /fb'

~/releases/CMSSW_11_3_4/src/LatinoAnalysis/ShapeAnalysis/scripts/mkPostFitControlPlots.py \
--inputFileHisto mytest_bin$2.root \
--outputFileHistoClone mytest_backup_bin$2.root \
--listOfFilesOriginal output_wwAnalysis1001_20221_bin$2.root \
--plotFile plot_combined.py \
--cutName combinedMy \
--variable mll

elif [ $1 = 2 ]; then

~/releases/CMSSW_11_3_4/src/LatinoAnalysis/ShapeAnalysis/scripts/mkPostFitCombinedPlot.py \
--inputFilePostFitShapesFromWorkspace output_histograms_alt.root \
--outputFile mytest_alt.root \
--kind P \
--cutName combinedMy \
--variable mll \
--structure auxiliar/structure.py \
--plotFile auxiliar/plot.py \
--lumiText '21 /fb'

~/releases/CMSSW_11_3_4/src/LatinoAnalysis/ShapeAnalysis/scripts/mkPostFitControlPlots.py \
--inputFileHisto mytest_alt.root \
--outputFileHistoClone mytest_backup_alt.root \
--listOfFilesOriginal output_wwAnalysis1001_20221_bin1_alt.root output_wwAnalysis1001_20221_bin2_alt.root output_wwAnalysis1001_20221_bin3_alt.root \
--plotFile plot_combined.py \
--cutName combinedMy \
--variable mll

fi
