FROM rocker/tidyverse:latest

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  python3-pip libpython3-dev \
  && pip3 install --upgrade pip pipenv \
  && pipenv --three \
  && pipenv install keras tensorflow-gpu \
  && pipenv run install2.r --error keras reticulate \
  && echo "reticulate::use_virtualenv('$(pipenv --venv)')" >> ~/.Rprofile
