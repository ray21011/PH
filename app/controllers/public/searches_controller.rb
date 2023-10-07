class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @range = params[:range]
    @items = Item.looks(params[:search], params[:word])
  end
end
