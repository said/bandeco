# -*- encoding : utf-8 -*-
module Api
  class MenusController < ApplicationController
    def index
      @restaurants = Restaurant.all
      @meals = Meal.all
      @menus = Menu.all

      respond_to do |format|
      format.html #index.html.erb
      format.xml { render :xml => @menus }
      format.json {render :json => @menus.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")} }
    end
  end

  def show
    @restaurants = Restaurant.all
    @meals = Meal.all
    @menu = Menu.find(params[:id])

    @menuscomments = Menuscomment.where(:menu_id => @menu.id).order('created_at DESC')

    respond_to do |format|
      format.html #show.html.erb
      format.xml { render :xml => {:comments => @menuscomments, :menu => @menu} }
      format.json { render :json => {:comments => @menuscomments, :menu => @menu}.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")} }
    end
  end

  def new
    @restaurants = Restaurant.all
    @meals = Meal.all
    @menu = Menu.new

    respond_to do |format|
      format.html #new.html.erb
      format.json { render :json => @menu.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")} }
    end
  end

  def create
    @restaurants = Restaurant.all
    @meals = Meal.all
    @menu = Menu.new(params[:menu])

    respond_to do |format|
      if @menu.save
        format.html { redirect_to(@menu,
          :notice => 'Cardápio salvo com sucesso.')}
        format.json { render :json => @menu.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")},
        :status => :created, :location => @menu }
      else
        format.html { render :action => "new"}
        format.json { render :json => @menu.errors.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")},
        :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @restaurants = Restaurant.all
    @meals = Meal.all
    @menu = Menu.find(params[:id])
  end

  def update
    @restaurants = Restaurant.all
    @meals = Meal.all
    @menu = Menu.find(params[:id])

    respond_to do |format|
      if @menu.update_attributes(params[:menu])
        format.html { redirect_to(@menu,
          :notice => 'O cardápio foi atualizado com sucesso')}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @menu.errors.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")},
        :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy

    respond_to do |format|
      format.html { redirect_to menus_url }
      format.json { head :no_content }
    end
  end

end
end