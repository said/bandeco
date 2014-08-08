# -*- encoding : utf-8 -*-
class Restaurant < ActiveRecord::Base

  validates_presence_of :name, :address

  has_many :menus
  has_many :openinghours
  has_many :meals
end
