disp('[MAIN] starting data-analysis-intro');
% data = load('../data/dataSet.mat');
% disp('Data used in this project: ');
% disp(data.t);

filesToRun = [
    "./introStats/rawData.m";
    "./introStats/dataQuantity.m";
    "./measures/arithmeticAvg.m";
    "./measures/geometricMean.m";
    "./measures/harmonicMean.m";
    "./measures/maxMin.m";
    "./measures/medianValues.m";
    "./measures/standardDeviation.m";
    "./measures/variance.m";
];

for i=1:length(filesToRun)
    disp(filesToRun(i));
    try
        run(filesToRun(i));
    catch e
        disp(e.message);

    end
end


disp('[MAIN] finished data-analysis-intro');