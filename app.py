from flask import Flask ,request, jsonify
from firestoreDB import Database
from dotenv import load_dotenv # type: ignore
import os
from flask_cors import CORS # type: ignore

COLLECTION_NAME = "employees"

# Initialize Flask app
app = Flask(__name__)
CORS(app) # Enable CORS for frontend/backend integration

# Enable debug mode from environment variabl

db_instance = Database(COLLECTION_NAME)

#API route 
@app.route("/")
def index():
    return "Employee Leavers API (Firestore)"

#retreving all leveres using GET method 
@app.route("/leavers", methods=["GET"])
def get_all_leavers():
    leavers = db_instance.get_all_leavers()
    return jsonify(leavers)


# getting / retreving a leaver by last name  
@app.route("/leaver/<last_name>", methods=["GET"])
def get_leaver(last_name):
    leaver = db_instance.get_leaver(last_name)
    if leaver.exists:
        return jsonify(leaver.to_dict())
    else:
        return jsonify({"error": "Leaver not found"}), 404
    
#adding a emplyee tho the lever list / database
@app.route("/leaver", methods=["POST"])
def add_leaver():
    data = request.get_json()
    last_name = data["last_name"]
    leaver_data = {
        "first_name": data["first_name"],
        "last_name": last_name,
        "departure_date": data["departure_date"],
        "job_role": data["job_role"]
    }
    db_instance.add_leaver(last_name, leaver_data)
    return jsonify({"status": "Leaver added successfully!"}), 201

# updataing leaver list name using put methrod to update the databse entry
@app.route("/leaver/<last_name>", methods=["PUT"])
def update_leaver(last_name):
    data = request.get_json()
    db_instance.update_leaver(last_name, data)
    return jsonify({"status": "Leaver updated successfully!"})

#removing a emplyee from lever list prahas they have been reinstated 
@app.route("/leaver/<last_name>", methods=["DELETE"])
def delete_leaver(last_name):
    db_instance.delete_leaver(last_name)
    return jsonify({"status": "Leaver deleted successfully!"})

# get teh depature data of a employee
@app.route("/leaver/<last_name>/departure-date", methods=["GET"])
def get_departure_date(last_name):
    date = db_instance.get_departure_date(last_name)
    if date:
        return jsonify({"last_name": last_name, "departure_date": date})
    else:
        return jsonify({"error": "Leaver not found"}), 404

@app.route("/leaver/<last_name>/departure-date", methods=["PUT"])
def update_departure_date(last_name):
    data = request.get_json()
    new_date = data.get("departure_date")
    if not new_date:
        return jsonify({"error": "No departure_date provided"}), 400

    db_instance.update_departure_date(last_name, new_date)
    return jsonify({"status": "Departure date updated!"})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=int(os.environ.get('PORT', 8080)))