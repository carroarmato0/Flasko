# Flasko
A random REST API implemented with Flask

## Installation

The application requires Python, Flask and (optionally) Gunicorn.

### Centos

```
yum -y update && yum -y install python python-flask python-gunicorn
cd src
gunicorn --bind=:8000 flasko:app
```

### Others

Ensure Python and PIP are installed.

```
cd src
pip install -r requirements.txt
gunicorn --bind=:8000 flasko:app
```
