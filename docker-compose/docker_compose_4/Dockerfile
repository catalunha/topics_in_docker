#Dockerfile-Backend
FROM python:3.12-bullseye

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PYDEVD_DISABLE_FILE_VALIDATION=1

# Set the working directory
WORKDIR /backend

COPY backend/ .
RUN ls -la

# Install the Django application dependencies
RUN pip install -r requirements.txt


# Expose the port the app runs on
EXPOSE 8000
EXPOSE 5678

# Command to run the application
CMD ["sh", "start_app.sh"]