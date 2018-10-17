FROM rocker/tidyverse:latest

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  python3-pip libpython3-dev \
  && pip3 install --upgrade pip virtualenv \
  && RETICULATE_PYTHON=/usr/bin/python3 install2.r --error keras reticulate \
  && RETICULATE_PYTHON=/usr/bin/python3 r -e "keras::install_keras(tensorflow = 'gpu')"
