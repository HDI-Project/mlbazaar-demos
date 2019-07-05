FROM python:3.6

EXPOSE 8888

RUN mkdir /mlbazaar
COPY notebooks /mlbazaar/notebooks
COPY requirements.txt /mlbazaar/
RUN pip install -r /mlbazaar/requirements.txt

WORKDIR /mlbazaar

CMD /usr/local/bin/jupyter notebook --no-browser --ip 0.0.0.0 --allow-root --NotebookApp.token="$PASSWORD"
