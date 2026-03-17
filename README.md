# CRAN-Style Repository for R Package

#### By David B. Dahl

This is a CRAN-style repository for R packages by
[David B. Dahl](https://dahl.byu.edu)
([Brigham Young University](https://www.byu.edu)) and collaborators.

This often contains development versions of packages that are not yet widely
distributed on, say, [CRAN](https://cran.r-project.org) or [R-universe](https://r-universe.dev).

## Package Installation

To install the latest version of a particular package, e.g. 'salso', run the following
in R:

```R
install.packages("salso", repos=c("https://dahl.byu.edu/r", "https://dbdahl.r-universe.dev", "https://cloud.r-project.org"))
```

## Check Package Version

To check the version of a particular package (e.g., 'salso') that
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
options(
  repos = c(
    dahl1 = "https://dahl.byu.edu/r",
    dahl2 = "https://dbdahl.r-universe.dev",
    CRAN = "https://cloud.r-project.org"
  )
)
```

Save your changes to your `.Rprofile` file and they will take effect for new R
sessions.  Then you can now simply run, e.g.:

```R
install.packages("salso")
```

