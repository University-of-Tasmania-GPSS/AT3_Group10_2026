# How we analysed the data

| 1. Select | 2. Match | 3. Calculate | 4. Compare |
| --- | --- | --- | --- |
| Melbourne, 2021, B40 Theft | Crime, Census and suburb boundaries | Theft offences per 1,000 residents | Spatial clustering and household income |

**Theft rate = recorded theft offences / resident population × 1,000**

- **517 suburbs matched** across crime, population and boundary data.
- Keeping populations above **500 residents** leaves **446 suburbs**, reducing extreme rates caused by very small populations.
- **Moran's I** examines nearby theft rates. **Spearman correlation** compares household income with theft rates.

The maps describe recorded offences relative to resident population. Workers and visitors also contribute to activity in these areas.

:::{dropdown} Detailed methods

**Selecting and matching data**

The Crime Statistics Agency CSV is filtered to 2021, March and B40 Theft before counts are summed by suburb. Crime records are restricted to the selected councils. Thousands separators are removed from counts and suburb names are converted to uppercase and trimmed.

Bellfield in Banyule and Hillside in Melton are matched explicitly, while same-named regional Census localities are removed. Suburbs without matching crime, population and geometry are excluded. There are 532 selected boundary polygons, 517 matching suburbs and 446 retained suburbs after the population cutoff.

The boundary files use GDA2020 / MGA zone 55 (EPSG:7855), in metres. ABS Suburbs and Localities approximate official suburb boundaries. The Census and Vicmap boundaries may differ even when names match. For suburbs crossing the study-area edge, the retained crime count may cover only part of the full Census population area.

**Rates and income**

Rates use annual recorded theft offences divided by the 2021 resident population. The notebook retains `TOTAL_CRIME` as the original column name for the selected theft counts. The highest 5% threshold describes high-rate suburbs, it does not test spatial clustering. The rate map uses a logarithmic colour scale because values are skewed.

Median weekly household income comes from Census table G02, joined using the suburb and locality code. Spearman correlation compares income ranks with theft-rate ranks. Its conventional p-value assumes independent observations, so the relationship is treated as exploratory.

The original Pearson correlation between population and theft rate is also retained as an exploratory comparison.

**Spatial statistics**

Each suburb selects its four nearest centroids. Connections are made reciprocal and row-standardised so each suburb's weights sum to one. This defines neighbours by straight-line proximity, rather than shared boundaries.

Global Moran's I tests overall similarity between nearby values (Moran, 1950). We use log(1 + theft rate) to reduce the influence of extreme rates. The one-sided test compares the observed value with 999 random rearrangements, testing positive clustering.

Local Moran's I identifies high-high and low-low clusters and high-low and low-high outliers (Anselin, 1995). It uses the same transformed rates and 999 permutations. Folded permutation probabilities are doubled and capped at one for a conservative two-sided comparison. Benjamini-Hochberg adjusted values below 0.05 identify the mapped clusters and outliers (Benjamini & Hochberg, 1995). Local classifications remain exploratory and depend on the neighbour definition and testing assumptions.

GeoPandas handles boundaries and joins, pandas prepares tables, NumPy transforms rates, SciPy provides correlations and probability adjustment, PySAL supplies spatial statistics, Matplotlib creates figures.
:::

:::{dropdown} Data sources and references

**Data sources**

- Crime Statistics Agency (2026). *Recorded offences, year ending March 2026*, Table 03. The CSV is filtered to the year ending March 2021 and subdivision B40 Theft. [Data catalogue](https://discover.data.vic.gov.au/en_AU/dataset/data-tables-recorded-offences).
- Australian Bureau of Statistics (2021). *2021 Census General Community Profile, Victorian Suburbs and Localities*. Population is from G01, median weekly household income is from G02. [Census DataPacks](https://www.abs.gov.au/census/find-census-data/datapacks).
- Victorian Government. *Vicmap Administrative*: AD_LOCALITY_AREA_POLYGON and AD_LGA_AREA_POLYGON. [Vicmap Administrative](https://www.land.vic.gov.au/maps-and-spatial/spatial-data/vicmap-catalogue/vicmap-admin).
- Victorian Government. *Metropolitan Melbourne*, used to identify the 31 councils. [Study area definition](https://liveinmelbourne.vic.gov.au/discover/melbourne/metropolitan-melbourne).


**References**

Anselin, L. (1995). Local Indicators of Spatial Association - LISA. *Geographical Analysis*, 27(2), 93-115. [doi:10.1111/j.1538-4632.1995.tb00338.x](https://doi.org/10.1111/j.1538-4632.1995.tb00338.x).

Benjamini, Y., & Hochberg, Y. (1995). Controlling the false discovery rate: a practical and powerful approach to multiple testing. *Journal of the Royal Statistical Society: Series B*, 57(1), 289-300. [doi:10.1111/j.2517-6161.1995.tb02031.x](https://doi.org/10.1111/j.2517-6161.1995.tb02031.x).

Moran, P. A. P. (1950). Notes on continuous stochastic phenomena. *Biometrika*, 37(1/2), 17-23. [doi:10.1093/biomet/37.1-2.17](https://doi.org/10.1093/biomet/37.1-2.17).

Australian Bureau of Statistics (2021). *Suburbs and Localities*. [Geography definitions](https://www.abs.gov.au/statistics/standards/australian-statistical-geography-standard-asgs/edition-3-july-2021-june-2026/non-abs-structures/suburbs-and-localities).

:::
