require 'spec_helper'
require_relative '../generate_shopping_receipt'

RSpec.describe GenerateShoppingReceipt do
  context '#call' do
    context 'when given a file with no imported items' do
      it 'returns correct item costs, sales tax, and total cost' do
        file = 'input_1.txt'
        output = 'output_1.txt'
        expect(GenerateShoppingReceipt.new(file).call).to eq File.read(output)
      end
    end

    context 'when given a file with only imported items' do
      it 'returns correct item costs, sales tax, and total cost' do
        file = 'input_2.txt'
        output = 'output_2.txt'
        expect(GenerateShoppingReceipt.new(file).call).to eq File.read(output)
      end
    end

    context 'when given a file with imported and non-imported items' do
      it 'returns correct item costs, sales tax, and total cost' do
        file = 'input_3.txt'
        output = 'output_3.txt'
        expect(GenerateShoppingReceipt.new(file).call).to eq File.read(output)
      end
    end
  end
end
