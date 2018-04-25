require 'spec_helper'

describe Spree::Promotion::Rules::Currency, type: :model do
  let(:rule) { Spree::Promotion::Rules::Currency.new }
  let(:order) { create(:order) }

  context 'preferred currency is set' do
    before { rule.preferred_currency = "EUR" }

    it 'is eligible for correct currency' do
      allow(order).to receive(:currency) { "EUR" }
      expect(rule).to be_eligible(order)
    end

    it 'is not eligible for incorrect currency' do
      allow(order).to receive(:currency) { "USD" }
      expect(rule).not_to be_eligible(order)
    end
  end

  context 'preferred currency is not set' do
    it 'is not eligible for default currency' do
      allow(order).to receive(:currency) { "USD" }
      expect(rule).not_to be_eligible(order)
    end

    it 'is not eligible for other currency' do
      allow(order).to receive(:currency) { "EUR" }
      expect(rule).not_to be_eligible(order)
    end
  end
end
