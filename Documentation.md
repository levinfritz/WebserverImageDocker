# Docker Apache Webserver Dokumentation

## Projektübersicht
Dieses Projekt implementiert einen Apache Webserver in einem Docker Container. Die Webseite ist über Port 8080 erreichbar, und sowohl die Webseiten-Dateien als auch die Logdateien werden in lokalen Verzeichnissen auf dem Host-System gespeichert.

## Projektstruktur
```
.
├── Dockerfile              # Docker-Build-Anweisungen
├── website/               # Enthält die Webseiten-Dateien
│   └── index.html        # Beispiel-Webseite
├── logs/                 # Apache-Logdateien
└── README.md             # Projekt-Readme
```

## Dockerfile-Erklärung
Das Dockerfile enthält folgende wichtige Komponenten:
- Basiert auf Ubuntu 22.04
- Installiert Apache2
- Konfiguriert Apache für Port 80 (wird auf Host-Port 8080 gemappt)
- Erstellt notwendige Verzeichnisse für Volumes
- Leitet Logs auf stdout/stderr um

## Verwendung

### 1. Repository klonen
```bash
git clone [repository-url]
cd WebserverImageDocker
```

### 2. Docker Image erstellen
```bash
docker build -t apache-webserver .
```

### 3. Container starten
```bash
docker run -d \
  -p 8080:80 \
  -v $(pwd)/website:/var/www/html \
  -v $(pwd)/logs:/var/log/apache2 \
  --name apache-container \
  apache-webserver
```

### Parameter-Erklärung:
- `-d`: Startet den Container im Hintergrund
- `-p 8080:80`: Mappt Port 8080 des Hosts auf Port 80 des Containers
- `-v $(pwd)/website:/var/www/html`: Mounted das lokale website-Verzeichnis
- `-v $(pwd)/logs:/var/log/apache2`: Mounted das lokale logs-Verzeichnis

### 4. Webseite aufrufen
Die Webseite ist nach dem Start unter `http://localhost:8080` erreichbar.

## Nützliche Docker-Befehle

### Container Status prüfen
```bash
docker ps
```

### Container Logs anzeigen
```bash
docker logs apache-container
```

### Container stoppen
```bash
docker stop apache-container
```

### Container entfernen
```bash
docker rm apache-container
```

## Dateien bearbeiten
- Webseiten-Dateien können im `website/` Verzeichnis bearbeitet werden
- Die Änderungen sind sofort im Browser sichtbar
- Logdateien werden im `logs/` Verzeichnis gespeichert
