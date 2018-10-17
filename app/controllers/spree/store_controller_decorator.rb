module Spree
  StoreController.class_eval do
    before_action :set_locale

    def set_locale
        euro_countries = [ 'AT', 'BE', 'BG', 'HR', 'CY', 'CZ', 'DK', 'EE', 'FI', 'FR', 'DE', 'EL', 'HU', 'IE', 'IT', 'LU', 'MT', 'NL', 'PL', 'PT', 'RO', 'SK', 'SI', 'ES', 'SV' ]
        # Only Run code once so that user can change currency if they wish
        if (cookies[:returning].blank?)

# START If website is set to default location and the users country code is not nill and is not a bot.
          if locale == I18n.default_locale && !request.location.country_code.nil? && !browser.bot?

            if euro_countries.include? request.location.country_code.to_s
              visitor_location = 'EUR'
            else
              visitor_location = request.location.country_code
            end

              if visitor_location == "EUR"
                params[:currency] = visitor_location
                @currency = supported_currencies.find { |currency| currency.iso_code == params[:currency] }
                current_order.update_attributes!(currency: @currency.iso_code) if @currency && current_order
                session[:currency] = params[:currency] if Spree::Config[:allow_currency_change]

              elsif visitor_location == "GB"
                params[:currency] = "GBP"
                @currency = supported_currencies.find { |currency| currency.iso_code == params[:currency] }
                current_order.update_attributes!(currency: @currency.iso_code) if @currency && current_order
                session[:currency] = params[:currency] if Spree::Config[:allow_currency_change]

              elsif @visitor_location == "AU"
                params[:currency] = "AUD"
                @currency = supported_currencies.find { |currency| currency.iso_code == params[:currency] }
                current_order.update_attributes!(currency: @currency.iso_code) if @currency && current_order
                session[:currency] = params[:currency] if Spree::Config[:allow_currency_change]

              elsif @visitor_location == "CA"
                params[:currency] = "CAD"
                @currency = supported_currencies.find { |currency| currency.iso_code == params[:currency] }
                current_order.update_attributes!(currency: @currency.iso_code) if @currency && current_order
                session[:currency] = params[:currency] if Spree::Config[:allow_currency_change]

              elsif
                params[:currency] = "USD"
                @currency = supported_currencies.find { |currency| currency.iso_code == params[:currency] }
                current_order.update_attributes!(currency: @currency.iso_code) if @currency && current_order
                session[:currency] = params[:currency] if Spree::Config[:allow_currency_change]
              end
# Else respond to the url local and set currency to match
          elsif locale == :'en-GB'
            params[:currency] = "GBP"
            @currency = supported_currencies.find { |currency| currency.iso_code == params[:currency] }
            current_order.update_attributes!(currency: @currency.iso_code) if @currency && current_order
            session[:currency] = params[:currency] if Spree::Config[:allow_currency_change]

          elsif locale == :'en-AU'
            params[:currency] = "AUD"
            @currency = supported_currencies.find { |currency| currency.iso_code == params[:currency] }
            current_order.update_attributes!(currency: @currency.iso_code) if @currency && current_order
            session[:currency] = params[:currency] if Spree::Config[:allow_currency_change]

          elsif locale == :'en-CA'
            params[:currency] = "CAD"
            @currency = supported_currencies.find { |currency| currency.iso_code == params[:currency] }
            current_order.update_attributes!(currency: @currency.iso_code) if @currency && current_order
            session[:currency] = params[:currency] if Spree::Config[:allow_currency_change]

          elsif locale == :'en-US'
            params[:currency] = "USD"
            @currency = supported_currencies.find { |currency| currency.iso_code == params[:currency] }
            current_order.update_attributes!(currency: @currency.iso_code) if @currency && current_order
            session[:currency] = params[:currency] if Spree::Config[:allow_currency_change]
          end
      end

      if params[:currency].present?
        @currency = supported_currencies.find { |currency| currency.iso_code == params[:currency] }
        current_order.update_attributes!(currency: @currency.iso_code) if @currency && current_order
        session[:currency] = params[:currency] if Spree::Config[:allow_currency_change]
      end
    end

  end
end
