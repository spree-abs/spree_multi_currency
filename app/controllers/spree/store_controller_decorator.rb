# frozen_string_literal: true
module Spree
  StoreController.class_eval do
    before_action :set_locale

      def set_locale
        # Define a list of countires that use Euros.
        euro_zone_countries = [ 'AT', 'BE', 'BG', 'HR', 'CY', 'CZ', 'DK', 'EE', 'FI', 'FR', 'DE', 'EL',
                              'HU', 'IE', 'IT', 'LU', 'MT', 'NL', 'PL', 'PT', 'RO', 'SK', 'SI', 'ES', 'SV' ]

        if current_store.code != current_currency
          
          # IF the store is loaded with default store code, and the visitor is not a bot.
          if current_store.code == 'spree' && !browser.bot?

              # IF the visitor is located in a Euro Zone country (EZ)
              if euro_zone_countries.include? request.headers["CF-IPCountry"].to_s
                visitor_location = "EZ"
                else
                visitor_location = request.headers["CF-IPCountry"].to_s
              end

              case visitor_location
                when 'EZ'
                  Spree::Config[:currency] = 'EUR'
                when 'GB'
                  Spree::Config[:currency] = 'GBP'
                else
                  Spree::Config[:currency] = 'USD'
              end

          # ELSE check for CURRENCY in STORE CODE
          else
              case current_store.code
                when 'EUR'
                  Spree::Config[:currency] = 'EUR'
                when 'GBP'
                  Spree::Config[:currency] = 'GBP'
                else
                  Spree::Config[:currency] = 'USD'
              end
          end
        end
    end

  end
end
