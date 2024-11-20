# Utilisation de Python officiel
FROM python:3.11-slim

# Répertoire de travail
WORKDIR /app

# Installation des dépendances
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Exposer le port
EXPOSE 8000

# Entrée du conteneur (géré dans docker-compose)
CMD ["sh", "-c", "echo 'Entrée définie dans docker-compose'"]
 