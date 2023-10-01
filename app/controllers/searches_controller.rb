class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
    @items = Item.looks(params[:search], params[:word])
  end
end
