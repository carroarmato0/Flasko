import os
from flask import Flask

app = Flask(__name__)

subject = os.environ.get('HELLO_SUBJECT')

@app.route('/')
def hello():
    return 'Hello, ' + str(subject) + '!'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
