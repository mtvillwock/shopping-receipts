require 'spec_helper'
require_relative '../calculate_sales_tax'

RSpec.describe CalculateSalesTax do
  context '#call' do
    context 'when given a quantity, price, and tax percentage' do
      it 'returns the correct amount of tax' do
        # 2 book at 12.49
        data = {
          quantity: 2,
          price: 12.49,
          tax_percentage: 100
        }
        service = CalculateSalesTax.new(data)
        expect(service.call).to eq 24.98
      end

      it 'returns the correct amount of tax' do
        # 1 imported box of chocolates at 10.00
        data = {
          quantity: 1,
          price: 10.00,
          tax_percentage: 105
        }
        service = CalculateSalesTax.new(data)
        expect(service.call).to eq 10.50
      end

      it 'returns the correct amount of tax' do
        # 1 music CD at 14.99
        data = {
          quantity: 1,
          price: 14.99,
          tax_percentage: 110
        }
        service = CalculateSalesTax.new(data)
        expect(service.call).to eq 16.49
      end

      it 'returns the correct amount of tax' do
        # 1 imported bottle of perfume at 27.99
        data = {
          quantity: 1,
          price: 27.99,
          tax_percentage: 115
        }
        service = CalculateSalesTax.new(data)
        expect(service.call).to eq 32.19
      end
    end
  end
end
