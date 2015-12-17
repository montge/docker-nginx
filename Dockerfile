FROM montge/centos-java8

RUN yum install -y epel-release

RUN yum update && \
    yum install -y nginx && \
    yum clean all

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/var/cache/nginx"]

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
