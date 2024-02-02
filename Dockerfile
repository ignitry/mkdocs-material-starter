FROM python:3.11.7-alpine3.19 as mkdocs

# Environment variables
ENV PACKAGES=/usr/local/lib/python3.11/site-packages
ENV PYTHONDONTWRITEBYTECODE=1

# Set build directory
WORKDIR /tmp

RUN apk add --no-cache build-base gcc bash cmake git

COPY requirements.txt /tmp
RUN pip install --upgrade pip && pip install -r requirements.txt

# /app is mounted in docker-compose
WORKDIR /app

EXPOSE 8000

CMD ["mkdocs", "serve"]
