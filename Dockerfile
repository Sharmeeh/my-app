# Use an official Python runtime as a parent image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the application files into the container
COPY app.py requirements.txt ./
COPY templates/ templates/

# Install the required Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Expose the application port
EXPOSE 8080

# Run the Flask application
CMD ["python", "app.py"]


