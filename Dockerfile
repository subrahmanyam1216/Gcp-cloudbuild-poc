#Here iam Useing the hub.docker.com website Python image.
# https://hub.docker.com/_/python
FROM python:3.7-slim

# Copy local code to container image
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

# Install dependencies.
RUN pip install Flask gunicorn

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 app:app