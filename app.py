from flask import Flask, render_template
import requests
import json

app = Flask(__name__)

@app.route('/')
def home():
    response = requests.get('https://www.gamerpower.com/api/giveaways?platform=pc')
    data = response.json()
    # Filter data to only show type 'game'
    # data = [item for item in data if item['type'] == 'Game']
    return render_template('index.html', data=data)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000, threaded=True, use_reloader=True, passthrough_errors=True)
