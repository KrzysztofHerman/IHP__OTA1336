
# CACE Summary for OTA1336

**netlist source**: schematic

|      Parameter       |         Tool         |     Result      | Min Limit  |  Min Value   | Typ Target |  Typ Value   | Max Limit  |  Max Value   |  Status  |
| :------------------- | :------------------- | :-------------- | ---------: | -----------: | ---------: | -----------: | ---------: | -----------: | :------: |
| Offset Error         | ngspice              | result               |             any | 3238.530 uV |          any | 5504.510 uV |       500 uV | 6756.160 uV |   Fail ❌    |
| CMRR                 | ngspice              | result               |             any |  39.740 dB |          any |  66.350 dB |       -40 dB |  76.526 dB |   Pass ✅    |
| Open-loop Voltage Gain | ngspice              | result               |          100 dB |  65.712 dB |       125 dB |  70.088 dB |       125 dB |  71.962 dB |   Fail ❌    |
| Gain-Bandwidth       | ngspice              | result               |           0 MHz |  3.240 MHz |        4 MHz |  4.222 MHz |        4 MHz |  5.485 MHz |   Pass ✅    |
| Phase Margin         | ngspice              | result               |           100 ° |   62.004 ° |        160 ° |   66.255 ° |          any |   70.005 ° |   Fail ❌    |
| Gain Margin          | ngspice              | result               |             any |  13.019 dB |      -100 dB |  14.127 dB |          any |  15.321 dB |   Pass ✅    |
| Idd                  | ngspice              | result               |             any | 165.083 µA |       170 µA | 165.083 µA |       250 µA | 165.083 µA |   Pass ✅    |
| Idd (dynamic)        | ngspice              | result               |             any | 165.080 µA |        40 µA | 165.080 µA |      6500 µA | 165.080 µA |   Pass ✅    |
| Equivalent Output Noise Voltage from 1 Hz to 10 MHz | ngspice              | result               |             any | 175.403 uV |       280 uV | 235.246 uV |          any | 307.724 uV |   Pass ✅    |
| PSRR at given frequency | ngspice              | result               |           35 dB |  38.470 dB |        40 dB |  40.145 dB |          any |  43.773 dB |   Pass ✅    |
| Small signal overshoot | ngspice              | result               |             any |   1.004 \% |         1 \% |   1.006 \% |         2 \% |   1.009 \% |   Pass ✅    |
| Slew rate            | ngspice              | result               |               2 |    1.23074 |            3 |     3.8526 |            ​ |    4.81058 |   Fail ❌    |


## Plots
