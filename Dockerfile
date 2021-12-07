# 1) choose base container
# generally use the most recent tag

# base notebook, contains Jupyter and relevant tools
ARG BASE_CONTAINER=ucsdets/datascience-notebook:2021.2-stable

# data science notebook
# https://hub.docker.com/repository/docker/ucsdets/datascience-notebook/tags
# ARG BASE_CONTAINER=ucsdets/datascience-notebook:2021.2-stable

# scipy/machine learning (tensorflow, pytorch)
# https://hub.docker.com/repository/docker/ucsdets/scipy-ml-notebook/tags
# ARG BASE_CONTAINER=ucsdets/scipy-ml-notebook:2021.3-42158c8

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# 2) change to root to install packages
USER root

RUN apt-get -y install gzip

# 3) install packages using notebook user
USER jovyan

# RUN conda install -y scikit-learn

RUN pip install twarc
RUN pip install datetime
RUN pip install pandas
RUN pip install numpy
RUN pip install wget
RUN pip install ipywidgets
RUN pip install jsonlines
RUN pip install matplotlib
RUN pip install urlextract
RUN pip install requests





# Override command to disable running jupyter notebook at launch
# CMD ["/bin/bash"]
