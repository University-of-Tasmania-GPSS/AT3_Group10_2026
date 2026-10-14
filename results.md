# Where are theft rates higher?

| Median suburb rate | Highest 5% threshold | Suburbs above the threshold |
| :---: | :---: | :---: |
| **16.29 per 1,000** | **51.75 per 1,000** | **23** |

Rates vary considerably across Melbourne. Darker colours show higher rates, the logarithmic colour scale keeps differences visible across a wide range.

:::{figure} figures/theft_rates.png
:label: theft-rates

Recorded theft per 1,000 residents, year ending March 2021. Grey areas are excluded. Sources: Crime Statistics Agency, ABS and Vicmap.
:::

**A high rate alone does not show that a suburb forms a spatial cluster.**

:::{dropdown} Highest-rate suburbs and supporting figures

| Suburb | Population | Theft offences | Rate per 1,000 |
| --- | ---: | ---: | ---: |
| Campbellfield | 4,977 | 482 | 96.85 |
| Collingwood | 9,179 | 801 | 87.26 |
| Melbourne | 54,941 | 4,678 | 85.15 |
| Ravenhall | 2,295 | 193 | 84.10 |
| Portsea | 787 | 66 | 83.86 |
| Burnley | 794 | 64 | 80.60 |
| Fitzroy | 10,431 | 831 | 79.67 |
| Tullamarine | 6,733 | 528 | 78.42 |

The combined sample rate is 23.51 per 1,000, calculated from total offences divided by total population. It differs from the median suburb rate.

Population comparison gives Pearson r = 0.125, with conventional p = 0.008. This is a weak positive association and is treated as exploratory because nearby suburbs may not be independent.

The percentile threshold is a descriptive comparison. It does not test whether high-rate suburbs occur together.
:::
