from flask import Flask
from dotenv import load_dotenv # type: ignore
import os
from flask_cors import CORS # type: ignore

# Load environment variables from .env file (for local dev only)
load_dotenv()

# Initialize Flask app
app = Flask(__name__)
CORS(app)  # Enable CORS for frontend/backend integration

# Enable debug mode from environment variable
app.config['DEBUG'] = os.environ.get('FLASK_DEBUG', 'False') == 'True'

@app.route('/')
def index():
    return 'Hello, this is your Employee Management App'

# Only run this when starting locally (not in production container)
if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))  # fallback to 5000
    app.run(host='0.0.0.0', port=port)

