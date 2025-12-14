#!/bin/sh
# Railway startup script for PHP application
PORT=${PORT:-8080}
exec php -S 0.0.0.0:$PORT -t public

