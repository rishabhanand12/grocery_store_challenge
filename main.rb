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

def main
  puts 'enter the list of items seperated by a comma'
  list = gets.chomp.downcase.gsub(/\s+/, '').split(',')
  cart = {}
  list.each { |item| createItemList item, cart }
end

main
