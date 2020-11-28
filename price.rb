class PriceTable
  attr_reader :price_list
  def initialize
    @price_list = {
      'milk' => {
        'unit_price' => 3.97,
        'sale_price' => 2.50,
        'sale_eligible_qty' => 2,
        'sale' => true
      },
      'bread' => {
        'unit_price' => 2.17,
        'sale_price' => 2.00,
        'sale_eligible_qty' => 3,
        'sale' => true
      },
      'banana' => {
        'unit_price' => 0.99,
        'sale_price' => nil,
        'sale_eligible_qty' => nil,
        'sale' => false
      },
      'apple' => {
        'unit_price' => 0.89,
        'sale_price' => nil,
        'sale_eligible_qty' => nil,
        'sale' => false
      }
    }
  end
end