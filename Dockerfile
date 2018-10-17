FROM rocker/tidyverse:latest

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  python3-pip libpython3-dev \
  && pip3 install --upgrade pip virtualenv \
  && install2.r --error keras reticulate \
  && r -e "keras::install_keras(tensorflow = 'gpu')" \
  && echo "RETICULATE_PYTHON=$(which python3)" >> ~/.Renviron 
