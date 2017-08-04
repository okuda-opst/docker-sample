FROM amazonlinux:latest

# Install dependencies
RUN yum update -y
RUN yum remove -y remove httpd php*
RUN yum install -y git curl httpd24 httpd24-tools php71

# Install app

# Configure apache
RUN echo "hello,world"
ENV APACHE_LOG_DIR /var/log/httpd

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D",  "FOREGROUND"]
