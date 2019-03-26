# frozen_string_literal: true
module Spree
  StoreController.class_eval do
    before_action :set_locale

      def set_locale
        if current_store.code != current_currency
          Spree::Config[:currency] = current_store.code
        end
      end

  end
end
