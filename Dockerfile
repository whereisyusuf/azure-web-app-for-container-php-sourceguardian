 #Take the ubuntu base image
FROM ubuntu:16.04  

#Install apache and php

RUN apt-get update
RUN apt-get install apache2 -y
RUN apt-get install php libapache2-mod-php -y

#Copy all the files that are created for the project. 
ADD www /var/www/site
ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

#Copy the loader files from the ext folder to the lib folder

ADD ext/ixed.7.0.lin /usr/lib/php/20151012/ixed.7.0.lin

# modify php.ini to include the directive for the sourceguardian extension
RUN   echo "extension=ixed.7.0.lin" >> /etc/php/7.0/apache2/php.ini

# Expose apache.

EXPOSE 80

CMD /usr/sbin/apache2ctl -D FOREGROUND

