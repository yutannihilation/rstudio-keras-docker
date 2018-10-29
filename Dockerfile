FROM nvidia/cuda:9.0-runtime-ubuntu16.04

RUN echo "deb https://cloud.r-project.org/bin/linux/ubuntu xenial-cran35/" >> /etc/apt/sources.list.d/r.list \
  && echo "deb http://ppa.launchpad.net/marutter/c2d4u/ubuntu xenial main" >> /etc/apt/sources.list.d/r.list \
  && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 \
  && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C9A7585B49D51698710F3A115E25F516B04C661B \
  && apt-get update -qq \
  && apt-get -y --no-install-recommends install \
    r-base-dev \
    r-cran-tidyverse \
    r-cran-keras \
    gdebi-core \
  && wget https://download2.rstudio.org/rstudio-server-1.1.456-amd64.deb \
  && gdebi rstudio-server-1.1.456-amd64.deb \
  && rm rstudio-server-1.1.456-amd64.deb
