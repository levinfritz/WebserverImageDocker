# Apache Webserver Docker Project

This project contains a Docker setup for running an Apache web server with a simple website. The server runs on port 8080 and uses volume mounting for website files and logs.

## Project Structure
```
.
├── Dockerfile
├── website/
│   └── index.html
└── logs/
```

## Prerequisites
- Docker installed on your system
- Git (to clone this repository)

# Ubuntu-Installationsanleitung für Docker und Webserver

## 1. Projekt einrichten

```bash
# Git installieren falls noch nicht vorhanden
sudo apt install -y git

# Repository klonen
git clone https://github.com/levinfritz/WebserverImageDocker.git
cd WebserverImageDocker

# Verzeichnisse erstellen
mkdir -p website logs
```

## 2. Docker Image erstellen und Container starten

```bash
# Docker Image bauen
docker build -t apache-webserver .

# Container starten
docker run -d \
  -p 8080:80 \
  -v "$(pwd)/website":/var/www/html \
  -v "$(pwd)/logs":/var/log/apache2 \
  --name apache-container \
  apache-webserver
```

## 3. Überprüfen der Installation

```bash
# Container-Status prüfen
docker ps

# Logs anzeigen (falls nötig)
docker logs apache-container
```

## 4. Webseite aufrufen
Öffnen Sie einen Webbrowser und navigieren Sie zu:
```
http://localhost:8080
