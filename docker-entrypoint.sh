#!/bin/bash

if [ "$1" = "test" ]; then
  make tests & make lint
else
  exec gunicorn --bind 0.0.0.0:$PORT wsgi
fi
