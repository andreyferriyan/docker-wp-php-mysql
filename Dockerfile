FROM nginx
ADD ./config/nginx/nginx.conf /etc/nginx/nginx.conf
ADD ./config/nginx/default /etc/nginx/sites-enabled/default
ADD ./config/nginx/fastcgi_params /etc/nginx/fastcgi_params
ADD ./config/nginx/mime.types /etc/nginx/mime.types 
