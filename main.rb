@require_relative "item"

def createCheckOutBill(cart)
  items_in_cart = []
  cart.each do |item, qty|
    newItem = Item.new(item, qty)
    # items_in_cart.push({
    #             'item' => item,
    #             'qty' => qty,
    #             'price' => newItem.calc_price
    #           })
    items_in_cart.push([item, qty, newItem.calc_price])
  end
  items_in_cart
end

def calc_bill bill
  total_before_discount = 0
  total_after_discount = 0
  bill.each do |arr|
    total_after_discount += arr[2]
    total_before_discount += $price_list[arr[0]]["unit_price"] * arr[1]
  end
  puts "Total price : $#{total_after_discount.round(2)}"
  puts "You saved $#{(total_before_discount-total_after_discount).round(2)} today"
end 

def main
  puts 'enter the list of items seperated by a comma'
  list = gets.chomp.downcase.gsub(/\s+/, '').split(',')
  cart = {}
  list.each { |item| createItemList item, cart }
  checkOutBill = createCheckOutBill cart
  calc_bill checkOutBill
end

main 
