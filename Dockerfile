# Utilisation de Python officiel
FROM python:3.11-slim

# Répertoire de travail
WORKDIR /app

# Installation des dépendances
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ .
COPY .env /app/.env

RUN sh -c "if [ -f /app/myproject/settings.py ]; then \
    ALLOWED_HOSTS=$(grep DJANGO_ALLOWED_HOSTS .env | cut -d '=' -f2) && \
    sed -i \"/ALLOWED_HOSTS/c\ALLOWED_HOSTS = [x.strip() for x in \\\"$ALLOWED_HOSTS\\\".split(',')]\" /app/myproject/settings.py; \
    fi"

# Exposer le port
EXPOSE 8000

# Entrée du conteneur (géré dans docker-compose)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
 