# Employee Time Tracker

A **Java Servlet and JSP**-based web application designed to track and manage employee tasks, working hours, and project involvement with role-based access control (RBAC).

---

## 📌 Features

- **User Authentication** – Secure login for Admin, Associate, and Employee roles.
- **Role-Based Access Control**:
  - **Admin**: View all tasks, employees, and project data.
  - **Associate**: View only employee tasks.
  - **Employee**: View and manage only their own tasks.
- **Task Management**:
  - Add, edit, and delete tasks.
  - Capture details such as:
    - Employee Name
    - Role
    - Project
    - Date
    - Time Duration
    - Task Category
    - Description
- **Data Validation**:
  - Prevent duplicate entries.
  - Ensure task duration does not exceed 8 hours.
- **Analytics & Charts**:
  - Pie chart for daily task distribution.
  - Bar chart for weekly/monthly hours.
  - Admin can filter charts by employee or project.
- **Time Tracking**:
  - Display total working hours for **daily, weekly, and monthly** views.

---

## 🛠️ Tech Stack

- **Backend**: Java Servlet, JSP  
- **Frontend**: HTML, CSS, JavaScript  
- **Database**: MySQL  
- **Libraries**:
  - Chart.js for data visualization
  - JDBC for database connectivity

---
## 📂 Project Structure
```plaintext
Employee-Time-Tracker/
│
├── src/           # Java Servlet & Backend code
├── web/           # JSP pages and frontend files
├── lib/           # Required libraries (JDBC, Chart.js, etc.)
├── database/      # SQL scripts for database setup
└── README.md      # Project documentation
---
## 🚀 Getting Started

### 1️⃣ Prerequisites
- Java 8 or above
- Apache Tomcat Server
- MySQL Database
- Maven (optional, for build management)

### 2️⃣ Installation
1. **Clone the repository**  
   ```bash
   git clone https://github.com/yourusername/employee-time-tracker.git
## 📂 Project Structure

