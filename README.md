## PROJECT OVERVIEW

### Background
A simple web application for viewing student scores from assignment tests.

---

## Features

1. Check score using registration number.
2. View statistics of score distribution across 4 levels for each subject via charts.
3. View top 10 students in groups A, A1, and B.

---

## Demo Website

👉 [Live Demo](https://cse-tcsharing.io.vn/search-score)

---

## How to run locally?

> ⚠️ Requirements: [Docker](https://www.docker.com/products/docker-desktop/) and [Docker Compose](https://docs.docker.com/compose/install/) installed.

### Step-by-step

1. Create a folder named `app` (or any name you prefer):
    ```bash
    mkdir app && cd app
    ```

2. Clone both backend and frontend:
    ```bash
    git clone https://github.com/tison2810/backend-rails-test backend
    git clone https://github.com/tison2810/frontend-react-test frontend
    ```

3. Navigate into backend folder:
    ```bash
    cd backend
    ```

4. Build and start all services:
    ```bash
    docker-compose up --build -d
    ```

5. After the containers are running, setup the database:
    ```bash
    docker-compose exec backend ./bin/rails db:create db:migrate db:seed
    ```

6. Visit the web:
    - Frontend: http://localhost:5173 (or port depending on your config)
    - API: http://localhost:3000

---

## Notes

- The frontend is served via Nginx (only in production mode).
- In local, Vite serves the frontend on port 3000.
- API is available on port 8080 from Rails backend.

