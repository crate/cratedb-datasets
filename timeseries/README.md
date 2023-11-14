# Included files


## timeseries

### nab-machine-failure.csv

The file [nab-machine-failure.csv] includes temperature sensor data of an internal
component of a large, industrial machine. The first anomaly is a planned shutdown of the machine.
The second anomaly is difficult to detect and directly led to the third anomaly, a catastrophic
failure of the machine.

* Source: [NAB Data Corpus]
* Description: "realKnownCause" dataset, including data with known anomaly causes; no hand labeling.
* Original file: `machine_temperature_system_failure.csv`
* License: AGPL-3.0
* Uncompressed size: 715 KB
* Number of files: 1
* Number of rows: 22695
* Sample:
  ```
  timestamp,value
  2013-12-02 21:15:00,73.96732207
  2013-12-02 21:20:00,74.93588199999998
  2013-12-02 21:25:00,76.12416182
  ```


[NAB Data Corpus]: https://github.com/numenta/NAB/tree/master/data
[nab-machine-failure.csv]: https://github.com/crate/cratedb-datasets/blob/main/timeseries/nab-machine-failure.csv
