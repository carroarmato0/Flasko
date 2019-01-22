# Flasko
A random REST API implemented with Flask

## Installation

Install pyhton and pip

### Centos

```
yum -y install epel-release && yum -y update && yum -y install python python-pip
```

```
cd src
pip install -r requirements.txt
gunicorn --bind=:8000 flasko:app
```
