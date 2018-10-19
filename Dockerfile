FROM rocker/tidyverse:latest

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libpython3-dev python3-virtualenv \
  && python3 -m virtualenv -p python3 /home/rstudio/keras \
  && cd /home/rstudio/keras \
  && . bin/activate \
  && pip install --upgrade pip keras tensorflow-gpu \
  && rm -rf ~/.cache/pip \
  && install2.r --error keras reticulate \
  && echo "reticulate::use_virtualenv('/home/rstudio/keras')" >> ~/.Rprofile
