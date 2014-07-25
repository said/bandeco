# -*- encoding : utf-8 -*-
class MealsController < ApplicationController
  def index
    @meals = Meal.all
    
    respond_to do |format|
      format.html #index.html.erb
      format.xml { render :xml => @meals }
      format.json {render :json => @meals.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")} }
    end
  end

  def show
    @meal = Meal.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @meal }
      format.json { render :json => @meal.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")} }
    end
  end

  def new
    @meal = Meal.new
    
    respond_to do |format|
      format.html #new.html.erb
      format.json { render :json => @meal.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")} }
    end
  end

  def create
    @meal = Meal.new(params[:meal])
    
    respond_to do |format|
      if @meal.save
        format.html { redirect_to(@meal,
                      :notice => 'Refeição adicionada com sucesso.') }
        format.json { render :json => @meal.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")},
                      :status => :created, :location => @meal }
      else
        format.html { render :action => "new" }
        format.json { render :json => @meal.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:id])
    
    respond_to do |format|
      if @meal.update_attributes(params[:meal])
        format.html { redirect_to(@meal,
                      :notice => 'A refeição foi atualizada com sucesso.')}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @meal.errors.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")},
                      :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
    
    respond_to do |format|
      format.html { redirect_to meals_url }
      format.json { head :no_content }
    end
  end

end
