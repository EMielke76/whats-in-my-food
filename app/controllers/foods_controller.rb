class FoodsController < ApplicationController

  def index
    @foods = FoodFacade.new.find_food(params[:q])
    # require "pry"; binding.pry
  end
end