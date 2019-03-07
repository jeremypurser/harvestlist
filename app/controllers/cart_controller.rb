class CartController < ApplicationController
  before_action :authenticate_user!, except: [:add_to_cart, :view_order]

  def add_to_cart
    
    line_item = LineItem.create(product_id: params[:product_id], quantity: params[:quantity])
    if line_item.quantity != nil
      line_item.update(line_item_total: (line_item.quantity * line_item.product.price))
      flash[:order] = "Successfully add to cart"
      redirect_back(fallback_location: root_path)
    else 
      flash[:bad_order] = "You must enter a quantity"
      redirect_back(fallback_location: root_path)
    end
  end

  def remove
    line_item = LineItem.find(params[:id])
    line_item.destroy
    respond_to do |format|
      format.html { redirect_to view_order_path, notice: 'Item ws removed' }
      format.json { head :no_content }
    end
  end

  def view_order
    @line_items = LineItem.all
    @total = @line_items.pluck(:line_item_total).reduce(:+)
  end

  def checkout
    line_items = LineItem.all
    @order = Order.create(user_id: current_user.id, total: 0)

    sellers = []
    line_items.each do |line_item|
      sellers.push(line_item.product.user)
      line_item.product.update(quantity: (line_item.product.quantity - line_item.quantity))
      @order.order_items[line_item.product_id] = line_item.quantity 
      @order.total += line_item.line_item_total
    end

    email_sellers = sellers.uniq
    @order.save
    @email_sellers = email_sellers
    
    email_sellers.each do |seller|
      OrderMailer.order_email(seller, current_user).deliver_now
    end
    line_items.destroy_all
  end

end
