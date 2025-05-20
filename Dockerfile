# Use Python 3.13 base image
FROM python:3.13.2-bookworm

# Create and switch to an app directory
WORKDIR /app

# Copy requirements first
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your code
COPY . .

# Expose the port the Flask app uses
EXPOSE 8080

# Run the app
CMD ["python", "app.py"]
