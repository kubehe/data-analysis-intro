close all
clear

load ../../data/dataSet.mat

% zamiana na tablice
data_array = table2array(t);

% pominiecie atrybutu decyzyjnego
no_cls_array = data_array(:,1:end-1);

% standaryzacja
std_nocls = zscore(no_cls_array);

% macierz wykresow z zaznaczonym podzialem na klasy
% widac, ze naturalne skupiska wystepuja przy rozpatrywaniu atrybutow 4, 6 i 9
figure;
gplotmatrix(std_nocls, [], data_array(:,end), [1 0 0; 0 1 0; 0 0 1; 1 0.85 0.25; 0.75 0.35 0.45], '.', 4);   
title("Wykresy punktowe atrybutów z podzia³em wg atrybutu decyzyjnego");
set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 25 15]);
saveas(gcf, '../../output/plotmat-classes', 'png');

% odleglosci miedzy obiektami dla atr. 4, 6 i 9
diststd = pdist(std_nocls(:,[4 6 9]));
ls1 = linkage(diststd,'single');
ls2 = linkage(diststd,'complete');
ls3 = linkage(diststd,'average');

% wykresy dendrogramów
% najwyrazniejszy podzia³ dla complete i average linkage
figure; dendrogram(ls1, 20, 'colorthreshold', 'default');
title("Dendrogram grupowania hierarchicznego (single linkage)");
set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 25 15]);
saveas(gcf, '../../output/dgram-single', 'svg');
figure; dendrogram(ls2, 20, 'colorthreshold', 'default');
title("Dendrogram grupowania hierarchicznego (complete linkage)");
set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 25 15]);
saveas(gcf, '../../output/dgram-complete', 'svg');
figure; dendrogram(ls3, 20, 'colorthreshold', 'default');
title("Dendrogram grupowania hierarchicznego (average linkage)");
set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 25 15]);
saveas(gcf, '../../output/dgram-average', 'svg');

% grupowanie dla atrybutów 4, 6 i 9 
% k-srednie 
k2 = kmeans(std_nocls(:,[4 6 9]), 5, 'Replicates', 150);
figure; gplotmatrix(std_nocls, [], k2, [1 0 0; 0 1 0; 0 0 1; 1 0.85 0.25; 0.75 0.35 0.45], '.', 4); 
title("Wykresy punktowe atrybutów 4, 6 i 9 z grupowaniem (kmeans)");
set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 25 15]);
saveas(gcf, '../../output/plotmat-group469-kmeans', 'png');

% grupowanie wg odleglosci dla atr. [4 6 9]
% dla complete i average wychodzi niemal identycznie jak wg podanych klas
c1 = clusterdata(std_nocls(:,[4 6 9]), 'linkage', 'average', 'maxclust', 5);
c2 = clusterdata(std_nocls(:,[4 6 9]), 'linkage', 'complete', 'maxclust', 5);
c3 = clusterdata(std_nocls(:,[4 6 9]), 'linkage', 'single', 'maxclust', 5);
figure; gplotmatrix(std_nocls, [], c1, [1 0 0; 0 1 0; 0 0 1; 1 0.85 0.25; 0.75 0.35 0.45], '.', 4); 
title("Wykresy punktowe atrybutów 4, 6 i 9 z grupowaniem (average linkage)");
set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 25 15]);
saveas(gcf, '../../output/plotmat-group469-avglink', 'png');

% porownanie wynikow grupowania roznymi metodami do atrybutu decyzyjnego
cross_link_av = crosstab(c1, data_array(:,end));
cross_link_com = crosstab(c2, data_array(:,end));
cross_link_single = crosstab(c3, data_array(:,end));
cross_kmeans = crosstab(k2, data_array(:,end));