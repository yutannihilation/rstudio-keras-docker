FROM rocker/tidyverse:latest

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  python3-pip \
  && pip3 install --upgrade pip virtualenv \
  && install2.r --error keras \
  && r -e "keras::install_keras()"
