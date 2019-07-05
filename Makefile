.DEFAULT_GOAL := help

define BROWSER_PYSCRIPT
import os, webbrowser, sys

try:
	from urllib import pathname2url
except:
	from urllib.request import pathname2url

webbrowser.open("file://" + pathname2url(os.path.abspath(sys.argv[1])))
endef
export BROWSER_PYSCRIPT

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT

BROWSER := python -c "$$BROWSER_PYSCRIPT"

.PHONY: help
help:
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)


# CLEAN TARGETS

.PHONY: clean-build
clean-build: ## remove build artifacts
	rm -fr build/
	rm -fr dist/
	rm -fr .eggs/
	find . -name '*.egg-info' -exec rm -fr {} +
	find . -name '*.egg' -exec rm -f {} +

.PHONY: clean-pyc
clean-pyc: ## remove Python file artifacts
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

.PHONY: clean
clean: clean-build clean-pyc ## remove all build and Python artifacts


# INSTALL TARGETS

.PHONY: install
install: clean-build clean-pyc ## install the package to the active Python's site-packages
	pip install -r requirements.txt


# DOCKER TARGETS

.PHONY: docker-clean
docker-clean: ## Remove the mlbazaar-demos docker image
	docker rmi -f mlbazaar/demos

.PHONY: docker-build
docker-build: docker-clean ## Build the mlbazaar/demos docker image using repo2docker
	docker build -t mlbazaar/demos .

.PHONY: docker-push
docker-build: docker-build ## Build the mlbazaar/demos docker image using repo2docker
	docker push mlbazaar/demos

.PHONY: docker-save
docker-save: docker-build  ## Build the mlbazaar/demos image and save it as mlbazaar-demos.tar
	docker save --output mlbazaar-demos.tar mlbazaar/demos

.PHONY: docker-load
docker-load: ## Load the mlbazaar/demos image from mlbazaar-demos.tar
	docker load --input mlbazaar-demos.tar

.PHONY: docker-run
docker-run: ## Run the mlbazaar/demos image in editable mode
	docker run --rm -v $(shell pwd):/mlbazaar -ti -p8888:8888 --name mlbazaar-demos mlbazaar/demos
