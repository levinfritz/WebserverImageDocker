# Webserver-Image mit Apache in Docker

## 1. Projektbeschreibung
Dieses Projekt erstellt ein eigenes Docker-Image für einen Apache-Webserver, der eine einfache statische Webseite hostet. Die Webseiten-Dateien und Log-Dateien werden per Volume auf dem Host gespeichert.

## 2. Voraussetzungen
- Installiertes Docker
- Git für die Versionierung (optional)

## 3. Repository-Klonen
```sh
git clone https://github.com/levinfritz/WebserverImageDocker.git
cd WebserverImageDocker
```

## 4. Docker-Image bauen
```sh
docker build -t apache-webserver .
```

## 5. Container starten
```sh
docker run -d -p 8080:80 -v $(pwd)/website:/usr/local/apache2/htdocs -v $(pwd)/logs:/var/log/apache2 --name apache-container apache-webserver
```

## 6. Webseite aufrufen
Öffne den Browser und gehe zu:
```
http://localhost:8080
```

## 7. Logs einsehen
```sh
docker logs apache-container
```

## 8. Container stoppen und entfernen
```sh
docker stop apache-container
```
```sh
docker rm apache-container
