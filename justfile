help:
  #!/usr/bin/env sh
  echo
  echo "Workflow:"
  echo "  1. Run the command: just insert SRC_PACKAGE_FILENAME"
  echo "  2. Commit a source package to the src/contrib folder."
  echo "  3. Download the Windows and macOS assets from https://github.com/dbdahl/rpkgbuilder/actions"
  echo "  4. Unzip the downloads to exposure the binary R packages."
  echo "  5. For each binary R package, run the command: just insert BIN_PACKAGE_FILENAME"
  echo "  6. To deploy to https://dahl.byu.edu/r, run the command: just deploy"
  echo
  echo "Note: If this GitHub repository gets too big, just start a new one (with the same name)."
  echo "      A lot of the magic happens in the .github/workflows/build-r-binaries.yml file."
  echo

render:
  marky --theme sakura-dark README.md
  mv README.html index.html

insert pkg_filename:
  Rscript -e 'drat::insertPackage("{{pkg_filename}}", repodir=".", action="archive")'

deploy:
  rsync -av --delete index.html src bin dahl.byu.edu:docs/devel/website-professional/html/rpkgbuilder/
  
