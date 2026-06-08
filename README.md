# CSE Motors

A full-stack car dealership web application for browsing and managing vehicle inventory. Visitors can explore vehicles by classification and view detailed listings, while authenticated staff can manage inventory and classifications through role-based access control.

## Links

- [GitHub Repository](https://github.com/deanabriggs/cseMotors.git)
- [Try It Live](https://cse-motors-kjd9.onrender.com/)

## Demo Credentials

Use these accounts on the [live demo](https://cse-motors-kjd9.onrender.com/) to explore each permission level:

| Role         | Email                | Password     | Access                                                    |
| ------------ | -------------------- | ------------ | --------------------------------------------------------- |
| **Admin**    | `tony@starkent.com`  | `Iam1ronM@n` | Full access — inventory **and** classification management |
| **Employee** | `electra@comics.net` | `N1njut$u`   | Inventory management                                      |
| **Client**   | `we@assimilate.org`  | `St@rtr3k`   | Standard account features                                 |

> These are shared demo accounts on a public deployment. Anyone may add, edit, or delete demo data while signed in as Employee or Admin.

## What It Does

**Public (no login required)**

- Browse the vehicle inventory by classification (e.g. Custom, Sport, SUV)
- View detailed pages for individual vehicles with images, pricing, mileage, and descriptions
- Register a new account and log in

**Account holders**

- Secure registration and login with hashed passwords and JWT-based sessions
- View and update account details, including changing the password

**Employees & Admins (role-based access)**

- **Inventory management** — add new vehicle classifications, add inventory, and edit or delete existing vehicles (Employee and Admin)
- **Classification management** — edit and delete classifications (Admin only)
- **Dynamic categories & inventory** — categories and vehicles are added, updated, and removed at runtime, with changes immediately reflected across the site: new classifications appear in the navigation and inventory listings re-render directly from the database

The app features a **responsive design** that adapts smoothly across mobile, tablet, and desktop screen sizes. It also validates data on both the **frontend** (HTML5 form constraints) and the **backend** (`express-validator` server-side rules), with flash messaging for user feedback and custom 404 / 500 error handling throughout.

## Tech Stack

| Layer              | Technologies                                                       |
| ------------------ | ------------------------------------------------------------------ |
| **Runtime**        | Node.js                                                            |
| **Server**         | Express                                                            |
| **Views**          | EJS with `express-ejs-layouts`                                     |
| **Database**       | PostgreSQL (`pg` connection pool)                                  |
| **Authentication** | JSON Web Tokens (`jsonwebtoken`), `bcryptjs` password hashing      |
| **Sessions**       | `express-session` with `connect-pg-simple` (Postgres-backed store) |
| **Validation**     | HTML5 client-side constraints + `express-validator` (server-side)  |
| **Messaging**      | `connect-flash` + `express-messages`                               |
| **Tooling**        | `nodemon`, `dotenv`                                                |

The project follows the **MVC architecture** — `models/` (data access), `views/` (EJS templates), `controllers/` (request logic), with `routes/` and shared `utilities/` for middleware such as JWT verification and role checks.

## Getting Started

### Prerequisites

- Node.js
- A PostgreSQL database (e.g. [Neon](https://neon.tech), Render, or local)

### Setup

1. Clone the repository and install dependencies:

   ```bash
   git clone https://github.com/deanabriggs/cseMotors.git
   cd cseMotors
   npm install
   ```

2. Create a `.env` file in the project root:

   ```env
   DATABASE_URL=postgresql://user:password@host/dbname?sslmode=require
   NODE_ENV=development
   SESSION_SECRET=your_session_secret
   ACCESS_TOKEN_SECRET=your_access_token_secret
   HOST=localhost
   PORT=3000
   ```

3. Build the database by running the SQL scripts in [`database/`](database/) against your PostgreSQL instance to create the tables and seed initial data.

4. Start the development server:

   ```bash
   npm run dev
   ```

5. Open the app at `http://localhost:3000`.
