# -*- encoding : utf-8 -*-
module Api
  class CampusunitsController < ApplicationController
    
    before_action :set_campusunit , only: [:show, :edit, :update, :destroy]
    
    class Campusunit < ::Campusunit
      def as_json(options ={})
        super.to_s.gsub(/\\u([0-9a-z]{4})/) {|s| [$1.to_i(16)].pack("U")}
      end
    end

    respond_to :json

    def index
      respond_with Campusunit.all
    end

    def show
      @campusunit = Campusunit.find(params[:id])
      respond_with @campusunit
    end

    def new
      @campusunit = Campusunit.new
      respond_with @campusunit
    end

    def create
      @campusunit = Campusunit.new(campusunit_params)
      if @campusunit.save
        respond_with @campusunit
      else
        respond_with @campusunit.errors
      end
    end

    def edit
      respond_with Campusunit.find(params[:id])
    end

    def update
      @campusunit = Campusunit.find(params[:id])
      if @campusunit.update_attributes(campusunit_params)
        respond_with :no_content
      else
        respond_with @campusunit.errors
      end
    end

    def destroy
      @campusunit = Campusunit.find(params[:id])
      @campusunit.destroy
      respond_with :no_content
    end

    private

    def set_campusunit
      @campusunit = Campusunit.find(params[:id])
    end

    def campusunit_params
      params.require(:campusunit).permit(:name, :address)
    end

  end

end

