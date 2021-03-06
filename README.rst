
=================
Pootle dockerized
=================

Ready-to-use `docker-compose <https://docs.docker.com/compose/>`_ for `Pootle
<https://github.com/translate/pootle>`_ translation server.


Usage
=====

.. code-block:: bash

        # Clone this repo & move to it
        $ git clone https://github.com/beezz/pootle-dockerized && cd pootle-dockerized

        # Run pootle and all supporting services in background
        $ docker-compose up -d


To get url of your running `Pootle
<http://docs.translatehouse.org/projects/pootle/en/latest/>`_
use ``get_pootle_url.sh`` helper script or `docker inspect`:


.. code-block:: bash

        $ bash ./get_pootle_url.sh
        Your Pootle isntance is running at http://172.21.0.7


Or:


.. code-block:: bash

        $ NETWORK=$(docker network ls | awk '$2~/pootle/{print $2}')
        $ NAME=$(docker ps --filter name=pootle_nginx --format {{.Names}})
        $ docker inspect --format "{{ .NetworkSettings.Networks.${NETWORK}.IPAddress }}" ${NAME}
        172.21.0.7


First run
---------

Initiate database and build static assets for nginx:

.. code-block:: bash

        # Initiate database
        # Nope it's not err `pootle pootle`
        # - name of service in docker-compose
        # - executable named pootle
        $ docker-compose run pootle pootle migrate

        # This takes a while as it will create the default projects and stores.
        $ docker-compose run pootle pootle initdb

        # Collect and build assets
        $ docker-compose run pootle pootle collectstatic --clear --noinput
        $ docker-compose run pootle pootle assets build

Or all of the initialization commands at once:

.. code-block:: bash

        $ bash ./init_pootle.sh


As a next step you need to create superuser:

.. code-block:: bash

        # Create & verify superuser
        $ docker-compose run pootle pootle createsuperuser
        $ docker-compose run pootle pootle verify_user <username>


Restart pootle and rqworker:

.. code-block:: bash

        # Restart the pootle and rqworker services
        $ docker-compose restart pootle rqworker

For more information please refer to official `Pootle documentation
<http://docs.translatehouse.org/projects/pootle/en/latest/>`_.


docker-compose.yml
==================

* `PostgreSQL <https://www.postgresql.org/>`_ as database backend,

* `Elasticsearch <https://www.elastic.co/products/elasticsearch>`_ for `TMs
  <http://docs.translatehouse.org/projects/pootle/en/latest/features/translation_memory.html#elasticsearch-based-tms>`_,

* `Redis <http://redis.io/>`_ for async job queue and as a cache backend,

* `NGINX <https://nginx.org/>`_ as a frontend server. Serves static, media files and act as a proxy to pootle,

* `uwsgi  <https://uwsgi-docs.readthedocs.io/en/latest/>`_ to run pootle wsgi app.


License
=======

BSD License
