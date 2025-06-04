# Use an official Python base image
FROM python:3.9-slim

# Set working directory in the container
WORKDIR /app


# Copy the rest of your application code
COPY . .


# Install Python dependencies
RUN pip install -r requirements.txt


# Expose port (Flask default is 5000)
EXPOSE 5000

# Command to run the application
CMD ["python", "app.py"]

