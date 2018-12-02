# Spree Multi-Currency With Location Detection

[![Build Status](https://travis-ci.org/MatthewKennedy/spree_multi_currency.svg?branch=master)](https://travis-ci.org/MatthewKennedy/spree_multi_currency)

Provides UI to allow configuring multiple currencies in Spree.

This provides 3 preferences:

* allow_currency_change - Allow the users to change their currency via the currency set action.
* show_currency_selector - Display the currency selector in the main nav bar.  This will only display if there are multiple supported currencies, and allow_currency_change is on.
* supported_currencies - A comma separated list of


## Improvements Over The Standard Version
This version of the extension reads geo location and also uses language defined urls from the Spree Globalize extension to set the currency for certain regions and user locations.

### Requires CloudFlare

To function correctly this extension relies on CloudFlare and the IP Geolocation setting to be switched on. By reading the current browsers location from the CF-IPCountry header.
---

### Requires spree_globalize extension.
To set currency depending on local.

## Installation

1. Add this extension to your Gemfile with these lines:

  ```ruby
  gem 'spree_i18n', github: 'spree-contrib/spree_i18n'
  gem 'spree_globalize', github: 'spree-contrib/spree_globalize'
  gem 'spree_multi_currency', github: 'spree-kit/spree_multi_currency'
  ```

2. Install the gem using Bundler:
  ```ruby
  bundle install
  ```

3. Copy & run migrations
  ```ruby
  bundle exec rails g spree_globalize:install
  bundle exec rails g spree_multi_currency:install
  ```

4. Restart your server

  If your server was running, restart it so that it can find the assets properly.

---

## Contributing

See corresponding [guidelines][1]

---
