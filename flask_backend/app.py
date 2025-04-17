"""
Main entrypoint for the Flask backend.

- Adds the ML model directory to the Python path
- Initializes the Flask app using a factory pattern
- Registers routes from recommendations.py
- Launches the development server on port 5000
"""

import os
import sys
from flask import Flask
from flask_cors import CORS
from recommendations import recommendations_bp

# ──────────────────────────────────────────────────────────────────────────────
# Add the external ML directory to the import path
# This lets you import files like prepare_input, lab_to_rgb, etc., without copying them
# Update the path below if your repo structure changes
# ──────────────────────────────────────────────────────────────────────────────
ML_ROOT = os.path.abspath(
    os.path.join(os.path.dirname(__file__), "..", "machinlearning", "model_prediction")
)
sys.path.insert(0, ML_ROOT)  # make Python recognize ML folder as an importable path


# ──────────────────────────────────────────────────────────────────────────────
# Create and configure Flask app
# ──────────────────────────────────────────────────────────────────────────────
def create_app():
    """
    Factory function that creates and returns a configured Flask app.
    """
    app = Flask(__name__)
    CORS(app)  # Enable CORS to allow frontend (React) to make API requests

    # Register the blueprint from recommendations.py
    app.register_blueprint(recommendations_bp, url_prefix="/api")

    return app


# ──────────────────────────────────────────────────────────────────────────────
# Run server (only when this file is executed directly)
# ──────────────────────────────────────────────────────────────────────────────
app = create_app()

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5000)
