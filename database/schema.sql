-- =============================================
-- Project: Enterprise Car Detailing Management System
-- Architect: Patrick Anim
-- Purpose: Establish 3NF Relational Integrity & Performance Indexing
-- =============================================

-- 1. Create Customers Table (Core Entity)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    PhoneNumber NVARCHAR(20),
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- 2. Create Services Table (Reference Table)
CREATE TABLE Services (
    ServiceID INT PRIMARY KEY IDENTITY(1,1),
    ServiceName NVARCHAR(100) NOT NULL,
    BasePrice DECIMAL(10, 2) NOT NULL,
    DurationMinutes INT NOT NULL
);

-- 3. Create Appointments Table (Transaction Table)
-- Implements Referential Integrity via Foreign Keys
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    ServiceID INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    Status NVARCHAR(20) DEFAULT 'Pending', -- e.g., Pending, Completed, Cancelled
    
    -- Ensuring data doesn't become "Orphaned"
    CONSTRAINT FK_Customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE,
    CONSTRAINT FK_Service FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);

-- 4. PERFORMANCE OPTIMIZATION (The "B-Tree" Indexing)
-- We index AppointmentDate because the system will frequently filter by date.
-- This reduces search complexity from O(N) to O(log N).
CREATE INDEX IX_AppointmentDate ON Appointments (AppointmentDate);
CREATE INDEX IX_CustomerLookup ON Customers (Email);