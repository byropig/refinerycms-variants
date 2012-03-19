# Refinery CMS Product Variants

Product variants for your [Refinery CMS](http://refinerycms.com) website, that is making use of the following gem:

+ Products - https://github.com/julesce/refinerycms-products (1.0)

This version of `refinerycms-variants` supports Rails 3.0.x.

## Requirements

Refinery CMS version 1.0.x.

## Install

Make sure that the [products](https://github.com/julesce/refinerycms-products) gem has been installed.

Open up your ``Gemfile`` and add the following:

    gem 'refinerycms-variants', '~> 1.0.0'

Now, run:

    bundle install

Next, run:

    rails generate refinerycms_variants

Migrate your database:

    rake db:migrate