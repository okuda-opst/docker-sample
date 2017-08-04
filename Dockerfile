FROM jenkins

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
RUN cp /tmp/index.html /var/www/html/

EXPOSE 80
EXPOSE 8080
EXPOSE 8088
EXPOSE 50000

CMD ["/usr/sbin/httpd", "-D",  "FOREGROUND"]
#CMD [["/usr/bin/java", "-jar", "/usr/share/jenkins/jenkins.war", "--webroot=/var/cache/jenkins/war", "--httpPort=8080", "--ajp13Port=-1"]]
