close all
clear

load ../../data/dataSet.mat

% liczba testow
max_i = 500;

correct_train = zeros(max_i,5);
correct_test = zeros(max_i,5);

for i=1:max_i

% podzial na losowe zbiory uczacy (80%) i testowy (20%)
c = cvpartition(t.klasa,'HoldOut',0.2);

% uczenie dla atrybutow 4, 6 i 9
% klasyfikator najblizszego sasiada dla N=1
kl_nn_1 = fitcknn(t{c.training,[4 6 9]},t{c.training,end},'NumNeighbors',1);
result_nn_1 = kl_nn_1.predict(t{c.training,[4 6 9]});
klnn1_train = crosstab(t{c.training,end},result_nn_1);
% testowanie
result_nn_1 = kl_nn_1.predict(t{c.test,[4 6 9]});
klnn1_test = crosstab(t{c.test,end},result_nn_1);

% klasyfikator najblizszego sasiada dla N=3
kl_nn_3 = fitcknn(t{c.training,[4 6 9]},t{c.training,end},'NumNeighbors',3);
result_nn_3 = kl_nn_3.predict(t{c.training,[4 6 9]});
klnn3_train = crosstab(t{c.training,end},result_nn_3);
% testowanie
result_nn_3 = kl_nn_3.predict(t{c.test,[4 6 9]});
klnn3_test = crosstab(t{c.test,end},result_nn_3);

% klasyfikator prototypow
prot(1,:) = mean(t{c.training & t.klasa == 1,[4 6 9]});
prot(2,:) = mean(t{c.training & t.klasa == 2,[4 6 9]});
prot(3,:) = mean(t{c.training & t.klasa == 3,[4 6 9]});
prot(4,:) = mean(t{c.training & t.klasa == 4,[4 6 9]});
prot(5,:) = mean(t{c.training & t.klasa == 5,[4 6 9]});
%prot(:,4) = [1; 2; 3; 4; 5];
kl_prot = fitcknn(prot(:,1:3), [1; 2; 3; 4; 5],'NumNeighbors',1);
result_prot = kl_prot.predict(t{c.training,[4 6 9]});
klnp_train = crosstab(t{c.training,end},result_prot);
% testowanie
result_prot = kl_prot.predict(t{c.test,[4 6 9]});
klnp_test = crosstab(t{c.test,end},result_prot);

% naiwny klasyfikator Bayesa
kl_nb = fitcnb(t{c.training,[4 6 9]},t{c.training,end});
result_nb = kl_nb.predict(t{c.training,[4 6 9]});
klnb_train = crosstab(t{c.training,end},result_nb);
% testowanie
result_nb = kl_nb.predict(t{c.test,[4 6 9]});
klnb_test = crosstab(t{c.test,end},result_nb);

% klasyfikator drzewa decyzyjnego
kl_tree = fitctree(t{c.training,[4 6 9]},t{c.training,end});
result_tree = kl_tree.predict(t{c.training,[4 6 9]});
kltree_train = crosstab(t{c.training,end},result_tree);
% testowanie
result_tree = kl_tree.predict(t{c.test,[4 6 9]});
kltree_test = crosstab(t{c.test,end},result_tree);

% obliczanie skutecznosci poszczegolnych metod
correct_train(i,1) = sum(diag(klnn1_train))/c.TrainSize;
correct_test(i,1) = sum(diag(klnn1_test))/c.TestSize;
correct_train(i,2) = sum(diag(klnn3_train))/c.TrainSize;
correct_test(i,2) = sum(diag(klnn3_test))/c.TestSize;
correct_train(i,3) = sum(diag(klnp_train))/c.TrainSize;
correct_test(i,3) = sum(diag(klnp_test))/c.TestSize;
correct_train(i,4) = sum(diag(klnb_train))/c.TrainSize;
correct_test(i,4) = sum(diag(klnb_test))/c.TestSize;
correct_train(i,5) = sum(diag(kltree_train))/c.TrainSize;
correct_test(i,5) = sum(diag(kltree_test))/c.TestSize;
end

% tabelka z podsumowaniem skutecznosci klasyfikacji
result = [mean(correct_train); mean(correct_test)];
res_tab = table(result(:,1), result(:,2), result(:,3), result(:,4), result(:,5));
perc_fun = @(x) strcat(num2str(x.*100), '%');
res_tab_perc = varfun(perc_fun, res_tab);

ui = figure;
ui.Position = [100 100 455 60];
tab = uitable(ui);
tab.Data = table2cell(res_tab_perc);
tab.ColumnName = {'NN1', 'NN3', 'Prototypy', 'Bayes', 'Drzewo'};
tab.RowName = {'Ucz¹cy', 'Testowy'};
tab.Position = [0 0 455 60];
saveas(ui, '../../output/clsf_results', 'png');
