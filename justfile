render:
  marky README.md
  mv README.html index.html

insert pkg_filename:
  Rscript -e 'drat::insertPackage("{{pkg_filename}}", repodir=".", action="archive")'

deploy:
  rsync -av --delete index.html src bin dahl.byu.edu:docs/devel/website-professional/html/rpkgbuilder/
  
