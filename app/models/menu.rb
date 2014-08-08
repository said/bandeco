# -*- encoding : utf-8 -*-
class Menu < ActiveRecord::Base

  validates_presence_of :restaurant_id, :meal_id, :day

  belongs_to :restaurant
  belongs_to :meal
  has_many :menuscomments
end
