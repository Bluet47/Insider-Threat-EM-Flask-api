# Use Python 3.13 base image
FROM python:3.13.2-bookworm

# Set working directory
ENV APP_HOME /back-end
WORKDIR $APP_HOME

# Copy everything into the container
COPY . ./

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Run app with Gunicorn
CMD gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 app:app
