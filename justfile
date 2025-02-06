render:
  marky README.md
  mv README.html index.html

insert pkg_filename:
  Rscript -e 'drat::insertPackage("{{pkg_filename}}", repodir=".", action="archive")'
