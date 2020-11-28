class Cart
  def initialize(item, qty)
    @item = item
    @qty = qty
  end
  
  def calc_price
    if $arr[@item]['sale']
      if @qty >= $arr[@item]['sale_eligible_qty']
        ((@qty / $arr[@item]['sale_eligible_qty']) * ($arr[@item]['sale_price'] * $arr[@item]['sale_eligible_qty'])) + ($arr[@item]['unit_price'] * (@qty % $arr[@item]['sale_eligible_qty']))
      else
        @qty * $arr[@item]['unit_price']
      end
    else
      @qty * $arr[@item]['unit_price']
    end
  end
end