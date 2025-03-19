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

## Quick Start
1. Clone this repository
2. Build the Docker image:
   ```bash
   docker build -t my-apache-server .
   ```
3. Run the container:
   ```bash
   docker run -d -p 8080:80 \
     -v $(pwd)/website:/var/www/html \
     -v $(pwd)/logs:/var/log/apache2 \
     --name my-apache-container my-apache-server
   ```
4. Access the website at `http://localhost:8080`

## Directory Structure
- `website/`: Contains the website files (HTML, CSS, etc.)
- `logs/`: Contains Apache server logs
- `Dockerfile`: Contains instructions to build the Docker image
