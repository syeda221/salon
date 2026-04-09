# 💇‍♀️ Salon Management System

## 📌 Project Overview

This is a **web-based Salon Management System** developed using **PHP and MySQL**.
It is designed to help manage daily salon operations such as appointments, staff, clients, services, payments, and feedback.

The system provides **separate dashboards** for Admin, Receptionist, and Staff, ensuring smooth workflow and proper role-based access.

---

## 🔐 Demo Login Credentials

You can log into the system using the following accounts:

### 👨‍💼 Admin Panel

* **Email:** [ali@gmail.com](mailto:ali@gmail.com)
* **Password:** ali

### 🧾 Receptionist Panel

* **Email:** [emaan@email.com](mailto:emaan@email.com)
* **Password:** emaan

### 👩‍🔧 Staff Panel

* **Email:** [mahnoor@gmail.com](mailto:mahnoor@gmail.com)
* **Password:** mahnoor

---

## 👥 User Roles & Access

### ✅ Admin

* Manage all users (staff, receptionist)
* View and manage appointments
* Manage services and pricing
* Monitor payments and reports
* View feedback

### ✅ Receptionist

* Book appointments for clients
* Assign staff and time slots
* Manage client details
* Handle payments

### ✅ Staff

* View assigned appointments
* Update appointment status
* Provide services
* View feedback from clients

---

## ⚙️ Features

* 📅 Appointment booking system with time slots
* 👨‍👩‍👧 Client management
* 💇 Service selection (multiple services supported)
* 💳 Payment tracking (cash/card)
* ⭐ Feedback & rating system
* 📦 Inventory management
* 🔐 Secure login system with role-based access

---

## 🛠️ Database Setup

To run this project locally:

1. Open **phpMyAdmin**
2. Create a new database (e.g., `salon_management`)
3. Import the SQL file provided in the project

📁 **Database File Location:**

```
config/salon_management.sql
```

---



## 💡 Notes

* Make sure database connection settings are correct in:

```
config/connection.php
```

* Default roles include:

  * Admin
  * Receptionist
  * Staff

---
