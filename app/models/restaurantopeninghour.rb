# -*- encoding : utf-8 -*-
class Restaurantopeninghour < ActiveRecord::Base
  attr_accessible :close, :open, :wday, :restaurant_id, :meal_id 
  
  validates_presence_of :restaurant_id, :meal_id, :wday, :open, :close
  
  belongs_to :restaurant
  belongs_to :meal
end
