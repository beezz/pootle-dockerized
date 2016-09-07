
=================
Pootle dockerized
=================

Ready to use `docker-compose <https://docs.docker.com/compose/>`_ for `Pootle
<https://github.com/translate/pootle>`_ translation server.


Usage
=====

.. code-block:: bash

        # Clone this repo & move to it
        $ git clone https://github.com/beezz/pootle-dockerized && cd pootle-dockerized
        # Run it in background
        $ docker-compose up -d

First run
---------

.. code-block:: bash

        # Initiate database
        $ docker-compose run pootle migrate
        # This takes a while as it will create the default projects and stores.
        $ docker-compose run pootle initdb
        # Create & verify superuser
        $ docker-compose run pootle createsuperuser
        $ docker-compose run pootle verify_user <username>
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


License
=======

BSD License
