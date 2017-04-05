FROM python:2

RUN apt-get update -y \
 && apt-get install -y \
    build-essential \
    libxml2-dev \
    libxslt-dev \
    zlib1g-dev \
    locales \
 && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8
RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8 || echo ok
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN useradd -u 1000 -ms /bin/bash pootle

RUN mkdir -p /var/www/pootle && chown -R pootle /var/www/pootle

USER pootle

RUN pip install -U virtualenv pip --user
RUN pip install psycopg2 uwsgi --user
RUN pip install --user --pre --process-dependency-links --upgrade Pootle

ENV PATH "/home/pootle/.local/bin:$PATH"

WORKDIR /home/pootle
# ENTRYPOINT ["pootle"]
