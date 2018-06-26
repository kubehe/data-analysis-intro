
disp('[geometricMean] start');
load '../../data/dataSet.mat';

classes = categorical({'klasa1', 'klasa2', 'klasa3', 'klasa4', 'klasa5'});

data = t;
f = figure;
for i=1:10
    try
        classAverages = zeros(1, 5);
        for j=1:length(classAverages)
            classAverages(j)= geomean(table2array(data(data.klasa == j, i)));
        end
        subplot(5,2,i);
        bar(classes, classAverages);
        title(['dat' num2str(i)]);
  
    catch e
        % subplot(5,2,i);
        % title(['Ujemne wartości dla dat' num2str(i)]);
        disp(e.message);
    end
end
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 0.4 0.9]);   

saveas(f, '../../output/geometricMeansByClass.png');

disp('[geometricMean] end');