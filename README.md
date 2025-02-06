# CRAN-Style Repository for R Package

#### By David B. Dahl (Brigham Young University)

This is a CRAN-style repository for R packages by [David B. Dahl](https://
dahl.byu.edu) and collaborators.

This often contains development versions of packages that are not yet widely
distributed on, say, [CRAN](https://cran.r-project.org).

## Package Installation

To install the latest version of a particular package 'salso', run the following
in R:

```R
install.packages("salso", repos="https://dahl.byu.edu/rrepository")
```

## Check Package Version

To check the version of a particular package (e.g., the 'salso' package) that
you have installed, run the following in R:

```R
packageVersion("salso") 
```

## Avoiding the Need to Specify the `repos` Argument

To avoid the need to specify the `repos` argument, you can automatically add
this repository when R starts up. Edit your `.Rprofile` in your favorite text
edit or run in R:

```R
file.edit("~/.Rprofile")
```

Add the following line to your `.Rprofile` file:

```R
options(repos=c(dahl="https://dahl.byu.edu/rrepository",
                CRAN="https://cloud.r-project.org"))
```

Save your changes to your `.Rprofile` file and they will take effect for new R
sessions.  Then you can now simply run, e.g.:

```R
install.packages("salso")
```

