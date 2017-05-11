FROM ubuntu
RUN apt-get update
RUN apt-get -y install nginx php php-fpm unzip curl wget php7.0-zip php7.0-xml php7.0-curl php7.0-gd php7.0-mysql
RUN mkdir /opt/eqdkp-files
RUN cd /opt/eqdkp-files; wget https://github.com/EQdkpPlus/core/archive/2.2.14.zip
RUN cd /opt/eqdkp-files; mkdir extract; unzip 2.2.14.zip -d extract; mv extract/* . ; rm -fr extract
RUN chown -R www-data:www-data /opt/eq*
ADD eqdkp.conf /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/eqdkp.conf /etc/nginx/sites-enabled/eqdkp.conf
RUN rm /etc/nginx/sites-enabled/default
RUN mkdir /run/php
ADD init.sh /usr/local/bin
RUN chmod +x /usr/local/bin/init.sh
CMD ["/usr/local/bin/init.sh"]
