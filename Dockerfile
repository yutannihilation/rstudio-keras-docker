FROM rocker/tidyverse:latest

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  python3-pip libpython3-dev \
  && pip3 install --upgrade pip virtualenv \
  && install2.r --error keras reticulate \
  && echo "RETICULATE_PYTHON=$(which python3)" >> /home/rstudio/.Renviron \
  && r -e "reticulate::use_python('$(which python3)'); keras::install_keras(tensorflow = 'gpu')"
