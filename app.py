import json
from flask import Flask
from flask import request
app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def hello():
    if request.method == 'POST':

        if request.data:
            parsed_json = json.loads(request.data)

            if parsed_json:
                if parsed_json["a"]:
                    if parsed_json["b"]:
                        return parsed_json["a"] + parsed_json["b"]
        else:
            return 'Invalid JSON in POST body'
    else:
        return 'Welcome. Please post a request'        


if __name__ == '__main__':
    app.run(
        host='0.0.0.0', 
        port=5000
    )

    