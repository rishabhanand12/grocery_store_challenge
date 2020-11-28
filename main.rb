require 'terminal-table'
require_relative "item"
require_relative "price"

$price_list = PriceTable.new.price_list

def createItemList(item, cart)
  case item
    when 'milk'
      if cart['milk'].nil?
        cart['milk'] = 1
      elsif cart['milk'] += 1
      end
  
    when 'bread'
      if cart['bread'].nil?
        cart['bread'] = 1
      elsif cart['bread'] += 1
      end
  
    when 'apple'
      if cart['apple'].nil?
        cart['apple'] = 1
      elsif cart['apple'] += 1
      end
  
    when 'banana'
      if cart['banana'].nil?
        cart['banana'] = 1
      elsif cart['banana'] += 1
      end
    end
end

def createCheckOutBill(cart)
  items_in_cart = []
  cart.each do |item, qty|
    newItem = Item.new(item, qty)
    # items_in_cart.push({
    #             'item' => item,
    #             'qty' => qty,
    #             'price' => newItem.calc_price
    #           })
    items_in_cart.push([item, qty, newItem.calc_price.round(2)])
  end
  items_in_cart
end

def createTable bill
  table = Terminal::Table.new
  table.title = 'Bill'
  table.headings = ['Item', 'Quantity', 'Price']
  table.rows = bill
  puts table
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
  createTable checkOutBill
  calc_bill checkOutBill
end

main