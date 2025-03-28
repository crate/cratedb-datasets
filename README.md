# cratedb-datasets

**Please consume the datasets at [cratedb-datasets] using HTTP,
or use CrateDB Toolkit's [Datasets API].**

## About

This repository provides easy access to three types of data:

* Tiny datasets provided within this repository.
* Open source datasets hosted on AWS S3.
* Programs to create datasets on demand.

The datasets are used for learning and experimenting,
and to support blog posts and tech talks about CrateDB.


## What's inside

### Embedded datasets

You will find datasets in CSV, JSON and Parquet formats within different
subdirectories. Descriptions about them can be found in corresponding
README files.

### S3 datasets

Crate.io hosts several public datasets in the AWS S3 bucket `crate.sampledata`,
that you can easily query when experimenting with CrateDB.

https://s3.amazonaws.com/crate.sampledata/

## CrateDB Academy datasets

Datasets used in courses at the [CrateDB Academy](https://learn.cratedb.com) can be found in the `academy` subdirectory.

## Developer Relations datasets

Datasets used in developer relations talks, workshops and other projects can be found in the `devrel` subdirectory.

## Contributions

Before adding files to this repository, please make sure to install [Git LFS]
beforehand. On macOS, it works like this:
```shell
brew install git-lfs
git lfs install
```

No special commands are needed other than setting it up once per machine and
configuring the `.gitattributes` file once per repository. Git LFS blends well
into the regular `git add` / `git commit` workflow.

Before adding files, please check the `.gitattributes` file, which lists all the
file types assigned to be handled by Git LFS. If you are adding a file of another
type, make sure it is listed there.



[cratedb-datasets]: https://cdn.crate.io/downloads/datasets/cratedb-datasets/
[Datasets API]: https://cratedb-toolkit.readthedocs.io/datasets.html
[Git LFS]: https://git-lfs.com/
