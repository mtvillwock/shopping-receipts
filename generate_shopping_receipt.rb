require_relative './format_money'
require_relative './calculate_sales_tax'
require_relative './determine_tax_percentage'

class GenerateShoppingReceipt
  STANDARD_ITEM_REGEX = /(\d+)\s([a-zA-Z\s]+)\s(at{1})\s(\d+.\d{2})/

  def initialize(filename)
    @filename = filename
    @taxes = []
    @item_costs = []
  end

  def call
    process_file
  end

  def process_file
    result = []

    File.foreach(@filename) do |line|
      line_data = parse_item_date(line.chomp)
      tax_percentage = DetermineTaxPercentage.new(line_data[:item]).call
      tax = CalculateSalesTax.new(
        quantity: line_data[:quantity],
        price: line_data[:price],
        tax_percentage: tax_percentage
      ).call

      @taxes << tax

      pretax_cost = line_data[:quantity] * line_data[:price]
      @item_costs << pretax_cost

      result << format_item_output({
        quantity: line_data[:quantity],
        item: line_data[:item],
        total: line_data[:quantity] + tax,
      })
    end

    total_sales_tax = @taxes.sum
    grand_total = @item_costs.sum + total_sales_tax

    result << "Sales Taxes: #{FormatMoney.cents_to_dollar_string(total_sales_tax)}"
    result << "Total: #{FormatMoney.cents_to_dollar_string(grand_total)}"

    result.map { |string| string += "\n" }.join()
  end

  def format_item_output(quantity:, item:, total: )
    "#{quantity} #{item}: #{FormatMoney.cents_to_dollar_string(total)}"
  end

  def parse_item_date(line)
    captures = STANDARD_ITEM_REGEX.match(line).captures
    quantity, item, at, cost = captures

    {
      quantity: quantity.to_i,
      item: item,
      price: FormatMoney.dollar_string_to_cents(cost)
    }
  end
end

#### Pseudocode ####
# Read input
# Process each line
# -> parse line into quantity, item, and price
# Apply sales tax
# -> next if books, food, or medical products
# Apply import duty
# -> next if not import (but no expections if it is imported)
# Calculate price (quantity * price)
# Sum up sales taxes (import and normal sales tax) for all items
# calculate total cost of items and taxes
# For each item
# --> Print #{quantity} #{item}: #{quanity * price}
# Print sum of all sales taxes
# Print total cost

# Note: use integers as cents instead of using floats for money
