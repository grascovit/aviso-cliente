[![Build Status](https://travis-ci.org/grascovit/aviso-cliente.svg?branch=master)](https://travis-ci.org/grascovit/aviso-cliente)
[![Maintainability](https://api.codeclimate.com/v1/badges/deee625995a253ec6d39/maintainability)](https://codeclimate.com/github/grascovit/aviso-cliente/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/deee625995a253ec6d39/test_coverage)](https://codeclimate.com/github/grascovit/aviso-cliente/test_coverage)

# Aviso Cliente

Rails application to warn clients about court hearings and lawsuit follow-up.

#### Setup
To get the application running, follow the steps below:
```shell
bundle install
```

Create a file named `.env` and paste the contents from the `.env.example` file into it.
Provide the required environment variables.

After this, execute the following steps:
```shell
rails db:setup
```
Finally, run it:
```shell
rails s
```

#### Tests
To run the test suite, run:
```shell
bundle exec rspec
```

#### Static code analysis
To run Rubocop, run:
```shell
rubocop -a
```
