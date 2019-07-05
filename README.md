<p align="left">
<img width=25% src="https://dai.lids.mit.edu/wp-content/uploads/2018/06/Logo_DAI_highres.png" alt=“DAI-Lab” />
<i>An open source project from Data to AI Lab at MIT.</i>
</p>


# MLPrimitives Demos

Jupyter Notebooks and Demos that to get started with [MLPrimitives](https://github.com/HDI-Project/MLPrimitives)

- Free software: MIT license
- Documentation: https://HDI-Project.github.io/MLPrimitives

# Overview

This repository contains a collection of Jupyter Notebooks and Demos that will help you
get started with [MLPrimitives](https://github.com/HDI-Project/MLPrimitives).

The collection of notebooks is also available as a docker image in dockerhub.

# Installation

The recommended way to run these demos is using [mlprimitives/juypter](https://cloud.docker.com/repository/docker/mlprimitives/jupyter)
image available on https://hub.docker.com

## Requirements

In order to run our docker image, the only requirement is to have [Docker](https://www.docker.com) installed
in your system.

Installation instructions for any possible system compatible can be found [here](https://docs.docker.com/install/)

## Running the Docker Image

Once you have docker installed, all you need to execute to run the image is:

```bash
docker --rm -ti -p8888:8888 mlprimitives/jupyter
```

Afterwards, you simply need to point your browser at http://127.0.0.1:8888 and start running the notebooks!


# Running the demos locally

If you do not have Docker available, you can run the MLPrimitives demos locally.

## Requirements

The MLPrimitives demos have been developed and tested on [Python 3.6](https://www.python.org/downloads/)
using the dependencies listed inside the [requirements.txt](requirements.txt) file.

Also, although it is not strictly required, the usage of a
[virtualenv](https://virtualenv.pypa.io/en/latest/) is highly recommended in order to avoid
interfering with other software installed in the system where the demos are run.

## Setup

In order to run the demos, you will need to do the following steps:

1. Clone the repository
2. Create and activate a virtualenv using python3.6
3. Install the dependencies from the [requirements.txt](requirements.txt) file.


```bash
git clone https://github.com/csala/mlprimitives-demos.git
cd mlprimitives-demos
pip install virtualenv
virtualenv -p $(which python3.6) venv
source mlprimitives-demos-venv/bin/activate
pip install -r requirements.txt
```

## Running the notebook

Once everything is installed, you can start the jypter server with the following commands.

```bash
source mlprimitives-demos-venv/bin/activate
jupyter notebook
```


# What's Next?

Do you want to [learn more about the project](https://hdi-project.github.io/MLPrimitives/getting_started/concepts.html),
about [how to contribute to it](https://hdi-project.github.io/MLPrimitives/community/contributing.html)
or browse the [API Reference](https://hdi-project.github.io/MLPrimitives/api/mlprimitives.html)?
Please check the corresponding sections of the [MLPrimitives documentation](https://hdi-project.github.io/MLPrimitives/)!
