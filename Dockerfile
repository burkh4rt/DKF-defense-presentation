FROM docker.pkg.github.com/burkh4rt/docker-test/texlive2018:dissertation
MAINTAINER burkh4rt

RUN tlmgr install pstricks \
                  aobs-tikz \
                  tikz-bayesnet \
 && tlmgr backup --clean --all \
 && fmtutil-sys --all
