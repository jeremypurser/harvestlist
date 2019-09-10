## Harvest List

[Harvest List][heroku] is a social media marketplace app for chefs to follow the farms they work with, and for farmers to quickly update their inventory.

## Motivation

Harvest List is my final project for the Code Immersion web development course at Tech Talent South, Raleigh. I wanted to make something that I thought would be useful to communities I was familiar with. I have previously worked at [farms](http://www.fourleaffarm.org/) and restaurants, and thought this could be a tool to streamline the process selling produce and buying ingredients.

## Screenshots

![Harvest List Screenshot](http://www.jeremypurser.com/assets/images/hl_ss_1.png)

![Harvest List Screenshot](http://www.jeremypurser.com/assets/images/hl_ss_2.png)

![Harvest List Screenshot](http://www.jeremypurser.com/assets/images/hl_ss_3.png)

## Tech/framework used

Built with

- Ruby on Rails
- Bootstrap
- HTML / CSS
- jQuery
- Stripe API

## Installation

To run locally, clone the repository and `cd` into the app's directory. Within the directory on the command line run `bundle install` to install the gem file dependencies. Then start the server with `rails server`.

## How to use?

As you sign up you choose a `role`, a seller or a buyer, which would be a farmer or chef, respectively. As a farmer you have the ability to upload new products. As a chef you have the ability to to follow farmers to create a feed of new products from the farms you follow, as well as the ability to buy those products.

You must sign up with a role of buyer to purchase products. You can pay with a test card using a [test card number](https://stripe.com/docs/testing#cards).

![Stripe Payment Screenshot](http://jeremypurser.com/assets/images/hl_ss_4.png)

[heroku]: https://harvestlist.herokuapp.com/
