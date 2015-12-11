class ChargesController < ApplicationController

									def create
						  # Amount in cents
						  @amount = 18000

						  customer = Stripe::Customer.create(
						    :email => params[:stripeEmail],
						    :source  => params[:stripeToken]
						  )

						  charge = Stripe::Charge.create(
						    :customer    => customer.id,
						    :amount      => @amount,
						    :description => 'Belize Beauty',
						    :currency    => 'gbp'
						  )

						rescue Stripe::CardError => e
						  flash[:error] = e.message
						  redirect_to new_charge_path
						end


end