# -*- encoding : utf-8 -*-
class Restaurantopeninghour < ActiveRecord::Base

  validates_presence_of :restaurant_id, :meal_id, :wday, :open, :close

  belongs_to :restaurant
  belongs_to :meal
end
