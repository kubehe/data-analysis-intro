# PRiAD Laboratorium, Projekt 20

_Jakub Bączek, Krzysztof Wilk_

## Wstęp

Projekt wykonany na podstawie analizy danych z pliku `./data/dataSet.mat` (projekt20.mat)

Skrypt uruchamia się odpalając - `./start.sh`, odpalając wybrany skrypt z pliku `src/` - `./start.sh <path><file>.m` gdzie `path` znajduje się w pliku `src/` , lub w Matlabie - `main.m`

Odpalając w bashu upewnij się że dodałeś do zmiennej PATH scieżkę - `xxx/MATLAB/R2018a/bin`

## Zadanie 1

### Podstawowe parametry zbioru danych

Zbiór danych składa się z 495 obiektów podzielonych na 5 klas.

Każdy obiekt jest opisany przez 10 atrybutów.

Poniżej zamieszczone wykresy przedstawiające ilości obiektów.

**Wykres kołowy:**

![didn't generate][dataQuantity]

**Wykres słupkowy:**

![didn't generate][dataQuantityBars]

**Tabelka:**

![didn't generate][dataQuantityTable]

Szczególnie na wykresie kołowym można zauważyć że obiekty są rozłożone równomiernie ze względu na klasy.

### Podstawowe statystyki opisowe (miary)

#### Średnia arytmetyczna

![didn't generate!][arithmeticAvgsByClass]

Atrybuty **dat2**, **dat3**, **dat5** - klasy w poszczególnych zbiorach są podobne, co prawdopodobnie wykluczy zastosowanie tych atrybutów w klasyfikacji.

#### Średnia geometryczna

![didn't generate!][geometricMeansByClass]

Dla atrybutów **dat1**, **dat7** i **dat10**, występowały ujemne wartości - co wyklucza w tych przypadkach zastosowanie tej miary.

Można zauważyć że **dat2**, **dat3** i **dat5** wyróżniają się tym że średnie dla poszczególnych klas są podobne, co prawdopodobnie oznacza że nie będą przydatne w klasyfikacji.

Atrybuty **dat2** i **dat3** mają po raz kolejny zbliżone miary dla poszczególnych klas.

#### Średnia harmoniczna

![didn't generate!][harmonicMeansByClass]

Po raz trzeci atrybuty **dat2** i **dat3** mają zbliżone wartości metryki dla poszczególnych klas. Atrybut **dat5** po raz drugi jest wykluczony z zastosowania do klasyfikacji.

#### Mediana 

![didn't generate!][mediansByClass]

Atrybuty **dat2**, **dat3** i **dat5** po raz kolejny mają zbliżone metryki dla poszczególnych klas.

#### Wartości minimum i maksimum 

![didn't generate!][maxMinByClass]

Przedziały atrybutów **dat2**, **dat3** i **dat5** są zbliżone dla poszczególnych klas.

#### Odchylenie standardowe

![didn't generate!][standardDeviationsByClass]

Atrybuty **dat2** i **dat3** mają zbliżone wartości dla poszczególnych klas.

Odchylenie standardowe ze względu na to że jest miarą bezwzględną uniemożliwia wyprowadzić jakiekolwiek wnioski.

Odchylenie standardowe służy raczej jako miara niepewności. Zastosowanie jej w wypadku wstępnej analizy do klasyfikacji nie ma za bardzo sensu.

#### Wariancja

![didn't generate!][variancesByClass]

Odchylenie standardowe jest pierwiastkiem kwadratowym wariancji, a więc te miary są od siebie zależne co oznacza że nie powinny prowadzić do odmiennych wniosków.

## Zadanie 2

### Analiza zależności między atrybutami

#### Tabela korelacji atrybutów

![didn't generate!][correlationTable]

Można zauważyć z tabeli wyraźną korelację między poniższymi danymi:

- **dat1** : **dat10**
- **dat7** : **dat10**
- **dat1** : **dat7**

Wartość korelacji dla pozostałych danych jest bliska zeru.

#### Tabela kowariancji atrybutów

![didn't generate!][covarianceTable]

Ciężko zinterpretować macierz kowariancji, ponieważ wartości nie należą do przedziału `<-1, 1>`

### Analiza przydatności atrybutów

#### Macierz wykresów zależnosći

![didn't generate!][matOfDependenceGraph]

Możemy zauważyć z powyższych danych tworzenie się grup dla klas.

## Zadanie 3

### Metody grupowania
**Podział na klasy**
![didn't generate!][Classes]
Można zauważyć, że na kilku wykresach powstają naturalne skupiska. Najwyraźniejsze są dla wykresów atrybutów: `4 i 6` (skupisko klas 1 i 4), `4 i 9` (skupisko klas 4, 5 oraz 2), jak również `6 i 9` (skupisko klas 4 i 5).
Można wyciągnąć wniosek, że atrybutami istotnymi dla grupowania są własnie `4, 6 i 9`. Warto sprawdzić odległości między grupami, powstałymi dzięki klasteryzacji hierarchicznej, za pomocą dendrogramu:

**Dendrogram grupowania hierarchicznego (single linkage)**
![didn't generate!][singleLinkDendrogram]

**Dendrogram grupowania hierarchicznego (complete linkage)**
![didn't generate!][completeLinkDendrogram]

**Dendrogram grupowania hierarchicznego (average linkage)**
![didn't generate!][avgLinkDendrogram]

Jak widać najlepszy podział na grupy ma miejsce dla `średniego i całkowitego połączenia`. Optymalna liczba grup to 5, czyli dokładnie tyle, na ile klas przedstawia atrybut decyzyjny.
Poniższe wykresy przedstawiają wyniki grupowania za pomocą metody `grupowania hierarchicznego ze średnim połączeniem` oraz `k-średnich`:

**Grupowanie metodą k-średnich dla atrybutów 4, 6 i 9**
![didn't generate!][kmeansClustering]

**Grupowanie hierarchiczne (average linkage) dla atrybutów 4, 6 i 9**
![didn't generate!][avgLinkClustering]

Ze względu na losowe oznaczenie grup dla metody k-średnich oraz mnogość punktów na wykresach, trudno sprawdzić, która metoda lepiej oddaje pierwotny podział na klasy.
Można to sprawdzić za pomocą tabeli krzyżowych:

**Tabela krzyżowa grupowania metodą k-średnich**
![didn't generate!][kmeansCrossTable]

**Tabela krzyżowa grupowania hierarchicznego (single linkage)**
![didn't generate!][singleLinkCrossTable]

**Tabela krzyżowa grupowania hierarchicznego (average linkage)**
![didn't generate!][averageLinkCrossTable]

**Tabela krzyżowa grupowania hierarchicznego (complete linkage)**
![didn't generate!][completeLinkCrossTable]

Jak widać, najlepiej spisuje się metoda k-średnich.

## Zadanie 4

### Uczenie nadzorowane

W tym punkcie dokonaliśmy 500 prób uczenia 5 różnych klasyfikatorów, po losowym podziale zbioru danych na zbiór uczący (80%) i testowy (20%).
Skuteczność sprawdzamy za pomocą tabel krzyżowych, dzieląc sumę elementów na diagonali przez liczbę elementów zbioru. Następnie wyniki zamieniliśmy na wartość procentową.
Wyniki przedstawia poniższa tabela:

**Tabela z wynikami skuteczności klasyfikacji poszczególnych metod**

![didn't generate!][classificationTable]

Dla naszego zbiory danych najskuteczniejsze okazały się kolejno **Naiwny klasyfikator Bayesa** oraz **Drzewa decyzyjnego** - niemal stuprocentowa skuteczność w fazie testowej.
Metoda **Najbliższego prototypu** wypadła najgorzej, ale mimo wszystko wynik jest akceptowalny.

## Wnioski

- Analiza danych jest dosyć czasochłonna mimo że samo rozwiązanie w postaci kodu nie jest duże. W tej dziedzinie nauki dużo pracy zajmuje dobór odpowiednich parametrów.
- Bardzo ważnym elementem jest odpowiednia reprezentacja danych, same liczby często nie są w stanie odwzorować dobrze zależności.
- Poświęcenie chwili czasu na zrobienie prostych wykresów z badanych danych pozwala przyśpieszyć pracę, np. przy grupowaniu.
- Przede wszystkim projekt pozwolił nam lepiej zrozumieć dziedzinę informatyki jaką jest analiza danych. Poprzez praktyczny projekt łatwiej nam było zrozumieć podstawy tego przedmiotu.

[dataQuantity]: https://github.com/kubehe/data-analysis-intro/raw/master/output/dataQuantity.png "Liczba reprezentów"
[dataQuantityBars]: https://github.com/kubehe/data-analysis-intro/raw/master/output/dataQuantityBars.png "Liczba reprezentów - wykres słupkowy"
[dataQuantityTable]: https://github.com/kubehe/data-analysis-intro/raw/master/output/dataQuantityTable.png "Liczba reprezentów - tabela"
[arithmeticAvgsByClass]: https://github.com/kubehe/data-analysis-intro/raw/master/output/arithmeticAvgsByClass.png "Średnie arytmetyczne według klas"
[geometricMeansByClass]: https://github.com/kubehe/data-analysis-intro/raw/master/output/geometricMeansByClass.png "Średnie geometryczne według klas"
[harmonicMeansByClass]: https://github.com/kubehe/data-analysis-intro/raw/master/output/harmonicMeansByClass.png "Średnie harmoniczne według klas"
[mediansByClass]: https://github.com/kubehe/data-analysis-intro/raw/master/output/medianByClass.png "Mediany według klas"
[maxMinByClass]: https://github.com/kubehe/data-analysis-intro/raw/master/output/maxMinByClass.png "Wartości maksymalne i minimalne według kals"
[standardDeviationsByClass]: https://github.com/kubehe/data-analysis-intro/raw/master/output/standardDeviationsByClass.png "Odchylenie standardowe według klas"
[variancesByClass]: https://github.com/kubehe/data-analysis-intro/raw/master/output/variancesByClass.png "Wariancje według klas"
[correlationTable]: https://github.com/kubehe/data-analysis-intro/raw/master/output/correlationTable.png "Macierz korelacji między atrybutami"
[covarianceTable]: https://github.com/kubehe/data-analysis-intro/raw/master/output/covarianceTable.png "Macierz kowariancji między atrybutami"
[matOfDependenceGraph]: https://github.com/kubehe/data-analysis-intro/raw/master/output/matOfDependenceGraph.png "Macierz wykresów zależności"
[focusedMatOfDependenceGraph]: https://github.com/kubehe/data-analysis-intro/raw/master/output/focusedMatOfDependenceGraph.png "Wydzielony fragment macierzy wykresóœ zależności"
<!-- []: https://github.com/kubehe/data-analysis-intro/raw/master/output/.png "" -->

[Classes]: https://github.com/kubehe/data-analysis-intro/raw/master/output/plotmat-classes.png "Podział na klasy według atrybutu decyzyjnego"
[kmeansClustering]: https://github.com/kubehe/data-analysis-intro/raw/master/output/plotmat-group469-kmeans.png "Grupowanie metodą k-średnich dla atrybutów 4, 6 i 9"
[avgLinkClustering]: https://github.com/kubehe/data-analysis-intro/raw/master/output/plotmat-group469-avglink.png "Grupowanie hierarchiczne (average linkage) dla atrybutów 4, 6 i 9"
[singleLinkDendrogram]: https://github.com/kubehe/data-analysis-intro/raw/master/output/dgram-single.png "Dendrogram grupowania hierarchicznego (single linkage)"
[avgLinkDendrogram]: https://github.com/kubehe/data-analysis-intro/raw/master/output/dgram-average.png "Dendrogram grupowania hierarchicznego (average linkage)"
[completeLinkDendrogram]: https://github.com/kubehe/data-analysis-intro/raw/master/output/dgram-complete.png "Dendrogram grupowania hierarchicznego (complete linkage)"
[kmeansCrossTable]: ./output/crosstab-kmeans.png "Tabela krzyżowa grupowania metodą k-średnich"
[singleLinkCrossTable]: https://github.com/kubehe/data-analysis-intro/raw/master/output/crosstab-single-link.png "Tabela krzyżowa grupowania hierarchicznego (single linkage)"
[averageLinkCrossTable]: https://github.com/kubehe/data-analysis-intro/raw/master/output/crosstab-avg-link.png "Tabela krzyżowa grupowania hierarchicznego (average linkage)"
[completeLinkCrossTable]: https://github.com/kubehe/data-analysis-intro/raw/master/output/crosstab-complete-link.png "Tabela krzyżowa grupowania hierarchicznego (complete linkage)"
[classificationTable]: https://github.com/kubehe/data-analysis-intro/raw/master/output/clsf-results.png "Tabela wynikami skuteczności klasyfikacji poszczególnych metod"