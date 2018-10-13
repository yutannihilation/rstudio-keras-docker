FROM rocker/tidyverse:latest

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  python3-pip python3-virtualenv \
  && pip3 install --upgrade pip \
  && install2.r --error keras \
  && r -e "keras::install_keras()"
