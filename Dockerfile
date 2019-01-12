FROM python:3.6.5-slim

RUN apt-get update -y
RUN apt-get install build-essential -y

COPY requirements.txt /tmp/requirements.txt
COPY ./app /app/
COPY ./test /test/

COPY docker-entrypoint.sh app/docker-entrypoint.sh
COPY Makefile app/Makefile

RUN pip install --upgrade pip
RUN pip install -qr /tmp/requirements.txt

WORKDIR /app

#CMD gunicorn --bind 0.0.0.0:$PORT wsgi
ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["run"]