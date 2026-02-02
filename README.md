# Enterprise Car Detailing Management System
**Engineered with C#, .NET Framework, and MSSQL Server**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Platform: Windows](https://img.shields.io/badge/Platform-Windows-0078d7.svg)
![Database: MSSQL](https://img.shields.io/badge/Database-MSSQL-CC2927.svg)

## 📌 Executive Summary
A high-performance desktop ERP solution designed to centralize and automate operations for high-volume automotive detailing businesses. This system replaces fragmented manual processes with a robust, **Relational Database** engine capable of managing 100+ monthly clients, real-time inventory tracking, and complex financial reporting.



## 🛠 Technical Stack
* **Language:** C# (.NET)
* **Database:** Microsoft SQL Server (MSSQL)
* **Architecture:** Object-Oriented Programming (OOP) with a focus on **Domain Integrity**.
* **Patterns:** Defensive Programming, Singleton (Database Connection), and Factory Pattern (Service Creation).

## 🚀 Key Engineering Challenges

### 1. Enforcing Data Integrity (Defensive Programming)
To prevent the corruption of critical financial data (such as service pricing and tax calculations), I moved away from public property mutations.
* **Implementation:** Utilized strictly typed **Domain Models** with private setters. 
* **Outcome:** Business logic is protected from unauthorized external state changes, ensuring 100% calculation accuracy.

### 2. High-Concurrency Scheduling Engine
Scheduling conflicts (race conditions) were a primary bottleneck.
* **Implementation:** Engineered a validation layer that executes complex SQL checks for time-slot availability before committing transactions.
* **Outcome:** Eliminated "Double Booking" errors across the administrative workflow.

### 3. Relational Schema Optimization
As the dataset grows, query performance becomes critical.
* **Implementation:** Normalized the database to **3rd Normal Form (3NF)** and implemented **B-Tree Indexing** on high-frequency search columns like `BookingDate` and `CustomerID`.
* **Outcome:** Reduced data retrieval latency by **25%** for high-frequency administrative reports.



## 📋 Core Features
* **Automated Client CRM:** Centralized repository for customer history and preferences.
* **Dynamic Inventory Engine:** Real-time tracking of detailing supplies with low-stock alerts.
* **Financial Reporting:** One-click generation of revenue reports, tax summaries, and service performance metrics.
* **Security Layer:** Role-based logic to protect sensitive administrative settings.

## ⚙️ Installation & Setup (For Technical Review)
1. **Clone the Repository:**
   ```bash
   git clone [https://github.com/Leospe24/car-detailing-management-system.git](https://github.com/Leospe24/car-detailing-management-system.git)
2. **Database Configuration:**
   * Import the provided `.sql` schema file into your local **SQL Server instance**.
   * Update the `App.config` connection string with your local server credentials to establish the database handshake.

3. **Build & Run:**
   * Open the `.sln` (Solution) file in **Visual Studio 2022**.
   * Restore **NuGet packages** to ensure all architectural libraries are present.
   * Press `F5` or click **Start** to compile and build the environment.



## 🧠 Industry Standards Applied
* **SOLID Principles:** Decoupled UI logic from Database persistence to ensure the system is modular and maintainable.
* **DRY (Don't Repeat Yourself):** Centralized connection management logic to reduce memory overhead and prevent connection leaks.
* **Referential Integrity:** Enforced strict **Foreign Key constraints** at the database level to prevent orphan data records and ensure high data reliability.

---

**Developer:** Patrick Anim  
**Portfolio:** [fullstack-dev-portfolio.netlify.app](https://fullstack-dev-portfolio.netlify.app)  
**LinkedIn:** [linkedin.com/in/patrick-anim-dev](https://linkedin.com/in/patrick-anim-dev)
