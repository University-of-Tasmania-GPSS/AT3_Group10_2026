# Clustering and household income

## Similar theft rates occur near each other

**Global Moran's I = 0.508 | permutation p = 0.001**

The overall pattern shows positive spatial clustering of log-transformed theft rates. The local analysis identifies **27 high-high suburbs** and **30 low-low suburbs**.

:::{figure} figures/theft_clusters.png
:label: theft-clusters

Local Moran classifications after adjustment for multiple tests (q < 0.05). Grey: not significant. Near-white: excluded from the sample.
:::

Red clusters occur around inner Melbourne and parts of the west. Blue clusters occur mainly in eastern and northeastern areas, with some on the southern peninsula.

:::{dropdown} How to read the colours and the shuffling test

| Colour | Meaning |
| --- | --- |
| Red: high-high | A relatively high rate near other high rates |
| Blue: low-low | A relatively low rate near other low rates |
| Orange: high-low | A high rate near low rates, a spatial outlier |
| Teal: low-high | A low rate near high rates, a spatial outlier |
| Grey | No significant local result under the selected test |

High and low are relative to the sample's log-transformed rates. Grey does not mean no theft. There are 1 high-low outliers, 0 low-high outliers and 388 suburbs without significant local results.

For Global Moran's I, the suburb locations and connections stay fixed while the rate values are shuffled 999 times. None of the simulated values reached the observed I, giving a positive-clustering permutation p of 0.001. This compares the observed pattern with spatial randomness under the chosen model.

Local tests use 999 permutations, conservative two-sided probabilities and Benjamini-Hochberg adjustment.
:::

## Higher income has a weak association with lower rates

**Spearman rho = -0.257 | 446 suburbs**

:::{figure} figures/income_theft.png
:label: income-theft

Each point is one suburb. The theft-rate axis is logarithmic. Sources: ABS 2021 Census G02 and Crime Statistics Agency.
:::

Higher-income suburbs tend to have lower theft rates, with many exceptions. **Income does not determine the cluster-map colours**, and this association does not establish causation.

:::{dropdown} What Spearman correlation tells us

Spearman compares the rankings of household income and theft rate. A negative value means higher values of one tend to accompany lower values of the other. Ranks reduce the influence of extreme rates.

The conventional p-value is 3.9. It does not account for spatial dependence between suburbs, so we treat the income result as exploratory.

The analysis describes suburb-level relationships. It does not establish how an individual's income relates to theft, or show that income explains the mapped clusters.
:::
