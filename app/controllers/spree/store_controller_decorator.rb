# frozen_string_literal: true
module Spree
  StoreController.class_eval do
    before_action :set_locale

      def set_locale
        if current_store.code != current_currency
              case current_store.code
                when 'EUR'
                  Spree::Config[:currency] = 'EUR'
                when 'GBP'
                  Spree::Config[:currency] = 'GBP'
                when 'USD'
                  Spree::Config[:currency] = 'USD'
              end
        end
      end

  end
end
