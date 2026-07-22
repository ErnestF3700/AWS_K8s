from flask import Flask, render_template
import socket
import os

app = Flask(__name__)

@app.route("/")
def index():
    return render_template(
        "index.html",
        hostname=socket.gethostname(),
        version=os.getenv("APP_VERSION", "1.0"),
        environment=os.getenv("ENVIRONMENT", "dev")
    )

@app.route("/health")
def health():
    return {
        "status": "ok"
    }

@app.route("/ready")
def ready():
    return {
        "ready": True
    }

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)