FROM python:latest

RUN mkdir /build
WORKDIR /build

COPY * /build

COPY requirements.txt /build

RUN pip install -r requirements.txt

CMD ["python", "app.py"]