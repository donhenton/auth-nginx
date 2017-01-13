# Nginx With Authorization module
Dockerfile for nginx with auth-request-module and http-ssl module compiled in. Stolen from https://hub.docker.com/r/h3nrik/nginx-ldap/ and https://hub.docker.com/r/codeshrew/nginx-auth-proxy/.

### Sample usage:
```bash
  docker  run --name=nginx-container  -p 80:80 
  -v /Users/dhenton/bin/nginx-conf/ngproxy.conf:/etc/nginx/nginx.conf:ro \
  -v /Users/dhenton/FE-projects/css-sandbox/droptest:/usr/local/nginx/html:ro \
  -v /Users/dhenton/nginx/logs:/var/log/nginx  \
  --add-host dockerhost:`ifconfig vboxnet0 | grep 'inet' |awk '{print $2}'` \
  --rm  auth-nginx-debug 
```

### Description of options
The -v options in the sample usage map a drive on the host to a drive expected by the docker container, For example, 
host folder /Users/dhenton/nginx/logs is mapped to /var/log/nginx, which is where the docker container will put its logs.

### Compile options
The compile options include the auth-request module, which can be used for authorization interception and SSO like things
"--with-debug" option will allow auth request matching debug information which can be activated with the debug entry on the error_log line in the conf file. These compile options are located in the docker file around 29. The current file in master does not have this turnd on.


### Docker host
In the above sample usage the add-host flag adds the ip to the container etc/hosts file that will allow access to services on the host, eg a web server.

### Docker file lua
The Dockerfile_lua script compiles the lua module which allows lua scripting for conf files: 
https://docs.apitools.com/blog/2014/07/02/using-environment-variables-in-nginx-conf.html. Sample usage is in the sample conf folder


### More Information
> See http://donhenton.com/wiki/tiki-index.php?page=Docker+on+the+Mac.
