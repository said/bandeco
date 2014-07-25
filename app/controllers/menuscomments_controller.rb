# -*- encoding : utf-8 -*-
class MenuscommentsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @meals = Meal.all
    @menus = Menu.all
    @menuscomments = Menuscomment.all
    
    respond_to do |format|
      format.html #index.html.erb
      format.xml { render :xml => @menuscomments }
      format.json { render :json => @menuscomments.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")} }
    end
  end

  def show
    @menuscomment = Menuscomment.find(params[:id])
    
    @menu = Menu.find(:first, :conditions => { :id => @menuscomment.menu_id})
    
    respond_to do |format|
      format.html #show.html.erb
      format.xml { render :xml => {:menu => @menu, :menuscomment => @menuscomment} }
      format.json { render :json => {:menu => @menu, :menuscomment => @menuscomment}.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")} }
    end
  end

  def new
    @menus = Menu.all
    @menuscomment = Menuscomment.new
    
    respond_to do |format|
      format.html #new.html.erb
      format.json { render :json => @menuscomment.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")} }
    end
  end

  def create    
    @menuscomment = Menuscomment.new(params[:menuscomment])
    
    respond_to do |format|
      if @menuscomment.save
        format.html { redirect_to(@menuscomment,
                      :notice => 'Comentário enviado com sucesso.')}
        format.json { render :json => @menuscomment.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")},
                      :status => :created, :location => @menuscomment }
      else
        format.html { render :action => "new"}
        format.json { render :json => @menuscomment.errors.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")},
                      :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @restaurants = Restaurant.all
    @meals = Meal.all
    @menus = Menus.all
    @menuscomment = Menuscomment.find(params[:id])
  end

  def update
    @restaurants = Restaurant.all
    @meals = Meal.all
    @menus = Menu.all
    @menuscomment = Menuscomment.find(params[:id])
    
    respond_to do |format|
      if @menuscomment.update_attributes(params[:menuscomment])
        format.html { redirect_to(@menuscomment,
                      :notice => 'O comentário foi atualizado com sucesso')}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @menuscomment.errors.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")},
                      :status => :unprocessable_entity }
      end
    end    
  end

  def destroy
    @menuscomment = Menuscomment.find(params[:id])
    @menuscomment.destroy
    
    respond_to do |format|
      format.html { redirect_to menuscomments_url }
      format.json { head :no_content }
    end
  end

end
