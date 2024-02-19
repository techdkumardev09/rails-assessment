# README

This README provides the necessary steps to get the application up and running.

## Ruby and Rails Versions
* Ruby version: 3.0.0
* Rails version: 7.0.8

## Setup Instructions
1. Install Ruby version 3.0.0 and Rails version 7.0
2. Clone this repository: `git clone git@github.com:techdkumardev09 rails-assessment.git`
3. Change into the project directory: `cd rails-assessment`
4. Run `bundle install` to install gem dependencies.
5. Set up the database:
   - Create a new database: `rails db:create`
   - Run migrations: `rails db:migrate`
   - Seed the database with sample data: `rails db:seed`

### Running the Test Suite
- Run `bundle exec rspec` to execute the test cases.
