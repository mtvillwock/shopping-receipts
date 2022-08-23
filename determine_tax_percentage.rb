class DetermineTaxPercentage
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def call
    determine_tax_percentage
  end

  private

  def sales_taxable?
    return false if exempt_item?
    true
  end

  def exempt_item?
    item.include?("book") ||
    item.include?("chocolate") ||
    item.include?("pills")
  end

  def imported?
    item.include? "imported"
  end

  def determine_tax_percentage
    return 115 if sales_taxable? && imported?

    return 110 if sales_taxable? && !imported?

    return 105 if !sales_taxable? && imported?

    return 100 if !sales_taxable? && !imported?
  end
end
