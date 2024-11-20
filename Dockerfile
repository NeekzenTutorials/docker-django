# Utilisation de Python officiel
FROM python:latest

# Répertoire de travail
WORKDIR /app

# Installation des dépendances
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ . 
COPY .env /app/.env

RUN ls

# Exposer le port
EXPOSE 8000

# Entrée du conteneur (géré dans docker-compose)
CMD ["sh", "-c", "if [ ! -f manage.py ]; then django-admin startproject myproject .; fi && python manage.py runserver 0.0.0.0:8000"]
