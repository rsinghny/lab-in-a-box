#!/bin/sh
/sigsci-agent &
echo "Starting Gunicorn(httpbin) on port ${PORT}"
exec gunicorn --bind 0.0.0.0:${PORT} httpbin:app