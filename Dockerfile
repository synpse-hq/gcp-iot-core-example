FROM python:3

WORKDIR /server

RUN apt-get -y update && \
    apt-get install software-properties-common -y && \
    add-apt-repository ppa:george-edison55/cmake-3.x -y && \
    apt-get install cmake build-essential curl libcurl4-openssl-dev libssl-dev uuid-dev python3-pip -y

COPY . .

RUN pip3 install -r gateway/requirements.txt


ENTRYPOINT [ "python3" ]
CMD [ "/server/gateway/azure.py" ]
