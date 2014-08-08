class Campusunit < ActiveRecord::Base

  validates_presence_of :name

  has_many :restaurants
  has_many :places
end
