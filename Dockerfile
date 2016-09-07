FROM python:2

RUN apt-get update -y \
 && apt-get install -y \
    build-essential \
    libxml2-dev \
    libxslt-dev \
    zlib1g-dev \
 && rm -rf /var/lib/apt/lists/*

RUN pip install -U virtualenv pip
RUN pip install psycopg2
RUN pip install --pre Pootle
ENTRYPOINT ["pootle"]
