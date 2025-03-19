FROM ubuntu:22.04

# Install Apache and required tools
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Configure Apache to listen on port 80
RUN sed -i 's/Listen 80/Listen 80/' /etc/apache2/ports.conf

# Enable required Apache modules
RUN a2enmod rewrite

# Create directory for mounted volumes
RUN mkdir -p /var/www/html
RUN mkdir -p /var/log/apache2

# Set working directory
WORKDIR /var/www/html

# Configure Apache to write logs to stdout/stderr
RUN ln -sf /dev/stdout /var/log/apache2/access.log && \
    ln -sf /dev/stderr /var/log/apache2/error.log

# Expose port 80 (will be mapped to 8080)
EXPOSE 80

# Start Apache in foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
