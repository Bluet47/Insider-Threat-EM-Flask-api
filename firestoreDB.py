from google.cloud import firestore

class Database:
    def __init__(self, collection_name):
        self.db = firestore.Client()
        self.collection = self.db.collection(collection_name)

    def get_all_leavers(self):
        docs = self.collection.stream()
        return [doc.to_dict() for doc in docs]

    def get_leaver(self, last_name):
        return self.collection.document(last_name).get()

    def add_leaver(self, last_name, data):
        self.collection.document(last_name).set(data)

    def update_leaver(self, last_name, data):
        self.collection.document(last_name).update(data)

    def delete_leaver(self, last_name):
        self.collection.document(last_name).delete()

    def get_departure_date(self, last_name):
        doc = self.collection.document(last_name).get()
        if doc.exists:
            return doc.to_dict().get("departure_date", None)
        return None

    def update_departure_date(self, last_name, new_date):
        self.collection.document(last_name).update({"departure_date": new_date})
