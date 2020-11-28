def main
  puts 'enter the list of items seperated by a comma'
  list = gets.chomp.downcase.gsub(/\s+/, '').split(',')
end

main