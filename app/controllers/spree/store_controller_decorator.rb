module Spree
  StoreController.class_eval do
    before_action :set_locale

    def set_locale

      if locale == :'en-GB'
        params[:currency] = "GBP"
        @currency = supported_currencies.find { |currency| currency.iso_code == params[:currency] }
        # Make sure that we update the current order, so the currency change is reflected.
        current_order.update_attributes!(currency: @currency.iso_code) if @currency && current_order
        session[:currency] = params[:currency] if Spree::Config[:allow_currency_change]
      end

      if locale == :'en-AU'
        params[:currency] = "AUD"
        @currency = supported_currencies.find { |currency| currency.iso_code == params[:currency] }
        # Make sure that we update the current order, so the currency change is reflected.
        current_order.update_attributes!(currency: @currency.iso_code) if @currency && current_order
        session[:currency] = params[:currency] if Spree::Config[:allow_currency_change]
      end

      if locale == :'en-US'
        params[:currency] = "USD"
        @currency = supported_currencies.find { |currency| currency.iso_code == params[:currency] }
        # Make sure that we update the current order, so the currency change is reflected.
        current_order.update_attributes!(currency: @currency.iso_code) if @currency && current_order
        session[:currency] = params[:currency] if Spree::Config[:allow_currency_change]
      end

    else

      if params[:currency].present?
        @currency = supported_currencies.find { |currency| currency.iso_code == params[:currency] }
        # Make sure that we update the current order, so the currency change is reflected.
        current_order.update_attributes!(currency: @currency.iso_code) if @currency && current_order
        session[:currency] = params[:currency] if Spree::Config[:allow_currency_change]
      end
      
    end
  end
end
