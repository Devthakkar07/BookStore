# 📚 Book Management System – ASP.NET Core

A **Book Management System** built using **ASP.NET Core MVC + Web API**, following **production-level best practices**.  
The project demonstrates **CRUD operations using Stored Procedures**, clean API design, and a responsive UI.

---

## 🚀 Features

- 📖 Book CRUD (Create, Read, Update, Delete)
- 🔗 RESTful Web API integration
- 🗄️ SQL Server with Stored Procedures
- ⚙️ ASP.NET Core MVC + API architecture
- 🧾 Modal-based Create & Edit
- 🧹 Soft Delete & Hard Delete support
- 🎨 Bootstrap UI (striped & responsive table)
- 🔐 Environment-based configuration
- 🧠 Production-ready project structure

---

## 🛠️ Tech Stack

- **Backend:** ASP.NET Core (MVC + Web API)
- **Database:** SQL Server
- **ORM:** Entity Framework Core
- **Frontend:** Razor Views, JavaScript (Fetch API), Bootstrap
- **Architecture:** API-driven CRUD
- **Version Control:** Git & GitHub

---

## 📂 Project Structure

BookStore/
│
├── Controllers/
│ ├── BooksController.cs
│ └── API/
│ └── BooksApiController.cs
│
├── Models/
│ └── Book.cs
│
├── Data/
│ └── ApplicationDbContext.cs
│
├── Views/
│ └── Books/
│ └── Index.cshtml
│
├── Database/
│ ├── 01_Create_Database.sql
│ ├── 02_Create_Tables.sql
│ ├── 03_StoredProcedures/
│ │ ├── sp_Books_GetAll.sql
│ │ ├── sp_Books_GetById.sql
│ │ ├── sp_Books_Insert.sql
│ │ ├── sp_Books_Update.sql
│ │ └── sp_Books_Delete.sql
│ └── 04_Seed_Data.sql
│
├── appsettings.json
├── Program.cs
└── BookStore.sln


---

## 🗄️ Database Setup

➡️ Run all SQL script files provided in the `Database` folder (in sequence) to create the database, tables, stored procedures, and sample data.

---

## ⚙️ Configuration

Update your SQL Server connection string in `appsettings.json`:

```json
"ConnectionStrings": {
  "DefaultConnection": "Server=YOUR_SERVER;Database=BookStoreDb;Trusted_Connection=True;TrustServerCertificate=True"
}

📌Notes

API endpoints are consumed using Fetch API

All database operations are handled via Stored Procedures

UI uses Bootstrap modals for Create & Edit

Built with scalability & interview-readiness in mind

📜 License

This project is for learning and demonstration purposes.