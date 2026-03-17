list:
    @gh run list -R dbdahl/rpkgbuilder --workflow build-r-binaries.yml --limit 10

windows: (_binaries "bin/windows/contrib/*/PACKAGES")

macos: (_binaries "bin/macosx/big-sur-arm64/contrib/*/PACKAGES")

remove package:
    rm -f src/contrib/{{package}}_*.tar.gz
    rm -f bin/windows/contrib/*/{{package}}_*.zip
    rm -f bin/macosx/big-sur-arm64/contrib/*/{{package}}_*.tgz
    rm -rf src/contrib/Archive/{{package}}
    rm -rf bin/windows/contrib/*/Archive/{{package}}
    rm -rf bin/macosx/big-sur-arm64/contrib/*/Archive/{{package}}
    Rscript -e 'drat::updateRepo(".", type = "source")'
    Rscript -e 'drat::updateRepo(".", type = "win.binary", version = NA)'
    Rscript -e 'drat::updateRepo(".", type = "mac.binary.big-sur-arm64", version = NA)'

sources:
    #!/usr/bin/env Rscript
    x <- read.dcf("src/contrib/PACKAGES")
    o <- order(x[, "Package"])
    write.table(
      x[o, c("Package", "Version"), drop = FALSE],
      row.names = FALSE,
      col.names = TRUE,
      quote = FALSE
    )

_binaries glob:
    #!/usr/bin/env Rscript
    paths <- Sys.glob("{{glob}}")
    if (!length(paths)) {
      quit(save = "no")
    }
    rows <- lapply(paths, function(path) {
      x <- read.dcf(path)
      data.frame(
        R = sub(".*/contrib/([^/]+)/PACKAGES$", "\\1", path),
        Package = x[, "Package"],
        Version = x[, "Version"],
        row.names = NULL,
        check.names = FALSE
      )
    })
    out <- do.call(rbind, rows)
    o <- order(out$R, out$Package)
    write.table(out[o, , drop = FALSE], row.names = FALSE, col.names = TRUE, quote = FALSE)

