# syntax=docker/dockerfile:1

FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y -q \
    gcc \
    sqlite3 \
    libsqlite3-dev \
    python3 \
    python3-pip \
    python3-venv # Add this line


WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

ENV MELTANO_DATABASE_URI=postgresql://<user>:<password>@<host>:<port>/<db>

ENV MELTANO_UI_SESSION_COOKIE_SECURE=true
ENV MELTANO_UI_FORWARDED_ALLOW_IPS="*"
ENV FORWARDED_ALLOW_IPS="*"

RUN mkdir .meltano/
RUN meltano install

CMD [ "meltano", "ui"]
