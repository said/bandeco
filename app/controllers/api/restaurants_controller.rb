# -*- encoding : utf-8 -*-
module Api
  class RestaurantsController < ApplicationController
    
    before_action :set_restaurant , only: [:show, :edit, :update, :destroy]
    
    class Restaurant < ::Restaurant
      def as_json(options ={})
        super.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")}
      end
    end
    
    respond_to :json
    
    def index
      respond_with Restaurant.all
    end

    def show
      # descobrindo a segunda-feira e o domingo
      @monday = Date.today.beginning_of_week()
      @sunday = @monday + 6
      @menus = Menu.where(:restaurant_id => @restaurant.id).where(:day => (@monday)..(@sunday)).order('meal_id ASC, day ASC')

      @response = {:restaurant => @restaurant, :menus => @menus}

      respond_with @response
    end

    def new
      @restaurant = Restaurant.new
      respond_with @restaurant
    end

    def create
      @restaurant = Restaurant.new(restaurant_params)
      if @restaurant.save
        respond_with @restaurant
      else
        respont_with @restaurant.errors
      end
    end

    def edit
      respont_with @restaurant
    end

    def update

      if @restaurant.update_attributes(restaurant_params)
        respond_with :no_content
      else
        form
        respond_with @restaurant.errors

      end
    end

    def destroy
      @restaurant.destroy
      respond_with :no_content
    end

    private

    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :tel)
    end

  end
end