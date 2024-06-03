# Use the official Python image from the Docker Hub
FROM common-docker-r.artifactory.geo.conti.de/python:3.8-slim-buster

ENV http_proxy="http://cias.geoazure.conti.de:8080"
ENV https_proxy="http://cias.geoazure.conti.de:8080"

# Make a directory for our application
WORKDIR /app

# Copy over our application code
COPY . /app

# Install pip requirements
COPY requirements.txt requirements.txt
RUN pip install --proxy http://cias.geoazure.conti.de:8080 -r requirements.txt

# Open port 8501 (which Streamlit uses by default)
EXPOSE 8501

# Run the streamlit command to start the app
CMD ["streamlit", "run", "main.py"]