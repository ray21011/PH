class Admin::ContactsController < ApplicationController

	def index
		@contacts = Contact.page(params[:page]).order(created_at: :desc).per(16)
		@users = Customer.all
	end

	def edit
		@contact = Contact.find(params[:id])
	end

	def update
		contact = Contact.find(params[:id]) #contact_mailer.rbの引数を指定
	   	contact.update(contact_params)
	   	customer = contact.customer
	   	redirect_to admin_contacts_path
	end

	def destroy
		contact = Contact.find(params[:id])
		contact.destroy
		@contacts = Contact.page(params[:page]).order(created_at: :desc).per(16)
		@users = Customer.all
		render :index
	end

	private
	def contact_params
		params.require(:contact).permit(:title, :body, :reply)
	end
end
