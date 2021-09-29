FROM python:3.8-slim-buster

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

WORKDIR /server

RUN apt-get -y update && \
    apt-get install software-properties-common -y && \
    add-apt-repository ppa:george-edison55/cmake-3.x -y && \
    apt-get install cmake build-essential curl libcurl4-openssl-dev libssl-dev uuid-dev python3-pip -y

COPY . .

RUN pip install -r gateway/requirements.txt

CMD [ "python", "/server/gateway/azure.py" ]
