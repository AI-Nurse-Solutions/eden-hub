# Base Image
FROM python:3.11-slim-bookworm

# Install Node.js
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Install OpenCLAW (hypothetical package installation)
# RUN pip install openclaw-ai agentic-gravity

# Copy requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Initial Project Setup
# This will be replaced by the specific incubator content during spawn
COPY . .

# Expose common ports (Next.js, FastAPI, etc.)
EXPOSE 3000 8000

CMD ["python", "main.py"]
