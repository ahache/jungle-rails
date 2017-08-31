class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def confirmation_email(order)
    @order = order
    @items = order.line_items
    mail(to: @order.email, subject: "Confirmation for order #{order.id}")
  end
end
