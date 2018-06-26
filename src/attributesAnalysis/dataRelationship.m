disp('[dataRelationship] starting');

load ../../data/dataSet.mat;

data = t;

data_cell = table2cell(t);
data_num = cell2mat(data_cell);

datX = data(:,1:end-1).Properties.VariableNames;
klasy = categorical({'Klasa 1','Klasa 2','Klasa 3','Klasa 4'});
klasyCell = cellstr(klasy);



covariance = cov(data{:,1:10});

covarianceTable = array2table(covariance);
covarianceTable.Properties.VariableNames = datX;
covarianceTable.Properties.RowNames = datX;

covFig = figure;
covT = uitable('Data',covarianceTable{:,:},'ColumnName',covarianceTable.Properties.VariableNames,...
    'RowName',covarianceTable.Properties.RowNames,'Units', 'Normalized', 'Position',[0, 0, 1, 1]);
saveas(covFig, '../../output/covarianceTable.png');

correlation = corr(data{:,1:10});

correlationTable = array2table(correlation);
correlationTable.Properties.VariableNames = datX;
correlationTable.Properties.RowNames = datX;

corrFig = figure;
corrT = uitable('Data',correlationTable{:,:},'ColumnName',correlationTable.Properties.VariableNames,...
    'RowName',correlationTable.Properties.RowNames,'Units', 'Normalized', 'Position',[0, 0, 1, 1]);
saveas(corrFig, '../../output/correlationTable.png');

mat = figure;
gplotmatrix(data{:,1:10},[],data.klasa)
title('Macierz wykresów punktowych')
saveas(mat, '../../output/matOfDependenceGraph.png');

