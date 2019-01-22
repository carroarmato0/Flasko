# Base container
FROM centos:7

# Administration
LABEL maintainer="carroarmato0@gmail.com"

# Update system and install essentials
RUN yum -y install epel-release && yum -y update && yum -y install python python-pip

# Leverage Docker cache to install actual application dependencies
COPY ./src/requirements.txt /app/requirements.txt

# Change working directory
WORKDIR /app

# Install application dependencies
RUN pip install -r requirements.txt

# Copy source code into place
COPY ./src /app

EXPOSE 8000

# Configure container's executable
ENTRYPOINT [ "gunicorn", "--bind=:8000", "flasko:app"]
