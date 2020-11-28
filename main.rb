def createItemList(item, cart)
  case item
    when 'milk'
      if bill['milk'].nil?
        bill['milk'] = 1
      elsif bill['milk'] += 1
      end
  
    when 'bread'
      if bill['bread'].nil?
        bill['bread'] = 1
      elsif bill['bread'] += 1
      end
  
    when 'apple'
      if bill['apple'].nil?
        bill['apple'] = 1
      elsif bill['apple'] += 1
      end
  
    when 'banana'
      if bill['banana'].nil?
        bill['banana'] = 1
      elsif bill['banana'] += 1
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