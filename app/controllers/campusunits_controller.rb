# -*- encoding : utf-8 -*-
class CampusunitsController < ApplicationController

  before_action :set_campusunit , only: [:show, :edit, :update, :destroy]

  def index
    @campusunits = Campusunit.all
  end

  def show
  end

  def new
    @campusunit = Campusunit.new
  end

  def create
    @campusunit = Campusunit.new(campusunit_params)

    if @campusunit.save
      redirect_to(@campusunit, :notice => 'Campus adicionado com sucesso.')
    else
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @campusunit.update(campusunit_params)
      redirect_to(@campusunit, :notice => 'O Campus foi atualizado com sucesso.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @campusunit.destroy
    redirect_to campusunits_url
  end

  private

  def set_campusunit
    @campusunit = Campusunit.find(params[:id])
  end

  def campusunit_params
    params.require(:campusunit).permit(:name, :address)
  end

end
