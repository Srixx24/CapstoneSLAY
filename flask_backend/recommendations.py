"""
This file defines the /api/recommend API endpoint.

It:
- Accepts a base64 image string from the frontend
- Uses the ML model to generate LAB lipstick color predictions
- Converts those colors to RGB
- Responds with a list of recommended lipstick colors as HEX codes
"""

import os
import base64
import cv2
import numpy as np
import tensorflow as tf
from flask import Blueprint, request, jsonify

# Import ML logic from ML code
from prepare_input import model_input              # Prepares image for prediction
from lab_to_rgb import lab_to_rgb                  # Converts LAB → RGB

# ──────────────────────────────────────────────────────────────────────────────
# Set up Flask Blueprint (modular route system)
# ──────────────────────────────────────────────────────────────────────────────
recommendations_bp = Blueprint("recommendations", __name__)

# Load the trained Keras model once (shared across all requests)
MODEL_PATH = os.path.join(
    os.path.dirname(__file__),
    "..", "machinlearning", "model_prediction", "model", "test_model_00.keras"
)
_model = tf.keras.models.load_model(MODEL_PATH)


# ──────────────────────────────────────────────────────────────────────────────
# Route: POST /api/recommend
# Receives: JSON { "image": "data:image/jpeg;base64,..."}
# Responds: JSON [ "#cc0000", "#ff9999", ... ]  → list of lipstick hex shades
# ──────────────────────────────────────────────────────────────────────────────
@recommendations_bp.route("/recommend", methods=["POST"])
def recommend():
    try:
        data = request.get_json()
        img_data = data.get("image", "")

        # Validate input
        if not img_data.startswith("data:image"):
            return jsonify({"error": "Invalid image data"}), 400

        # Decode base64 image to OpenCV format
        header, encoded = img_data.split(",", 1)
        image_bytes = base64.b64decode(encoded)
        np_arr = np.frombuffer(image_bytes, np.uint8)
        img = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)
        if img is None:
            raise ValueError("Image could not be decoded")

        # Run the image through the ML model to get a LAB prediction
        lab_prediction = model_input(img, _model)

        # Convert LAB to RGB vectors
        rgb_colors = lab_to_rgb(lab_prediction)

        # Convert RGB values to hex strings like "#cc2233"
        hex_colors = [
            "#{:02x}{:02x}{:02x}".format(int(rgb[0]), int(rgb[1]), int(rgb[2]))
            for rgb in rgb_colors
        ]

        return jsonify(hex_colors)

    except Exception as e:
        return jsonify({"error": str(e)}), 500
