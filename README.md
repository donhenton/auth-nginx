# Nginx With Authorization module
Dockerfile for nginx with auth-request-module and http-ssl module compiled in. Stolen from https://hub.docker.com/r/h3nrik/nginx-ldap/ and https://hub.docker.com/r/codeshrew/nginx-auth-proxy/.

### Sample usage:
```bash
  docker  run --name=test  -p 7777:80 -v /Users/dhenton/bin/nginx-conf/nginx.conf:/etc/nginx/nginx.conf:ro \
  -v /Users/dhenton/FE-projects/css-sandbox/droptest:/usr/share/nginx/html:ro \
  -v /Users/dhenton/nginx/logs:/var/log/nginx  --rm  auth-nginx \



