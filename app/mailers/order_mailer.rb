class OrderMailer < ApplicationMailer
  def order_email(seller, buyer)
    @seller = seller
    @buyer = buyer
    mail(to: @seller.email, subject: 'New HarvestList Order')
  end
end
