
disp('[harmonicMean] start');

load '../../data/dataSet.mat';

classes = categorical({'klasa1', 'klasa2', 'klasa3', 'klasa4', 'klasa5'});

data = t;
f = figure;
for i=1:10
    classAverages = zeros(1, 5);
    for j=1:length(classAverages)
        classAverages(j)= harmmean(table2array(data(data.klasa == j, i)));
    end
    subplot(5,2,i);
    bar(classes, classAverages);
    title(['dat' num2str(i)]);
end
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 0.4 0.9]);   

saveas(f, '../../output/harmonicMeansByClass.png');

disp('[harmonicMean] end');