# EM-Flask-api
Employee mangment system flask api app 

# Insider Threat Detection API – Agile DevSecOps Project

This project showcases practical experience with Agile software development, API design, infrastructure as code (IaC), containerization, CI/CD pipelines, and testing within a modern DevSecOps workflow.

---

## Project Scenario – Hypothetical Use Case

**Company:** CyberAware Corp  
**Team:** Cyber Threat Intelligence (CTI)  
**Problem:** Insider threats from departing employees have risen dramatically, backed by case studies and industry reports (e.g., CrowdStrike, 2025; Mimecast, 2025). The CTI team requires a lightweight, scalable tool to track and assess leavers who may pose a security risk.

**Proposed Solution:**  
An internal Flask-based REST API connected to a NoSQL backend (Google Firestore) that allows HR and security staff to register, update, and retrieve information about departing employees. This supports early threat detection and mitigation before malicious activity occurs.

## Tech Stack

| Area               | Tool/Technology              |
|--------------------|------------------------------|
| Backend Framework  | Python Flask (RESTful API)   |
| Database           | Google Firestore (NoSQL)     |
| Infrastructure     | Terraform (IaC, GCP resources)|
| Deployment         | Google Cloud Run             |
| Containerization   | Docker                       |
| CI/CD              | GitHub Actions               |
| Version Control    | Git + GitHub (private repo)  |
| Agile Framework    | Kanban                       |
| Testing            | Manual API tests via Postman |

---

## Agile Approach (Kanban)

Due to the project's short timeline and solo development, I implemented an Agile **Kanban** methodology:
- Tasks were divided into **Backlog**, **Ready**, **In Progress**, **In Review**, and **Done**.
- Features and user stories were visually tracked and prioritized.
- Daily feedback from a fictional customer (CTI lead) simulated iterative delivery and fast feedback cycles.

---

## Features

- 📋 **Add a leaver:** `POST /leavers`
- 🔍 **Retrieve all leavers:** `GET /leavers`
- 🧑 **Retrieve by surname:** `GET /leavers/<surname>`
- 🕒 **Update leave date:** `PUT /leavers/<surname>`
- ✅ **Status confirmation:** `GET /status`

---

##  Infrastructure as Code (Terraform)

I used **Terraform** to provision all infrastructure on GCP:
- Google Cloud Run service for hosting the API
- Firestore NoSQL database
- IAM roles and permissions
- Network configuration (via firewall rules and VM provisioning)

This ensured repeatable deployments and version-controlled infrastructure definitions.

---

##  Dockerization

After local testing, I containerized the application using **Docker**, resolving environment-specific issues like:
- Missing credentials for Firestore
- Incorrect package import paths

This made the app portable and production-ready, enabling seamless deployment to the cloud.

---

## CI/CD Pipeline

A GitHub Actions workflow automatically:
1. Runs tests on each commit
2. Builds and pushes Docker image
3. Deploys to Cloud Run

CI/CD aligned with DevOps principles:
- Fast, reliable delivery
- Automated validation before deployment
- Reduced human error and environment drift

---

## Testing Strategy

API functionality was manually tested using **Postman**, covering:
- Input validation
- CRUD operations
- Edge cases (e.g., duplicate entries, missing fields)

Future iterations could include:
- Unit tests using `pytest`
- Contract testing
- Integration tests as part of CI

---

## Key Concepts Demonstrated

| Concept         | Demonstration                                                                 |
|-----------------|--------------------------------------------------------------------------------|
| **Agile**       | Kanban board with epics, stories, fast feedback loops                          |
| **API Design**  | RESTful endpoints, request/response validation                                 |
| **CI/CD**       | GitHub Actions pipeline for build, test, deploy                                |
| **IaC**         | Terraform-managed GCP provisioning                                             |
| **Containerization** | Dockerfile and image-based deployment                                     |
| **Testing**     | Manual API tests with HTTP methods + potential for expansion                   |
| **DevOps Culture** | Shift-left, automation, shared responsibility, repeatable deployments       |

---

## Screenshots (Available in Report)

- Kanban board (task tracking)
- GitHub Actions logs
- Docker container build and run
- API test examples (POST, GET, PUT)
- GCP infrastructure screenshots (Firestore, VM, Cloud Run)

---

## Note

This is an academic/portfolio project and not intended for commercial use.

