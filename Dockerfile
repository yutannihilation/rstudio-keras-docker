FROM rocker/tidyverse:latest

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  python3-pip libpython3-dev \
  && pip3 install --upgrade pip virtualenv \
  && echo "RETICULATE_PYTHON=/usr/bin/python3" | tee -a /home/rstudio/.Renviron \
  && install2.r --error keras reticulate \
  && r -e "reticulate::use_python('/usr/bin/python3'); keras::install_keras(tensorflow = 'gpu')"
