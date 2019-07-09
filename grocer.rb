def consolidate_cart(cart)
  # cart is an array of hashes
  newCart = {}

  cart.each do |k| 
  
    if newCart[k.keys[0]]
      newCart[k.keys[0]][:count] += 1
    else
      newCart[k.keys[0]] = k[k.keys[0]]
      newCart[k.keys[0]][:count] = 1
    end
  end
  newCart
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    if cart.keys.include?(coupon[:item])
      if cart[coupon[:item]][:count] >= coupon[:num]
        itemwithCoupon = "#{coupon[:item]} W/COUPON"
        if cart[itemwithCoupon]
          cart[itemwithCoupon][:count] += coupon[:num]
          cart[coupon[:item]][:count] -= coupon[:num]
        else
          cart[itemwithCoupon] = {}
          cart[itemwithCoupon][:price] = (coupon[:cost] / coupon[:num])
          cart[itemwithCoupon][:clearance] = cart[coupon[:item]][:clearance]
          cart[itemwithCoupon][:count] = coupon[:num]
          cart[coupon[:item]][:count] -= coupon[:num]
        end
      end
    end
  end
  cart

end

def apply_clearance(cart)
  
  cart.each do |item|
    if item[1][:clearance] == true
      item [1][:price] = (item[1][:price] * 0.80).round(2)
    end
  end
  cart
end
require 'pry'
def checkout(cart, coupons)
   newCart = {}
   
  if cart.length == 1
    consolidate_cart(cart)
    apply_coupons(cart[0], coupons)
    apply_clearance(cart[0])
     
  cart[0].values[0][:price]
  end
  
  if cart.length > 1;
  
    cart.each do |item|
          newCart[item]
  end
  
    if newCart.length > 1;
      apply_coupons(newCart, coupons)
      apply_clearance(newCart)
      newCart[0].values[0][:price]
    end
  end

end