class CalculateSalesTax
  attr_reader :quantity, :price, :tax_percentage

  def initialize(quantity:, price:, tax_percentage:)
    @quantity = quantity
    @price = price
    @tax_percentage = tax_percentage
  end

  def call
    calculate_sales_tax
  end

  private

  def calculate_sales_tax
    pretax_cost = quantity * price
    taxed_cost = pretax_cost * tax_percentage
    taxable_subtotal = (taxed_cost.to_f / 100)
    total_with_tax = taxable_subtotal.round(2)
  end
end
