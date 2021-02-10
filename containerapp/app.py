from flask import Flask, render_template


app = Flask(__name__)

@app.route('/pups', methods=['GET'])

def innercircle():
    return render_template('index.html')

if __name__ == '__main__':
    app.run()