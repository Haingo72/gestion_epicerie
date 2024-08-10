FROM ubuntu:latest
LABEL authors="Haingo"

FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt /app/

RUN pip install -r requirements.txt
RUN pip install gunicorn

COPY . /app/
COPY .venv /app/

ENV PYTHONUNBUFFERED 1

EXPOSE 8000

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "gestion.wsgi:application"]
