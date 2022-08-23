require 'spec_helper'
require_relative '../format_money'

RSpec.describe FormatMoney do
  context '#dollar_string_to_cents' do
    it 'returns an integer equal in cents to the formatted dollar and cents string' do
      expect(FormatMoney.dollar_string_to_cents("27.99")).to eq 2799
    end
  end

  context '#cents_to_dollar_string' do
    it 'returns a string formatted as dollars and cents equal to the cents integer' do
      expect(FormatMoney.cents_to_dollar_string(2799)).to eq "27.99"
    end
  end
end
