FROM python:3.7.12
RUN git clone --branch docker/setup-tensorflow-lite https://github.com/Kyzyl-ool/ova-server.git

WORKDIR ova-server
RUN git checkout -b docker/setup-tensorflow-lite
RUN make setup-tensorflow-lite
ENV PATH="/ova-server/.venv/bin:$PATH"
RUN ./cli.py download --model=yolov4 --framework=tensorflow_lite --hardware=cpu

RUN pip install -U flask-cors

CMD make run

EXPOSE 8000