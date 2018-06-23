close all
clear

load ../../data/dataSet.mat

% zamiana na tablice
data_array = table2array(t);
% usuni�cie ostatniej kolumny z klasami
no_cls_array = data_array(:,1:end-1);

% odleg�o�ci mi�dzy obiektami
dist = pdist(no_cls_array);
l1 = linkage(no_cls_array,'single');
l2 = linkage(no_cls_array,'complete');
l3 = linkage(no_cls_array,'average');

% wykresy dendrogram�w
% najwyra�niejszy podzia� dla single linkage
figure; dendrogram(l1, 'colorthreshold', 'default');
title("Dendrogram dla single");
saveas(gcf, '../../output/dendrogram-single.png');
figure; dendrogram(l2, 'colorthreshold', 'default');
title("Dendrogram dla complete");
saveas(gcf, '../../output/dendrogram-complete.png');
figure; dendrogram(l3, 'colorthreshold', 'default');
title("Dendrogram dla average");
saveas(gcf, '../../output/dendrogram-average.png');