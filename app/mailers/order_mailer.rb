class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
  
   def order_email(order)
    @order = order 
    mail(to: "mendel.kwan@shaw.ca", subject: "TEST: From Rails Jungle")
   end
end
