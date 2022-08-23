class FormatMoney
  def self.dollar_string_to_cents(dollar_amount)
    dollars, cents = dollar_amount.split(".").map(&:to_i)
    dollars_as_cents = dollars * 100
    result = dollars_as_cents + cents
  end

  def self.cents_to_dollar_string(cents)
    cent_string = cents.to_s.chars

    if cent_string.length > 2
      decimals = cent_string[cent_string.length-2..cent_string.length-1].join()
      dollars = cent_string[0..cent_string.length-3].join()
      "#{dollars}.#{decimals}"
    else
      "0.#{cent_string.join()}"
    end
  end
end
