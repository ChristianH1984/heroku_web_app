FROM python:3.6.5-slim

COPY requirements.txt /tmp/requirements.txt
COPY ./app /app/

RUN pip install --upgrade pip
RUN pip install -qr /tmp/requirements.txt

WORKDIR /app

CMD gunicorn --bind 0.0.0.0:$PORT wsgi
