# -*- encoding : utf-8 -*-
class Meal < ActiveRecord::Base
  attr_accessible :cost, :name
  
  validates_presence_of :name

  has_many :menus
  has_many :openinghours
end
