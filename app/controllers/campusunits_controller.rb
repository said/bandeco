# -*- encoding : utf-8 -*-
class CampusunitsController < ApplicationController
  def index
    @campusunits = Campusunit.all
    
    respond_to do |format|
      format.html #index.html.erb
      format.xml { render :xml => @campusunits }
      format.json {render :json => @campusunits.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")} }
    end
  end

  def show
    @campusunit = Campusunit.find(params[:id])
    
   respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => {:campusunit => @campusunit} }
      format.json { render :json => {:campusunit => @campusunit}.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")} }
    end
  end

  def new
    @campusunit = Campusunit.new
    
    respond_to do |format|
      format.html #new.html.erb
      format.json { render :json => @campusunit.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")} }
    end
  end

  def create
    @campusunit = Campusunit.new(params[:campusunit])
    
    respond_to do |format|
      if @campusunit.save
        format.html { redirect_to(@campusunit,
                      :notice => 'Campus adicionado com sucesso.') }
        format.json { render :json => @campusunit.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")},
                      :status => :created, :location => @campusunit }
      else
        format.html { render :action => "new" }
        format.json { render :json => @campusunit.errors.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")},
                      :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @campusunit = Campusunit.find(params[:id])
  end

  def update
    @campusunit = Campusunit.find(params[:id])
    
    respond_to do |format|
      if @campusunit.update_attributes(params[:campusunit])
        format.html { redirect_to(@campusunit,
                      :notice => 'O Campus foi atualizado com sucesso.')}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @campusunit.errors.to_json.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")},
                      :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @campusunit = Campusunit.find(params[:id])
    @campusunit.destroy
    
    respond_to do |format|
      format.html { redirect_to campusunits_url }
      format.json { head :no_content }
    end
  end

end
