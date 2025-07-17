# tests/test_routes.py
import pytest
from app import app  # import your Flask app

@pytest.fixture
def client():
    with app.test_client() as client:
        yield client

def test_status(client):
    response = client.get("/status")
    assert response.status_code == 200
    assert b"API is up" in response.data
