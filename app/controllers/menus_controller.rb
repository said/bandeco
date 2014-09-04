# -*- encoding : utf-8 -*-
class MenusController < ApplicationController
  
  before_action :set_menu , only: [:show, :edit, :update, :destroy]
  
  def index
    @restaurants = Restaurant.all
    @meals = Meal.all
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
    
    @menuscomments = Menuscomment.where(:menu_id => @menu.id).order('created_at DESC')
  end

  def new
    @restaurants = Restaurant.all
    @meals = Meal.all
    @menu = Menu.new
  end

  def create
    @restaurants = Restaurant.all
    @meals = Meal.all
    @menu = Menu.new(menu_params)
    
    if @menu.save
      redirect_to(@menu, :notice => 'Cardápio salvo com sucesso.')
    else
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @menu.update(menu_params)
      redirect_to(@menu, :notice => 'O cardápio foi atualizado com sucesso')
    else
      render :action => "edit"
    end
  end

  def destroy
    @menu.destroy
    redirect_to menus_url
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
