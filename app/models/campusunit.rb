class Campusunit < ActiveRecord::Base
  #attr_accessible :name, :address
  
  #validates_presence_of :name

  has_many :restaurants
  has_many :places
end
