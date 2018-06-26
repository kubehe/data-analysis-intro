# PRiAD Laboratorium, Projekt 20

_Jakub Bączek, Krzysztof Wilk_

## Wstęp

Projekt wykonany na podstawie analizy danych z pliku `./data/dataSet.mat` (projekt20.mat)

Skrypt uruchamia się odpalając - `./start.sh`, lub w Matlabie - `main.m`

Odpalając w bashu upewnij się że dodałeś do zmiennej PATH scieżkę - `xxx/MATLAB/R2018a/bin`

Wygenerowane wyniki mogą się różnić od podanych w tym sprawozdaniu.

## Zadanie 1

### Podstawowe parametry zbioru danych

Zbiór danych składa się z x obiektów podzielonych na 5 klas.

Każdy obiekt jest opisany przez 10 atrybutów.

Poniżej zamieszczone wykresy przedstawiające ilości obiektów.

Wykres kołowy:

![didn't generate][dataQuantity]

Wykres słupkowy:

![didn't generate][dataQuantityBars]

Tabelka:

![didn't generate][dataQuantityTable]

Szczególnie na wykresie kołowym można zauważyć że obiekty są rozłożone równomiernie ze względu na klasy.

### Podstawowe statystyki opisowe (miary)

#### Średnia arytmetyczna

![didn't generate!][arithmeticAvgsByClass]


#### Średnia geometryczna

![didn't generate!][geometricMeansByClass]

Dla atrybutów **dat1**, **dat7** i **dat10**, występowały ujemne wartości - co wyklucza w tych przypadkach zastosowanie tej miary.

Można zauważyć że **dat2**, **dat3** i **dat5** wyróżniają się tym że średnie dla poszczególnych klas są podobne, co prawdopodobnie oznacza że nie będą przydatne w klasyfikacji.

#### Średnia harmoniczna 

![didn't generate!][harmonicMeansByClass]

#### Mediana 

![didn't generate!][mediansByClass]

#### Wartości minimum i maksimum 

![didn't generate!][maxMinByClass]

#### Odchylenie standardowe

![didn't generate!][standardDeviationsByClass]

#### Wariancja

![didn't generate!][variancesByClass]

## Zadanie 2

### Analiza zależności między atrybutami

#### Tabela korelacji atrybutów

![didn't generate!][correlationTable]

#### Tabela kowariancji atrybutów

![didn't generate!][covarianceTable]

### Analiza przydatności atrybutów 

![didn't generate!][matOfDependenceGraph]

## Zadanie 3


## Zadanie 4


## Wnioski

[dataQuantity]: https://github.com/kubehe/data-analysis-intro/raw/master/output/dataQuantity.png "Liczba reprezentów"
[arithmeticAvgsByClass]: https://github.com/kubehe/data-analysis-intro/raw/master/output/arithmeticAvgByClass.png "Średnie arytmetyczne według klas"
[geometricMeansByClass]: https://github.com/kubehe/data-analysis-intro/raw/master/output/geometricMeansByClass.png "Średnie geometryczne według klas"
[harmonicMeansByClass]: https://github.com/kubehe/data-analysis-intro/raw/master/output/harmonicMeansByClass.png "Średnie harmoniczne według klas"
[mediansByClass]: https://github.com/kubehe/data-analysis-intro/raw/master/output/mediansByClass.png "Mediany według klas"
[minMaxByClass]: https://github.com/kubehe/data-analysis-intro/raw/master/output/minMaxByClass.png "Wartości maksymalne i minimalne według kals"
[standardDeviationsByClass]: https://github.com/kubehe/data-analysis-intro/raw/master/output/standardDeviationsByClass.png "Odchylenie standardowe według klas"
[variancesByClass]: https://github.com/kubehe/data-analysis-intro/raw/master/output/variancesByClass.png "Wariancje według klas"
[correlationAttsTable]: https://github.com/kubehe/data-analysis-intro/raw/master/output/correlationAttsTable.png "Macierz korelacji między atrybutami"
[matOfDependenceGraph]: https://github.com/kubehe/data-analysis-intro/raw/master/output/matOfDependenceGraph.png "Macierz wykresów zależności"
[focusedMatOfDependenceGraph]: https://github.com/kubehe/data-analysis-intro/raw/master/output/focusedMatOfDependenceGraph.png "Wydzielony fragment macierzy wykresóœ zależności"
<!-- []: https://github.com/kubehe/data-analysis-intro/raw/master/output/.png "" -->