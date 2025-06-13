FROM python:3.9

# Set working directory to where manage.py is
WORKDIR /app

# Copy only requirements and install dependencies first (layer caching)
COPY requirements.txt .

RUN apt-get update \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/* \
    && pip install mysqlclient \
    && pip install --no-cache-dir -r requirements.txt

# Copy entire project
COPY . .

# Expose Django app port
EXPOSE 8000

# Start Django app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
