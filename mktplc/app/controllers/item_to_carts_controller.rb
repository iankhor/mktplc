class ItemToCartsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_cart

  def add_to_cart
    @params = params
    @cart = find_cart
    @cart.item_to_carts.create(item_id: params[:item_id])
    @itc = @cart.item_to_carts.last
    redirect_to my_cart_path
  end

  def show_cart
    @cart = find_cart
    @cart.total = get_total_price(@cart)
  end

  private

  def ensure_cart
    unless current_user.carts.any?
      current_user.carts.create
    end  
  end

  def find_cart
    if current_user.carts.last.paid?
      current_user.carts.create
    else
      current_user.carts.last
    end
  end

  def get_total_price(cart)
    total = 0
    cart.items.each do |item|
      total += item.price
    end
    total
  end



end
