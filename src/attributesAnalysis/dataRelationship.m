disp('[dataRelationship] starting');

load ../../data/dataSet.mat;

data = t;

data_cell = table2cell(t);
data_num = cell2mat(data_cell);

datX = data(:,1:end-1).Properties.VariableNames;
klasy = categorical({'Klasa 1','Klasa 2','Klasa 3','Klasa 4'});
klasyCell = cellstr(klasy);



Kowariancja = cov(data{:,1:10});

tabelaKowariancji = array2table(Kowariancja);
tabelaKowariancji.Properties.VariableNames = datX;
tabelaKowariancji.Properties.RowNames = datX;
tabelaKowariancji

Korelacja = corr(data{:,1:10});

tabelaKorelacji = array2table(Korelacja);
tabelaKorelacji.Properties.VariableNames = datX;
tabelaKorelacji.Properties.RowNames = datX;
tabelaKorelacji




figure
gplotmatrix(data{:,1:10},[],data.klasa)
title('Macierz wykresów punktowych')



% dataNames = data(:,1:end-1).Properties.VariableNames;
% 
% figure
% gplotmatrix(data{:,1:11},[],data.klasa)
% title('Macierz wykresów punktowych')

