# Generate Shopping Receipts
Input: a list of items to purchase
Output: cost of each item, sales tax, and total

## Running the Tests
Run `bundle exec rake rspec` in your terminal 

⚠️  Warning: Some specs are broken. 

This is due to issues with money formatting caused by converting between
strings and integers. 

The rounding of amounts is also not working as intended.

## Notes
Some values, like which items are exempt from sales tax and the percent
taxed for import duty and sales tax, are hardcoded. Ideally this would
be handled dynamically in the future, given more information around the
possible exemptions and products for purchase, as well as any change in
tax percentages.
