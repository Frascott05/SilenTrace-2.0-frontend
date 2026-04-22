FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    bash \
    git \
    curl \
    build-essential \
    gcc \
    make \
    python3-dev \
    libffi-dev \
    libssl-dev \
    rustc \
    cargo \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip setuptools wheel

WORKDIR /home/app

COPY . .

RUN cd frontend && npm install

EXPOSE 5173

WORKDIR /home/app/frontend
CMD ["npm", "run", "dev"]
