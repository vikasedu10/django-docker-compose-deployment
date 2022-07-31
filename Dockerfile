FROM python:3.9.13-alpine3.16
LABEL maintainer="vikasedu10@gmail.com"

ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY ./requirements.txt requirements.txt
COPY ./app /app

EXPOSE 8000

RUN python3 -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r requirements.txt && \
    adduser --disabled-password --no-create-home app

ENV PATH="/py/bin:$PATH"

USER app
