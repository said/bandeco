# -*- encoding : utf-8 -*-
class PlacescategoriesController < ApplicationController
  def index
    @campusunit = Campusunit.all      
    @placescategories = Placescategory.all
    
    respond_to do |format|
      format.html #index.html.erb
      format.xml { render :xml => @placescategories }
      format.json {render :json => @placescategories.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")} }
    end
  end

  def show
    @campusunit = Campusunit.all
    @placescategory = Placescategory.find(params[:id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => {:placescategory => @placescategory} }
      format.json { render :json => {:placescategory => @placescategory}.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")} }
    end
  end

  def new
    @campusunit = Campusunit.all
    @placescategory = Placescategory.new
    
    respond_to do |format|
      format.html #new.html.erb
      format.json { render :json => @placescategory.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")} }
    end
  end

  def create
    @campusunit = Campusunit.all
    @placescategory = Placescategory.new(params[:placescategory])
    
    respond_to do |format|
      if @placescategory.save
        format.html { redirect_to(@placescategory,
                      :notice => 'Categoria de local adicionado com sucesso.') }
        format.json { render :json => @placescategory.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")},
                      :status => :created, :location => @placescategory }
      else
        format.html { render :action => "new" }
        format.json { render :json => @placescategory.errors.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")},
                      :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @campusunit = Campusunit.all
    @placescategory = Placescategory.find(params[:id])
  end

  def update
    @campusunit = Campusunit.all
    @placescategory = Placescategory.find(params[:id])
    
    respond_to do |format|
      if @placescategory.update_attributes(params[:placescategory])
        format.html { redirect_to(@placescategory,
                      :notice => 'O local foi atualizado com sucesso.')}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @placescategory.errors.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")},
                      :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @placescategory = Placescategory.find(params[:id])
    @placescategory.destroy
    
    respond_to do |format|
      format.html { redirect_to placescategoryscategories_url }
      format.json { head :no_content }
    end
  end

end
