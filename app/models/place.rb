# -*- encoding : utf-8 -*-
class Place < ActiveRecord::Base
  attr_accessible :placescategory_id, :name, :address, :tel, :latitude, :longitude, :metatags
  
  validates_presence_of :placescategory_id, :name, :address, :latitude, :longitude

  belongs_to :placescategory
end
