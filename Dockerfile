FROM debian:jessie

MAINTAINER Don Henton

ENV NGINX_VERSION release-1.9.6

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
	&& apt-get update \
	&& apt-get install -y \
		ca-certificates \
		git \
		gcc \
		make \
		libpcre3-dev \
		zlib1g-dev \
		libldap2-dev \
		libssl-dev \
		wget

RUN mkdir /var/log/nginx \
	&& mkdir /etc/nginx \
	&& cd ~ \
	&& git clone https://github.com/nginx/nginx.git \
	&& cd ~/nginx \
	&& git checkout tags/${NGINX_VERSION} \
	&& ./auto/configure \
		--with-http_ssl_module \	
		--with-http_auth_request_module \
		--conf-path=/etc/nginx/nginx.conf \ 
		--sbin-path=/usr/sbin/nginx \ 
		--pid-path=/var/log/nginx/nginx.pid \ 
		--error-log-path=/var/log/nginx/error.log \ 
		--http-log-path=/var/log/nginx/access.log \ 
	&& make install \
	&& cd .. \
	&& rm -rf nginx \
	&& wget -O /tmp/dockerize.tar.gz https://github.com/jwilder/dockerize/releases/download/v0.0.4/dockerize-linux-amd64-v0.0.4.tar.gz \
	&& tar -C /usr/local/bin -xzvf /tmp/dockerize.tar.gz \
	&& rm -rf /tmp/dockerize.tar.gz

EXPOSE 80 443

CMD ["dockerize","-stdout","/var/log/nginx/access.log","-stderr","/var/log/nginx/error.log","/usr/sbin/nginx","-g","daemon off;"]


