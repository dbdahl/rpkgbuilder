# CRAN-Style Repository for R Packages

#### By David B. Dahl

This is a CRAN-like repository for R packages maintained by
[David B. Dahl](https://dahl.byu.edu)
([Brigham Young University](https://www.byu.edu)).

It often contains development versions of packages before they are
widely available on [R-universe](https://dbdahl.r-universe.dev) or
[CRAN](https://cran.r-project.org) or

## Install a Package

To install the latest version of a package, for example `salso`, run this in
R:

```r
install.packages(
  "salso",
  repos = c(
    "https://dahl.byu.edu/r",
    "https://dbdahl.r-universe.dev",
    "https://cloud.r-project.org"
  )
)
```

## Check an Installed Version

To check which version of `salso` is installed, run:

```r
packageVersion("salso")
```

## Set These Repositories as Defaults

To avoid specifying the `repos` argument each time, add these repositories to
your user startup file. R looks for `.Rprofile` in the current directory first
and then in your home directory. If you want these settings to apply across
projects, edit the `.Rprofile` in your home directory. In R, open `~/.Rprofile`
for editing:

```r
file.edit("~/.Rprofile")
```

If the file does not already exist, `file.edit()` will create it. Then add:

```r
options(
  repos = c(
    dahl_personal = "https://dahl.byu.edu/r",
    dahl_universe = "https://dbdahl.r-universe.dev",
    CRAN = "https://cloud.r-project.org"
  )
)
```

If you already customize `options("repos")`, merge these entries into your
existing setting instead of replacing it.

These settings take effect in new R sessions. After that, you can simply run:

```r
install.packages("salso")
```
