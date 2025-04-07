FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY app/ .

RUN pip3 install Flask==2.3.2

EXPOSE 5000

CMD ["python3", "run.py"]