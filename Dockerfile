# Base container
FROM centos@sha256:184e5f35598e333bfa7de10d8fb1cebb5ee4df5bc0f970bf2b1e7c7345136426

# Administration
LABEL maintainer="carroarmato0@gmail.com"

# Allow changing the Subject of the greating inside the application at runtime
ENV HELLO_SUBJECT="World"

# Update system and install essentials
RUN yum -y update && yum -y install python python-flask python-gunicorn && rm -fr /var/cache/yum

# Change working directory
WORKDIR /app

# Copy source code into place
COPY ./src /app

EXPOSE 8000

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://127.0.0.1:8000/ || exit 1

# Configure container's executable
ENTRYPOINT [ "gunicorn", "--bind=:8000", "flasko:app"]
