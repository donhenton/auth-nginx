# Nginx With Authorization module
Dockerfile for nginx with auth-request-module and http-ssl module compiled in. Stolen from https://hub.docker.com/r/h3nrik/nginx-ldap/ and https://hub.docker.com/r/codeshrew/nginx-auth-proxy/.

### Sample usage:
```bash
  docker  run --name=test  -p 7777:80 -v /Users/dhenton/bin/nginx-conf/nginx.conf:/etc/nginx/nginx.conf:ro \
  -v /Users/dhenton/FE-projects/css-sandbox/droptest:/usr/share/nginx/html:ro \
  -v /Users/dhenton/nginx/logs:/var/log/nginx  --rm  auth-nginx \
```

### Compile options
> The compile options include the auth-request module, which can be used for authorization interception and SSO like things
> "--with-debug" option will allow auth request matching debug information which can be activated with the debug entry on the error_log line in the conf file. 


### More Information
> See http://donhenton.com/wiki/tiki-index.php?page=Docker+on+the+Mac.