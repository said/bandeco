 # -*- encoding : utf-8 -*-
class RestaurantsController < ApplicationController
  
  before_action :set_restaurant , only: [:show, :edit, :update, :destroy]
  
  def index
    @restaurants = Restaurant.all
  end

  def show
    # descobrindo a segunda-feira e o domingo
    @monday = Date.today.beginning_of_week()
    @sunday = @monday + 6 
    @menus = Menu.where(:restaurant_id => @restaurant.id).where(:day => (@monday)..(@sunday)).order('meal_id ASC, day ASC')
  end

  def new
    @campusunits = Campusunit.all
    @restaurant = Restaurant.new
  end

  def create
    @campusunits = Campusunit.all
    @restaurant = Restaurant.new(restaurant_params)
    
    if @restaurant.save
      redirect_to(@restaurant, :notice => 'Restaurante adicionado com sucesso.')
    else
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to(@restaurant, :notice => 'O restaurante foi atualizado com sucesso.')   
    else
      render :action => "edit"
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_url
  end
  
  private
  
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    @campusunit = Campusunit.find(@restaurant.campusunit_id)
    @restaurants = Restaurant.where(:campusunit_id => @campusunit.id)
  end
  
  def restaurant_params
    params.require(:restaurant).permit(:campusunit_id, :name, :address, :tel)
  end

end
