module Spree
  class Promotion
    module Rules
      class Currency < Spree::PromotionRule
        preference :currency, :string

        def applicable?(promotable)
          promotable.is_a?(Spree::Order)
        end

        def eligible?(order, options = {})
          order.currency == preferred_currency
        end
      end
    end
  end
end
