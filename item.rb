class Cart
  def initialize(item, qty)
    @item = item
    @qty = qty
  end
  
  def calc_price
    if $price_list[@item]['sale']
      if @qty >= $price_list[@item]['sale_eligible_qty']
        ((@qty / $price_list[@item]['sale_eligible_qty']) * ($price_list[@item]['sale_price'] * $price_list[@item]['sale_eligible_qty'])) + ($price_list[@item]['unit_price'] * (@qty % $price_list[@item]['sale_eligible_qty']))
      else
        @qty * $price_list[@item]['unit_price']
      end
    else
      @qty * $price_list[@item]['unit_price']
    end
  end
end