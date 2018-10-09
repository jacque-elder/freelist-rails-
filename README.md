# Freelist Application

This is a personal project application written by Jacqueline Elder. It is a website where freelancers can create accounts and advertize their services as well as leave reviews for others' services.

You can view a sample of the running application here (https://immense-caverns-30689.herokuapp.com/)

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```