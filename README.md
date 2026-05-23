<<<<<<< HEAD
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
=======
# EventHub - Assignment 2
Software Engineering Course Project - Universidad de los Andes.

**Team Members:**
* Gonzalo Salinas
* Tomas Arratia 
* Eduardo Ponce

## Project Description
EventHub is a centralized Rails application designed to create, discover, and join university events. This repository contains the Assignment 2 delivery, which includes the implementation of models, associations, validatons, enums, read-only views, and a seeded database.

## Setup Instructions

To run this application locally, ensure you have Ruby on Rails and PostgreSQL installed.

1. **Clone the repository and navigate to the folder:**
   git clone https://github.com/Gonzan1/EventHub
   cd EventHub

2. **Install dependencies:**
   bundle install

3. **Database setup:**
Create the database, run the migrations, and populate it with the seed data:
   rails db:create db:migrate db:seed

4. **Start the server:**
   rails server
Open your browser and navigate to http://localhost:3000.


## Relational Diagram
The current data model reflecting the database state can be found in the data_model.png file included in this repository
>>>>>>> 0df3deb28f8bb31092aced539981ba140fbcd918

## Assignment 3 Updates
* **ActionText Integration:** Rich text descriptions enabled for all events.
* **Full CRUD Operations:** Implemented for Events, Categories, and Venues.
* **Business Logic:** * Automated Waitlist management.
  * Review system restricted to attended/completed events.
  * Event lifecycle statuses (Draft, Published, Cancelled, Completed).