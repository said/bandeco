# -*- encoding : utf-8 -*-
module Api
class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all

    respond_to do |format|
      format.html #index.html.erb
      format.xml { render :xml => @restaurants }
      format.json {render :json => @restaurants.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")} }
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    # descobrindo a segunda-feira e o domingo
    @monday = Date.today.beginning_of_week()
    @sunday = @monday + 6

    @menus = Menu.where(:restaurant_id => @restaurant.id).where(:day => (@monday)..(@sunday)).order('meal_id ASC, day ASC')

   respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => {:restaurant => @restaurant, :menus => @menus} }
      format.json { render :json => {:restaurant => @restaurant, :menus => @menus}.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")} }
      format.json { render :json => {:restaurant => @restaurant, :menus => @menus}.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")}, :callback => :params[:callback] }
    end
  end

  def new
    @restaurant = Restaurant.new

    respond_to do |format|
      format.html #new.html.erb
      format.json { render :json => @restaurant.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")} }
    end
  end

  def create
    @restaurant = Restaurant.new(params[:restaurant])

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to(@restaurant,
                      :notice => 'Restaurante adicionado com sucesso.') }
        format.json { render :json => @restaurant.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")},
                      :status => :created, :location => @restaurant }
      else
        format.html { render :action => "new" }
        format.json { render :json => @restaurant.errors.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")},
                      :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      if @restaurant.update_attributes(params[:restaurant])
        format.html { redirect_to(@restaurant,
                      :notice => 'O restaurante foi atualizado com sucesso.')}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @restaurant.errors.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")},
                      :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to restaurants_url }
      format.json { head :no_content }
    end
  end

end
end