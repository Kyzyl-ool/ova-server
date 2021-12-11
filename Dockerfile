FROM python:3.7.12
RUN git clone https://github.com/openvisionapi/ova-server.git

WORKDIR ova-server

RUN make setup-tensorflow-lite
ENV PATH="/ova-server/.venv/bin:$PATH"
RUN ./cli.py download --model=yolov4 --framework=tensorflow_lite --hardware=cpu
CMD make run

EXPOSE 8000