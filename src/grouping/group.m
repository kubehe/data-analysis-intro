close all
clear

load ../../data/dataSet.mat

% zamiana na tablice
data_array = table2array(t);
% usuniêcie ostatniej kolumny z klasami
no_cls_array = data_array(:,1:end-1);

% odleg³oœci miêdzy obiektami
dist = pdist(no_cls_array);
l1 = linkage(no_cls_array,'single');
l2 = linkage(no_cls_array,'complete');
l3 = linkage(no_cls_array,'average');

% wykresy dendrogramów
% najwyraŸniejszy podzia³ dla single linkage
figure; dendrogram(l1, 'colorthreshold', 'default');
title("Dendrogram dla single");
saveas(gcf, '../../output/dendrogram-single.png');
figure; dendrogram(l2, 'colorthreshold', 'default');
title("Dendrogram dla complete");
saveas(gcf, '../../output/dendrogram-complete.png');
figure; dendrogram(l3, 'colorthreshold', 'default');
title("Dendrogram dla average");
saveas(gcf, '../../output/dendrogram-average.png');