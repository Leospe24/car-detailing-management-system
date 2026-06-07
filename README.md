# Car Detailing Management System (Database & Software Design)

This is a database design and backend project I built as my capstone while getting my Professional Diploma in Software Engineering at IPMC Ghana. 

The goal was to design a desktop app that could help a local car detailing shop get off of paper records and track their customers, appointments, and cleaning supplies in a proper database.

## 🛠️ The Stack
* **Language:** C# (.NET Framework)
* **Database:** Microsoft SQL Server (MSSQL)
* **Testing:** MSTest

---

## 💻 What I Solved & Put Into Practice

### 1. Designing the Relational Database (`schema.sql`)
Instead of dumping everything into one messy table, I broke the data down properly into separate tables for `Customers`, `Services`, and `Appointments` (3rd Normal Form). 
* **Data Integrity:** I set up strict Foreign Keys. For example, if you delete a customer, their appointments are automatically cleaned up (`ON DELETE CASCADE`), which keeps the database from filling up with broken, orphaned data.

### 2. Making Queries Faster with Indexing
I realized that if a real shop uses this, they are going to search by date constantly to see who is coming in. To keep the app from slowing down as the database grows, I added custom B-Tree indexes on the `AppointmentDate` and customer `Email` columns to keep search times fast.

### 3. Preventing Double-Bookings (`BookingValidationTests.cs`)
One of the biggest real-world issues for a car wash is double-booking a time slot. I wrote a validation layer in C# to check if a slot is already taken before letting the database save it. To prove it actually works, I wrote an automated Unit Test using the standard Arrange-Act-Assert layout to make sure overlapping requests get rejected instantly.

---

## 📂 What's In This Repo
Since this was a student project focused on backend logic and database layout, I've uploaded the core engineering pieces:
* `schema.sql` — The complete SQL script that creates the tables, keys, and indexes.
* `BookingValidationTests.cs` — The automated test file validating the scheduling logic.
* `App.config` — The configuration file showing how the C# app securely points to the local SQL database.

---

## 🚀 How This Connects to My DevOps Path
Even though this is a desktop app, it directly helped my transition into DevOps:
* **Databases:** Learning how to write clean SQL schemas and indexes makes managing production database containers and migrations much easier.
* **Testing:** Writing automated unit tests gave me the foundational mindset needed to build automated test steps inside CI/CD deployment pipelines.
