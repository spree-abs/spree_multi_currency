module Spree
  StoreController.class_eval do
    before_action :set_locale

    def visitor_location
      euro_countries = [ 'AT', 'BE', 'BG', 'HR', 'CY', 'CZ', 'DK', 'EE', 'FI', 'FR', 'DE', 'EL', 'HU', 'IE', 'IT', 'LU', 'MT', 'NL', 'PL', 'PT', 'RO', 'SK', 'SI', 'ES', 'SV' ]
      if euro_countries.include? request.location.country_code.to_s
        visitor_location = 'EUR'
      else
        visitor_location = request.location.country_code
      end
    end

    def set_locale

      if (cookies[:returning].blank?)

          if locale == I18n.default_locale && request.location.country_code.present?
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
