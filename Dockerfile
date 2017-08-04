FROM amazonlinux:latest

# file copy
COPY index.html /tmp

# Install dependencies
RUN yum update -y
RUN yum remove -y remove httpd php*
RUN yum install -y git curl httpd24 httpd24-tools php71

# Install app

# Configure apache
RUN echo "hello,world"
ENV APACHE_LOG_DIR /var/log/httpd
RUN  cp /tmp/index.html /var/www/html/

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D",  "FOREGROUND"]
