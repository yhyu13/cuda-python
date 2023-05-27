
FROM nvidia/cuda:12.1.0-devel-ubuntu22.04

# yhyu13 add host local proxy server
ENV http_proxy http://127.0.0.1:8889
ENV https_proxy=http://127.0.0.1:8889

ENV CUDA_HOME=/usr/local/cuda

RUN apt-get update && \
    apt-get install --no-install-recommends -y build-essential python3.10-dev python3.10-venv && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /build
WORKDIR /build
COPY . /build

RUN python3 -m venv /build/venv

RUN . /build/venv/bin/activate && \
    pip3 install --upgrade pip setuptools && \
    pip3 install -r requirements.txt

RUN . /build/venv/bin/activate && \
    pip3 install wheel && \
    python3 setup.py bdist_wheel -d .

RUN mkdir /result && cp /build/*whl /result

CMD echo "we are done!"