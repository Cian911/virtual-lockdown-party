### Virtual Lockdown Party

##### Description

We have some customer records in a text file (customers.txt) -- one customer per line, JSON
lines formatted. We want to invite any customer within 100km of our Dublin office for some food
and drinks on us. Write a program that will read the full list of customers and output the names
and user ids of matching customers (within 100km), sorted by User ID (ascending).

### How to run & test

The easiest way to run this, `docker-compose`. To build and run the container, you can run the following.
```bash
# Build image
docker-compose build

# Run rspec & rubocop
docker-compose run app bundle exec rubocop
docker-compose run app bundle exec rspec

# Run the application to generate the output file
docker-compose run app ruby lockdown_party.rb
```
---
However, if you don't have docker, you can just run the following below.

###### Requirement

Please ensure you have ruby 3 installed.

Run the following:
```bash
bundle install
```

To run the application and generate an `output.txt`, you can run the following.
```bash
ruby entrypoint.rb
```

To test the application, you can run the following.
```bash
bundle exec rubocop
bundle exec rspec
```


