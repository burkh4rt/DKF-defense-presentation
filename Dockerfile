FROM ubuntu:16.04 AS texlive_2018
MAINTAINER burkh4rt
RUN apt-get update \
 && apt-get install -y wget \
                       perl \
                       make \
                       fontconfig \
 && echo "selected_scheme scheme-minimal" >> texlive.profile \
 && wget ftp://tug.org/historic/systems/texlive/2018/install-tl-unx.tar.gz \
 && tar zxvf install-tl-unx.tar.gz \
 && ./install-tl-*/install-tl -repository ftp://tug.org/historic/systems/texlive/2018/tlnet-final -profile texlive.profile \
 && rm -rf install-tl-* \
 && rm texlive.profile
ENV PATH="/usr/local/texlive/2018/bin/x86_64-linux:${PATH}"
RUN tlmgr install scheme-small \
                  collection-bibtexextra \
                  latexmk \
 && tlmgr backup --clean --all \
 && fmtutil-sys --all
WORKDIR /data
VOLUME /data

FROM texlive_2018
RUN tlmgr install bbm \
                  doublestroke \
                  was \
                  csquotes \
                  hyperxmp \
                  newtx \
                  imakeidx \
                  tabu \
                  epigraph \
                  babel-russian \
                  babel-japanese \
                  tikz-cd \
                  ifmtarg \
                  varwidth \
                  txfonts \
                  cm-super \
                  ec \
                  boondox \
                  babel-greek \
                  greek-fontenc \
                  cm-lgc \
                  hyphen-greek \
                  libgreek \
                  cbfonts \
                  pstricks \
                  aobs-tikz \
                  tikz-bayesnet \
 && tlmgr backup --clean --all \
 && fmtutil-sys --all \
 && apt-get clean
