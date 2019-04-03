class CartController < ApplicationController
  before_action :authenticate_user!, except: [:view_order]

  def add_to_cart
    line_item = LineItem.create(product_id: params[:product_id], quantity: params[:quantity])
    if line_item.quantity != nil
      line_item.update(line_item_total: (line_item.quantity * line_item.product.price))
      flash[:order] = "Successfully added to cart"
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
    @subtotal = @line_items.pluck(:line_item_total).reduce(:+)
  end

  def order_complete
    @order = Order.find(params[:order_id])
    @amount = (@order.grand_total.to_f.round(2) * 100).to_i

    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount,
      :description => 'Rails Stripe customer',
      :currency => 'usd'
    )

    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to cart_path
  end

  def checkout
  line_items = LineItem.all
  @order = Order.create(user_id: current_user.id, subtotal: 0)

  line_items.each do |line_item|
    line_item.product.update(quantity: (line_item.product.quantity - line_item.quantity))
    @order.order_items[line_item.product_id] = line_item.quantity 
    @order.subtotal += line_item.line_item_total
  end
  @order.save

  @order.update(sales_tax: (@order.subtotal * 0.08))
  @order.update(grand_total: (@order.sales_tax + @order.subtotal))

  line_items.destroy_all
  end

end
