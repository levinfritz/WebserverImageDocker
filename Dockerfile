# Basis-Image mit Apache
FROM httpd:latest

# Arbeitsverzeichnis setzen
WORKDIR /usr/local/apache2/htdocs/

# Statische Webseite in den Container kopieren
COPY ./website /usr/local/apache2/htdocs/

# Exponiere Port 8080
EXPOSE 8080

# Apache starten
CMD ["httpd", "-D", "FOREGROUND"]
