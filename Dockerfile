# Use Python 3.13 base image
FROM python:3.13.2-bookworm

# Set working directory
WORKDIR /back-end

# Copy requirements.txt to the container
COPY requirements.txt .

# Install the required Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code to the container
COPY . .

# Expose the port the app runs on
EXPOSE 8080

# Command to run the Flask app
CMD ["python", "./app.py"]