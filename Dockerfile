FROM centos:7

# install PHP and extension
RUN yum -y update && yum clean all
RUN yum -y install httpd \
                   yum-utils \
                   epel-release \
                   http://rpms.remirepo.net/enterprise/remi-release-7.rpm 
RUN yum-config-manager --enable remi-php70
RUN yum -y install php \ 
    php-fpm \ 
    php-mcrypt \ 
    php-cli \ 
    php-gd \ 
    php-curl \ 
    php-mysql \ 
    php-ldap \ 
    php-zip \ 
    php-fileinfo \
    yum clean all

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]