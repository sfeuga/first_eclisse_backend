# MSCM Backend
## opensource Music School and Courses Management software

Quick link to the project [🔭 Dashboard](https://gitlab.com/MSCM/backend/boards?=)

### Introduction
This is a backend micro service to manage Courses, Students, Teachers and Resources for a Music School.

The purpose of this services is to provide a easy way (a RESTful API) to manage:
* Courses (Price, Schedule, ...)
* Students (Bundle of courses they payed for, contacts, ...)
* Teachers (contacts, list of students, ...)
* Room and Places (hardware list, number of student this place can handle, ...)
* All other resources needed for a Music school (billing, pricing, and all Accounting needs, ...) 


### Deployment
This service can be run locally or in Docker.

First of all, you need to clone this repo.

* To use it locally, you need to Ruby and Bundler. Type `bundle install` to install all needed dependancies.
After that, just run `bundle exec puma -Ilib -Iapp -C config/puma.rb`.
* To use it via Docker, type `docker-compose build` and `docker-compose up`.

### Reporting Bugs
Open a new issue and fill all mandatory fields.
