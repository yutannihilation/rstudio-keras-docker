FROM rocker/tidyverse:latest

RUN mkdir /home/rstudio/keras
WORKDIR /home/rstudio/keras

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  python3-pip python3-venv libpython3-dev \
  && python3 -m venv /home/rstudio/keras
  && cd /home/rstudio/keras \
  && bin/activate \
  && pip3 install --upgrade pip keras tensorflow-gpu \
  && install2.r --error keras reticulate
  #&& echo "reticulate::use_virtualenv('$(pipenv --venv)')" >> ~/.Rprofile
