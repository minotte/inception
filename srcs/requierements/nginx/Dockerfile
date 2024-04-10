FROM alpine:3.18

RUN apk update  && apk add wget && apk add --no-cache\
	nginx 		\
	vim 	 	\
	curl 		\
	openssl		
	
RUN mkdir -p /etc/nginx/ssl && \
	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Angouleme/O=42/OU=42/CN=nminotte.42.fr/UID=nminotte" && \
	mkdir -p /var/run/nginx /var/www/html  

COPY /conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 775 /var/www/html 

RUN chown -R nginx:nginx /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]
