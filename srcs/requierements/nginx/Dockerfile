FROM alpine:3.14

RUN apk update  && apk add wget && apk add --no-cache\
	nginx 		\
	vim 	 	\
	curl 		\
	openssl		
	
RUN mkdir -p /etc/nginx/ssl && \
	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Angouleme/O=42/OU=42/CN=nminotte.42.fr/UID=nminotte" && \
	mkdir -p /var/run/nginx /var/www/html  

COPY /conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html 

EXPOSE  443

RUN sudo chown -R nminotte:nminotte /var/www && \
	chown -R nminotte:nminotte /var/www/html &&\
	chown -R nminotte:nminotte /etc/nginx/nginx.conf

CMD [ "nginx", "-g", "daemon off;" ]
