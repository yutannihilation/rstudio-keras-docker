FROM rocker/tidyverse:latest

RUN install2.r --error keras \
  && r -e "keras::install_keras()"
