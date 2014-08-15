# -*- encoding : utf-8 -*-
class MealsController < ApplicationController

  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  def index
    @meals = Meal.all
  end

  def show
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      redirect_to(@meal, :notice => 'Refeição adicionada com sucesso.')
    else
      render :action => "new"

    end
  end

  def edit
  end

  def update
    if @meal.update(meal_params)
      redirect_to(@meal, :notice => 'A refeição foi atualizada com sucesso.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @meal.destroy
    redirect_to meals_url
  end

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:name, :cost)
  end

end
