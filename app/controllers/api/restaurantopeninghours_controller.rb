# -*- encoding : utf-8 -*-
module Api
class RestaurantopeninghoursController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @meals = Meal.all
    @restaurantopeninghours = Restaurantopeninghour.all

    respond_to do |format|
      format.html #index.html.erb
      format.xml { render :xml => @restaurantopeninghours }
      format.json {render :json => @restaurantopeninghours.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")} }
    end
  end

  def show
    @restaurantopeninghour = Restaurantopeninghour.find(params[:id])

    @restaurant = Restaurant.where(:id => @restaurantopeninghour.restaurant_id).first
    @meal = Meal.where(:id => @restaurantopeninghour.meal_id).first

    respond_to do |format|
      format.html #show.html.erb
      format.xml { render :xml => {:restaurant => @restaurant, :meal => @meal, :restaurantopeninghour => @restaurantopeninghour} }
      format.json { render :json => {:restaurant => @restaurant, :meal => @meal, :restaurantopeninghour => @restaurantopeninghour}.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")} }
    end
  end

  def new
    @restaurants = Restaurant.all
    @meals = Meal.all
    @restaurantopeninghour = Restaurantopeninghour.new

    respond_to do |format|
      format.html #new.html.erb
      format.json { render :json => @restaurantopeninghour.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")} }
    end
  end

  def create
    @restaurants = Restaurant.all
    @meals = Meal.all
    @restaurantopeninghour = Restaurantopeninghour.new(params[:restaurantopeninghour])

    respond_to do |format|
      if @restaurantopeninghour.save
        format.html { redirect_to(@restaurantopeninghour,
                      :notice => 'Horário salvo com sucesso.')}
        format.json { render :json => @restaurantopeninghour.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")},
                      :status => :created, :location => @restaurantopeninghour }
      else
        format.html { render :action => "new"}
        format.json { render :json => @restaurantopeninghour.errors.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")},
                      :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @restaurants = Restaurant.all
    @meals = Meal.all
    @restaurantopeninghour = Restaurantopeninghour.find(params[:id])
  end

  def update
    @restaurants = Restaurant.all
    @meals = Meal.all
    @restaurantopeninghour = Restaurantopeninghour.find(params[:id])

    respond_to do |format|
      if @restaurantopeninghour.update_attributes(params[:restaurantopeninghour])
        format.html { redirect_to(@restaurantopeninghour,
                      :notice => 'O horário foi atualizado com sucesso')}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @restaurantopeninghour.errors.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")},
                      :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @restaurantopeninghour = Restaurantopeninghour.find(params[:id])
    @restaurantopeninghour.destroy

    respond_to do |format|
      format.html { redirect_to restaurantopeninghours_url }
      format.json { head :no_content }
    end
  end

end
end