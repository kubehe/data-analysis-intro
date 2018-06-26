
disp('[median] start');

load '../../data/dataSet.mat';

classes = categorical({'klasa1', 'klasa2', 'klasa3', 'klasa4', 'klasa5'});

data = t;
f = figure;
for i=1:10
    classMedians = zeros(1, 5);
    for j=1:length(classMedians)
        classMedians(j)= median(table2array(data(data.klasa == j, i)));
    end
    subplot(5,2,i);
    bar(classes, classMedians);
    title(['dat' num2str(i)]);
    
end
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 0.4 0.9]);   

saveas(f, '../../output/medianByClass.png');

disp('[median] end');