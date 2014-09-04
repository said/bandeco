# -*- encoding : utf-8 -*-
module Api
  class MenusController < ApplicationController
    
    before_action :set_menu , only: [:show, :edit, :update, :destroy]
    
    class Menu < ::Menu
      def as_json(options ={})
        super.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")}
      end
    end
    
    respond_to :json

    def index
      respond_with Menu.all
    end

    def show
      # carregando comentários do cardápio
      @menuscomments = Menuscomment.where(:menu_id => @menu.id).order('created_at DESC')
      
      @response = {:comments => @menuscomments, :menu => @menu}
    
      respond_with @response
    end

    def new
      @menu = Menu.new
      
      respond_with @menu
    end
  
    def create
      @menu = Menu.new(menu_params)
      
      if @menu.save
        respond_with @menu
      else
        respond_with @menu.erros
      end
    end

    def edit
      respond_with @menu
    end

    def update
      
      if @menu.update_attributes(menu_params)
        respond_with :no_content
      else
        respond_with @menu.errors
      end
    end

    def destroy
      @menu.destroy
      respond_with :no_content
    end

    private
    
    def set_menu
      @restaurants = Restaurant.all
      @meals = Meal.all
      @menu = Menu.find(params[:id])
    end
  
    def menu_params
      params.require(:menu).permit(:day, :restaurant_id, :meal_id, :options, :kcal)
    end
    
  end
end