
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

First run
---------

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

Or all of this commands at once:

.. code-block:: bash

        $ bash ./init_pootle.sh

.. code-block:: bash

        # Create & verify superuser
        $ docker-compose run pootle pootle createsuperuser
        $ docker-compose run pootle pootle verify_user <username>

        # Restart the pootle and rqworker services
        $ docker-compose restart pootle rqworker

For more information please refer to official `Pootle documentation
<http://docs.translatehouse.org/projects/pootle/en/latest/>`_.


docker-compose.yml
==================

* `PostgreSQL <https://www.postgresql.org/>`_ as database backend

* `Elasticsearch <https://www.elastic.co/products/elasticsearch>`_ for `TMs
  <http://docs.translatehouse.org/projects/pootle/en/latest/features/translation_memory.html#elasticsearch-based-tms>`_

* `Redis <http://redis.io/>`_ for async job queue and as a cache backend

* `NGINX <https://nginx.org/>`_ as a frontend server. Serves static, media files and act as a proxy to pootle.

* `uwsgi  <https://uwsgi-docs.readthedocs.io/en/latest/>`_ to run pootle wsgi app.


License
=======

BSD License
