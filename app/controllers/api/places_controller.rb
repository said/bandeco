# -*- encoding : utf-8 -*-
module Api
class PlacesController < ApplicationController
  def index
    @placescategories = Placescategory.all
    @places = Place.all

    respond_to do |format|
      format.html #index.html.erb
      format.xml { render :xml => @places }
      format.json {render :json => @places.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")} }
    end
  end

  def show
    @placescategories = Placescategory.all
    @place = Place.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => {:place => @place} }
      format.json { render :json => {:place => @place}.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")} }
    end
  end

  def new
    @placescategories = Placescategory.all
    @place = Place.new

    respond_to do |format|
      format.html #new.html.erb
      format.json { render :json => @place.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")} }
    end
  end

  def create
    @placescategories = Placescategory.all
    @place = Place.new(params[:place])

    respond_to do |format|
      if @place.save
        format.html { redirect_to(@place,
                      :notice => 'Local adicionado com sucesso.') }
        format.json { render :json => @place.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")},
                      :status => :created, :location => @place }
      else
        format.html { render :action => "new" }
        format.json { render :json => @place.errors.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")},
                      :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @placescategories = Placescategory.all
    @place = Place.find(params[:id])
  end

  def update
    @placescategories = Placescategory.all
    @place = Place.find(params[:id])

    respond_to do |format|
      if @place.update_attributes(params[:place])
        format.html { redirect_to(@place,
                      :notice => 'O local foi atualizado com sucesso.')}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @place.errors.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")},
                      :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    respond_to do |format|
      format.html { redirect_to places_url }
      format.json { head :no_content }
    end
  end

end
end