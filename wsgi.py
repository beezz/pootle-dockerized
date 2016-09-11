# -*- coding: utf-8 -*-
import os
import site
from django.core.wsgi import get_wsgi_application

import pootle.apps
site.addsitedir(os.path.dirname(pootle.apps.__file__))

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "pootle.settings")
application = get_wsgi_application()
