# -*- encoding : utf-8 -*-
class Restaurant < ActiveRecord::Base

  validates_presence_of :campusunit_id, :name, :address

  belongs_to :campusunit
  has_many :menus
  has_many :openinghours
  has_many :meals
end
