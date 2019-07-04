FROM python:3.6

EXPOSE 8888

COPY notebooks /notebooks
COPY requirements.txt /
RUN pip install -r requirements.txt

WORKDIR /notebooks

CMD /usr/local/bin/jupyter notebook --no-browser --ip 0.0.0.0 --allow-root --NotebookApp.token="$PASSWORD"
