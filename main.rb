require 'terminal-table'
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

def main
  puts 'enter the list of items seperated by a comma'
  list = gets.chomp.downcase.gsub(/\s+/, '').split(',')
  cart = {}
  list.each { |item| createItemList item, cart }
  checkOutBill = createCheckOutBill cart
  createTable checkOutBill
end

main 
