# La Grange | Hotel Management Database

### Relational Database Design & Business Analysis

**Academic project based on an operational context observed during hospitality experience in Courmayeur, Italy.**

**Project type:** Academic Project — SQL / Data Science

**Role:** Database Design · Data Modeling · SQL Implementation · Business Analysis

**Tools:** MySQL · SQL · Excel

---

## The Project

La Grange is a rural hospitality business offering accommodation, restaurant services, farm-related activities and additional guest experiences.

This academic project was developed based on operational needs observed during my hospitality experience in Courmayeur, Italy.

The objective was to design a relational database capable of organizing information across different business areas and supporting operational management and data analysis.

---

## The Challenge

The project focused on several operational challenges:

- Information distributed across different business areas.
- Manual processes for managing clients, reservations and payments.
- Difficulty maintaining consistent and accessible information.
- Limited visibility over activities, stock and operational data.
- Difficulty transforming business information into useful analysis.

---

## The Solution

I designed and implemented a relational database using MySQL.

The data model connects the main operational areas of the business, including:

**Clients · Guests · Hotel · Reservations · Staff · Activities · Farm · Restaurant · Products · Suppliers · Payments · Billing · Stock · Maintenance · Customer Reviews**

The database was populated with manually created data to simulate the business environment and test the SQL structures and analytical queries.

---

## Data Model

The project began with the design of an Entity-Relationship Model, defining the main entities, relationships, primary keys and foreign keys.

The model was designed to centralize operational information while maintaining relationships between the different areas of the business.



---

## SQL Implementation

The database includes different SQL components designed to support operational management and analysis.



### Views

Examples include:

- Hotel guests
- Activities
- Restaurant information
- Total revenue
- Daily revenue
- Popular activities
- Hotel occupancy
- Product stock

### Functions

Examples include:

- Total number of guests
- Activities associated with a client
- Total payments
- Reservations associated with a client

### Stored Procedures

Examples include:

- Adding a new client
- Viewing activities associated with a client
- Registering a payment
- Viewing reservations associated with a client

### Triggers

The project also includes automated database actions, such as:

- Updating supplier stock after a product is inserted.
- Generating billing information after a payment is registered.

!image.png

---

## From Business Context to Data Structure

The project started from a real operational context observed during my hospitality experience in Courmayeur, where I identified opportunities for better organization, information management and digitalization.

Before implementing the database in MySQL, I structured the initial information and tables in Excel. This helped define the entities, attributes and relationships required for the relational model.

The final database was designed as a foundation for future analysis. With reliable historical data, this structure could support deeper operational, predictive and business analysis, helping identify patterns, improve planning and support decision-making.

**Business observation → Data structure → Relational model → SQL implementation → Future analysis**

---

## Outcome

The project resulted in a structured relational database connecting the main operational areas of the business.

The solution provides a foundation for:

**Operational information → Structured data → Automated processes → Business analysis**

The project strengthened my ability to translate a real-world business context into a structured data solution using SQL and relational modeling.

---

## Key Takeaways

**Technical**

SQL · MySQL · Relational Data Modeling · Primary & Foreign Keys · Views · Functions · Stored Procedures · Triggers · Excel

**Business**

Process organization · Operational data · Information management · Business analysis · Data-driven decision support
