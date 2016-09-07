
=================
Pootle dockerized
=================

Ready to use `docker-compose <https://docs.docker.com/compose/>`_ for `Pootle
<https://github.com/translate/pootle>`_ translation server.

docker-compose.yml
==================

* `PostgreSQL <https://www.postgresql.org/>`_ as database backend

* `Elasticsearch <https://www.elastic.co/products/elasticsearch>_` for `TMs
  <http://docs.translatehouse.org/projects/pootle/en/latest/features/translation_memory.html#elasticsearch-based-tms>`_

* `Redis <http://redis.io/>`_ for async jobs queue and as a cache backend


Usage
=====

.. code-block:: bash

        # Clone this repo & move to it
        $ git clone https://github.com/beezz/pootle-dockerized && cd pootle-dockerized

.. code-block:: bash

        $ docker-compose up -d

First run
---------

.. code-block:: bash

        # Initiate database
        $ docker-compose run pootle migrate
        # This takes a while as it will create the default projects and stores.
        $ docker-compose run pootle initdb

.. code-block:: bash

        # Create & verify superuser
        $ docker-compose run pootle createsuperuser
        $ docker-compose run pootle verify_user <username>

For more information please refer to official `Pootle documentation
<http://docs.translatehouse.org/projects/pootle/en/latest/>`_.


License
=======

BSD License
