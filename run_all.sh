source setup.sh
./makeCards.sh 1
./runFits.sh 1
./run_postFitShapesFromWorkspace.sh 1 1
./run_mkPostFitCombinedPlot.sh 1 1

./run_mkPlot.sh
root -l -q -b /home/submit/ceballos/cms/MitAnalysisRunIII/rdf/makePlots/convert_histograms.C'("/home/submit/ceballos/cards/combine_plots/mytest_bin1.root","combinedMy/mll","ww_output_bin1.root")'
root -l -q -b /home/submit/ceballos/cms/MitAnalysisRunIII/rdf/makePlots/convert_histograms.C'("/home/submit/ceballos/cards/combine_plots/mytest_bin2.root","combinedMy/mll","ww_output_bin2.root")'
root -l -q -b /home/submit/ceballos/cms/MitAnalysisRunIII/rdf/makePlots/convert_histograms.C'("/home/submit/ceballos/cards/combine_plots/mytest_bin3.root","combinedMy/mll","ww_output_bin3.root")'
root -l -q -b /home/submit/ceballos/cms/MitAnalysisRunIII/rdf/makePlots/convert_histograms.C'("/home/submit/ceballos/cards/combine_plots/mytest_bin4.root","combinedMy/mll","ww_output_bin4.root")'
