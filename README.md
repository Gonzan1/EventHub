# EventHub - Assignment 3

Software Engineering Course Project - Universidad de los Andes.

**Team Members:**
* Gonzalo Salinas
* Tomas Arratia
* Eduardo Ponce

## Project Description

EventHub is a centralized Rails application designed to create, discover, and join university events. This repository contains the Assignment 3 delivery, which builds upon the previous data model by introducing full CRUD operations, rich text editing, and complex business logic for event registrations and reviews.

## Setup Instructions

To run this application locally, ensure you have Ruby on Rails and PostgreSQL installed.

1. **Clone the repository and navigate to the folder:**
   ```bash
   git clone [https://github.com/Gonzan1/EventHub](https://github.com/Gonzan1/EventHub)
   cd EventHub

2. **Install dependencies:**
bundle install
3. **Database setup: Create the database, run migrations, and populate the seed data:**
rails db:drop db:create db:migrate db:seed
4. **Start the server**
rails server
**Open your browser and navigate to http://localhost:3000.**

**Relational Diagram**
The current data model reflecting the database state can be found in the data_model.png file included in this repository.

**Assignment 3 Updates**
- ActionText Integration: Rich text descriptions enabled for all events.
- Full CRUD Operations: Implemented for Events, Categories, and Venues.
- Business Logic: * Automated Waitlist management.
   - Review system restricted to attended/completed events.
   - Event lifecycle statuses (Draft, Published, Cancelled, Completed).
