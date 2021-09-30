FROM ubuntu:bionic

RUN apt update && apt install -y software-properties-common
RUN add-apt-repository universe
RUN add-apt-repository multiverse
RUN apt update
RUN apt upgrade -y
RUN apt -y install libatlas-base-dev 
# RUN apt -y install libatlas-dev
RUN apt -y install libblas-dev
RUN apt -y install liblapack-dev
RUN apt -y install libxslt-dev libxml2-dev gcc g++
RUN apt -y install python3-dev python3-pip python3-numpy python3-scipy
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1
RUN update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1
RUN apt -y install wget
COPY . extractnet
WORKDIR extractnet
RUN pip3 install "cython>=0.21.1" 
# python-utilities
RUN pip3 install -r requirements.txt
RUN make install

# COPY extractnet-test.py extractnet-test.py
# CMD [ "python", "extractnet-test.py" ]
# ENTRYPOINT [ "python", "extractnet-test.py" ]