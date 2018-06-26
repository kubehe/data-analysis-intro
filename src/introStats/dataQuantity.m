disp('[dataQuantity] start');
load ../../data/dataSet.mat;
data = t;
arr = table2array(data);
% disp(arr);
objectsQuantity = height(data);
numberOfClasses = length(unique(data.klasa));

% zliczenie powtorzen dla kazdej z klas
class1 = height(data(data.klasa == 1, 1));
class2 = height(data(data.klasa == 2, 1));
class3 = height(data(data.klasa == 3, 1));
class4 = height(data(data.klasa == 4, 1));
class5 = height(data(data.klasa == 5, 1));

quantities = [ class1, class2, class3, class4, class5];
labels = {'klasa 1', 'klasa 2', 'klasa 3', 'klasa 4', 'klasa 5'};

barFigure = figure;
bf = bar(categorical(labels), quantities);
saveas(barFigure, '../../output/dataQuantityBars.png')

pieFigure = figure;
p = pie(quantities, labels);
saveas(pieFigure, '../../output/dataQuantity.png');

% w trybie tekstowym nie dziala uitable
tableFigure = figure;
tableFigure.Position = [80 80 550 50];
tab = uitable(tableFigure);
tab.ColumnName = labels;
tab.RowName = {'Ilość'};
tab.Position = [0 0 550 50];
tab.Data = {class1, class2, class3, class4, class5};

saveas(tableFigure, '../../output/dataQuantityTable.png')


disp('[dataQuantity] end');
