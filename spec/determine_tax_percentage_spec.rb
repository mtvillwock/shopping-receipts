require 'spec_helper'
require_relative '../determine_tax_percentage'

RSpec.describe DetermineTaxPercentage do
  context '#determine_tax_percentage' do
    context 'when item is not exempt from sales tax and is imported' do
      # TODO: fix it block wording
      it 'returns 15 percent' do
        item = "imported bottle of perfume"
        service = DetermineTaxPercentage.new(item)
        expect(service.call).to eq 115
      end
    end

    context 'when item is not exempt from sales tax and is not imported' do
      it 'returns 10 percent' do
        item = "bottle of perfume"
        service = DetermineTaxPercentage.new(item)
        expect(service.call).to eq 110
      end
    end

    context 'when item is exempt from sales tax and is imported' do
      it 'returns 5 percent' do
        item = "imported boxes of chocolate"
        service = DetermineTaxPercentage.new(item)
        expect(service.call).to eq 105
      end
    end

    context 'when item is exempt from sales tax and is not imported' do
      it 'returns 0 percent' do
        item = "book"
        service = DetermineTaxPercentage.new(item)
        expect(service.call).to eq 100
      end
    end
  end
end
