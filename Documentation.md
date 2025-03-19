# Dokumentation: Webserver-Image mit Apache in Docker

## Einleitung
Dieses Projekt erstellt ein einfaches Docker-Image für einen Apache-Webserver, das eine statische Webseite hostet. Die Daten werden über Volumes gespeichert, sodass sie auch nach dem Entfernen des Containers erhalten bleiben.

## Verwendete Technologien
- **Docker**: Zur Containerisierung des Apache-Webservers
- **Apache HTTP Server**: Webserver zum Bereitstellen der statischen Webseite
- **Markdown**: Dokumentation des Projekts

## Projektstruktur
```
WebserverImageDocker/
├── website/                # Enthält die HTML-Dateien der Webseite
│   ├── index.html          # Startseite
├── logs/                   # Speichert die Apache-Log-Dateien
├── Dockerfile              # Definition des Docker-Images
├── README.md               # Anleitung zur Nutzung des Docker-Images
├── documentation.md        # Detaillierte Erklärung des Projekts
```

## Dockerfile Erklärung
Das **Dockerfile** basiert auf dem offiziellen `httpd`-Image und kopiert die statische Webseite in das Verzeichnis `/usr/local/apache2/htdocs/`.
```dockerfile
FROM httpd:latest
WORKDIR /usr/local/apache2/htdocs/
COPY ./website /usr/local/apache2/htdocs/
EXPOSE 8080
CMD ["httpd", "-D", "FOREGROUND"]
```

## Starten des Containers mit Volumes
Der folgende Befehl startet den Apache-Webserver und bindet sowohl die Webseite als auch die Log-Dateien als Volumes ein:
```sh
docker run -d -p 8080:80 \
  -v $(pwd)/website:/usr/local/apache2/htdocs \
  -v $(pwd)/logs:/var/log/apache2 \
  --name apache-container apache-webserver
```

## Fazit
Mit diesem Projekt kann eine einfache statische Webseite schnell in einem Docker-Container gehostet werden. Die Nutzung von Volumes stellt sicher, dass die Webseiten-Dateien und Logs auch nach dem Neustart des Containers erhalten bleiben.
