/cp -r .*\.ci_support/d
s|/home/conda/staged-recipes|${WORKSPACE}|g
s|~/conda-|${WORKSPACE}/conda-|g
s|~/.ci_su|${WORKSPACE}/.ci_su|g
