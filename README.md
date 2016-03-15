# Nginx With Authorization module
Dockerfile for nginx with auth-request-module and http-ssl module compiled in. Stolen from https://hub.docker.com/r/h3nrik/nginx-ldap/ and https://hub.docker.com/r/codeshrew/nginx-auth-proxy/.

### Sample usage:
```bash
  docker  run --name=test  -p 80:80 -v /Users/dhenton/bin/nginx-conf/ngproxy.conf:/etc/nginx/nginx.conf:ro -v \
  /Users/dhenton/FE-projects/css-sandbox/droptest:/usr/local/nginx/html:ro -v /Users/dhenton/nginx/logs:/var/log/nginx  \
  --add-host dockerhost:`ifconfig vboxnet0 | grep 'inet' |awk '{print $2}'` \
  --rm  auth-nginx-debug 
```

### Compile options
> The compile options include the auth-request module, which can be used for authorization interception and SSO like things
> "--with-debug" option will allow auth request matching debug information which can be activated with the debug entry on the error_log line in the conf file. 


### Docker host
In the above configuration the add-host flag adds the ip to the container etc/hosts file that will allow access to services on the host, eg a web server.



### More Information
> See http://donhenton.com/wiki/tiki-index.php?page=Docker+on+the+Mac.
