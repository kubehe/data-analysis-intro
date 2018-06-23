disp('[MAIN] starting data-analysis-intro');
%data = load('../data/dataSet.mat');
%disp('Data used in this project: ');
%disp(data.t);
run('./introStats/rawData.m');
run('./introStats/dataQuantity.m');
run('./measures/arithmeticAvg.m');
run('./measures/geometricMean.m');
run('./measures/harmonicMean.m');
run('./measures/maxMin.m');
run('./measures/median.m');
run('./measures/standardDeviation.m');
run('./measures/variance.m');


disp('[MAIN] finished data-analysis-intro');