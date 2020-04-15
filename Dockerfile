# Sample Dockerfile
# Format: 
# INSTRUCTION argument

FROM rhel7.3

# simple metadata
LABEL description="This is a custom httpd container image"

MAINTAINER Jeffrey Allen <jeffwayne256@gmail.com>

# Excecuting commands
# Use && when possible because the more commands = more layers
RUN yum install -y httpd && yum clean

#            EXPOSE doesn't actually do anything. It's metadata that
# Important: communicates to the developer which port the application
#            is listening to within the container.
EXPOSE 80 

# Environment variables that will be available to the container
ENV LogLevel "info"

# Able to put remote files into container and also able to untar files
ADD http://someserver.com/filename.pdf /var/www/html 

# Able to grab files from host directory
COPY ./src/ /var/www/html/

# Specify which user 
# reminder: all commands are run sequentially, so the following
#           commands will be ran as apache
USER apache

# Defining an ENTRYPOINT in the Dockerfile creates containers that are executables
# default is /bin/sh -c
ENTRYPOINT ["/usr/sbin/httpd"]

# Can be overwritten when running a container docker run
CMD ["-D", "FOREGROUND"]
